package com.nchu.software.page.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.entity.Pages;
import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.IPageContentHeadService;
import com.nchu.software.page.service.IPageContentService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName RecycleController
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/10 18:58
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/10 18:58
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/

@Controller
public class RecycleController {
    @Autowired
    ISecondMenuService secondMenuService;

    @Autowired
    IPageContentService pageService;

    @Autowired
    IFirstMenuService firstMenuService;

    @Autowired
    IPageContentHeadService headService;

    @ResponseBody
    @RequestMapping(path = "/admin/addToRecycle/{pageId}")
    public String AddRecycle(@PathVariable Integer pageId, HttpServletResponse response){
        //response.setContentType("text/html; charset=utf-8");
        int result=pageService.addToRecycle(pageId);
        if (result > 0){
            return "加入回收站成功！可在回收站查看";
        }else {
            return "加入回收站失败！";
        }

    }

    @ResponseBody
    @RequestMapping(path = "/admin/removeToRecycle/{pageId}")
    public String removeRecycle(@PathVariable Integer pageId){
        //response.setContentType("text/html; charset=utf-8");
        int result=pageService.removeToRecycle(pageId);
        if (result > 0){
            return "恢复成功！可在列表查看";
        }else {
            return "恢复失败！";
        }

    }

    @RequestMapping("/admin/recycleList")
    public ModelAndView recycleList(@RequestParam(required = false) Integer pagenum,
                                    HttpServletRequest request,ModelAndView mv){
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        pages.setPageSize(10);
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
        List<PageContentEntity> pageContentEntities = pageService.listRecycle();
        //System.out.println(page.getStartRow());
        //System.out.println(page.getEndRow());
        int maxPageNum=(int) Math.ceil(page.getTotal()*1.0/pages.getPageSize());
        if (pagenum !=null && pagenum>maxPageNum){
            pages.setPageNum(maxPageNum);
            page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
            pageContentEntities = pageService.listRecycle();
        }
        System.out.println(maxPageNum);
        pages.setPageNumAll((long)maxPageNum);
        mv.addObject("pagecontexts",pageContentEntities);
        mv.addObject("pages",pages);
        mv.addObject("curr",request.getRequestURI());
       // System.out.println(request.getRequestURI());
      //  System.out.println(request.getRequestURL());
        mv.addObject("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        mv.addObject("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        mv.setViewName("management/Recycle");
        return mv;
    }
}
