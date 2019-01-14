package com.nchu.software.page.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nchu.software.commons.constant.ManagerMenuNames;
import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.entity.Pages;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.IPageContentHeadService;
import com.nchu.software.page.service.IPageContentService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName PageManagement
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/10 13:29
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/10 13:29
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class PageManagementController {
    @Autowired
    ISecondMenuService secondMenuService;

    @Autowired
    IPageContentService pageService;

    @Autowired
    IFirstMenuService firstMenuService;

    @Autowired
    IPageContentHeadService headService;


    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @RequestMapping({"/admin/xygk/{firstId}/{secondId}","/admin/zsjy/{firstId}/{secondId}",
            "/admin/kxyj/{firstId}/{secondId}", "/admin/ghgz/{firstId}/{secondId}",
            "/admin/bszn/{firstId}/{secondId}", "/admin/rcpy/{firstId}/{secondId}",
            "/admin/dwyw/{firstId}/{secondId}", "/admin/jyxx/{firstId}/{secondId}"})
    public ModelAndView showPageDetail(@PathVariable Long firstId, @PathVariable Long secondId,
                                       HttpServletRequest request,
                                       @RequestParam(required = false)Integer pagenum, ModelAndView mv){
        //List<SecondMenuEntity> secondMenus = secondMenuService.getSecondMenuByFirstId(firstId);
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        pages.setPageSize(5);
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
        List<PageContentEntity> pageContentEntities = pageService.listContextsBySecondId(secondId);
        int maxPageNum=(int) Math.ceil(page.getTotal()*1.0/pages.getPageSize());
        if (pagenum !=null && pagenum>maxPageNum){
            pages.setPageNum(maxPageNum);
            page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
            pageContentEntities = pageService.listRecycle();
        }
        pages.setPageNumAll((long) maxPageNum);
        mv.addObject("pagecontexts",pageContentEntities);
        mv.addObject("pages",pages);
        mv.addObject("curr",request.getRequestURI());
        mv.addObject("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        mv.addObject("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        mv.setViewName("management/Administration");
        return mv;
    }

    /*private void initPages(){

    }*/

    @RequestMapping(value ="/admin/updatecontent/{id}",method = RequestMethod.GET)
    public ModelAndView updateContentById(@PathVariable Long id, ModelAndView modelAndView){
        PageContentEntity pageContentEntity = pageService.getPageContentById(id);
        SecondMenuEntity secondMenuEntity = secondMenuService.getSecondMenuBySecondId(pageContentEntity.getSecondMenuId());

        //System.out.println(secondMenuEntity);
        List<FirstMenuEntity> firstMenuEntities = firstMenuService.listAll();
        modelAndView.addObject("firsts",firstMenuEntities);

        modelAndView.addObject("content",pageContentEntity);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString=null;
        if (pageContentEntity.getUploadTime()!= null){
             dateString  = formatter.format(pageContentEntity.getUploadTime());
        }
        modelAndView.addObject("dateString",dateString);
        modelAndView.addObject("firstMenuId",secondMenuEntity.getFirstMenuId());
        //System.out.println(secondMenuEntity.getFirstMenuId());
        modelAndView.setViewName("updatePage");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/updateContent")
    public String updateContent(PageContentEntity entity){
        System.out.println(entity);
        entity.setUploadTime(new Date());
        pageService.updatePageContent(entity);
        PageContentEntity pageContentEntity = pageService.getPageContentById(entity.getPageContextId());
        String url = "/admin/"+secondMenuService.getSecondMenuBySecondId(entity.getSecondMenuId()).getSecondMenuUrl();

        return "redirect:"+url;
    }

    @RequestMapping("/admin/saveContent")
    public String saveContent(PageContentEntity entity) {

        entity.setUploadTime(new Date());
        pageService.addPageContent(entity);
        String url = secondMenuService.getSecondMenuBySecondId(entity.getSecondMenuId()).getSecondMenuUrl();

        return "redirect:/admin/"+url;
    }

    @RequestMapping("/admin/add")
    public ModelAndView addContent(ModelAndView mv) {
        //管理员界面一级菜单名数组
        String[] firstMenuNmaes=ManagerMenuNames.FIRST_MENU_NAMES;

        //根据一级菜单名称查询一级菜单信息
        List<FirstMenuEntity> firstMenus = new ArrayList<>();
        for(int i = 0;i < firstMenuNmaes.length;i++){
            FirstMenuEntity firstMenu = firstMenuService.getFirstMenuByName(firstMenuNmaes[i]);
            firstMenus.add(firstMenu);
        }
        //List<FirstMenuEntity> firstMenuEntities = firstMenuService.listAllByFlag(1);
        mv.addObject("firsts",firstMenus);
        mv.setViewName("addPage");
        return mv;
    }

    @ResponseBody
    @RequestMapping(path = "/admin/deletePageContent/{pageId}")
    public String deletePageContent(@PathVariable Integer pageId) {
        int result=pageService.deletePageContent(pageId);
        if (result > 0){
            return "删除成功！";
        }else {
            return "删除失败！";
        }
    }

    @ResponseBody
    @RequestMapping("/findSecondMenuList/{id}")
    public List<SecondMenuEntity> getSecondMenu(@PathVariable Long id) {
        List<SecondMenuEntity> secondMenus = secondMenuService.getSecondMenuByFirstId(id);
        return secondMenus;
    }

    @RequestMapping("/admin/search")
    public ModelAndView search(String keyword, HttpServletRequest request,
                               @RequestParam(required = false)Integer pagenum,ModelAndView mv){
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        pages.setPageSize(5);
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
        List<PageContentEntity> pageContentEntities = pageService.listPageContentByKeyword(keyword);
        pages.setPageNumAll((long) Math.ceil(page.getTotal()*1.0/pages.getPageSize()));
        mv.addObject("pagecontexts",pageContentEntities);
        mv.addObject("pages",pages);
        mv.addObject("keyword",keyword);
        mv.addObject("curr",request.getRequestURI());
      //  System.out.println(request.getRequestURI());
        mv.addObject("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        mv.addObject("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        mv.setViewName("management/Administration");
        return mv;

        //return modelAndView;
    }




}
