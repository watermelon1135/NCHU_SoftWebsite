package com.nchu.software.page.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.entity.Pages;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.IPageContentHeadService;
import com.nchu.software.page.service.IPageContentService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName SecondMenuController
 * @Description: 处理二级页面的请求
 * @Author: watermelon
 * @CreateDate: 2019/1/6 10:54
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 10:54
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class SecondMenuController {

    @Autowired
    ISecondMenuService secondMenuService;

    @Autowired
    IPageContentService pageService;

    @Autowired
    IFirstMenuService firstMenuService;

    @Autowired
    IPageContentHeadService headService;

    /**
     * 使用Restful风格 传参
     * 通过一级菜单Id和二级菜单
     * @author watermelon
     * @param firstId
     * @param secondId
     * @param mv
     * @return org.springframework.web.servlet.ModelAndView
     * @exception
     * @date  2019/1/6 22:04
    */
    @RequestMapping({"/xygk/{firstId}/{secondId}","/zsjy/{firstId}/{secondId}",
            "/kxyj/{firstId}/{secondId}", "/ghgz/{firstId}/{secondId}",
            "/bszn/{firstId}/{secondId}", "/rcpy/{firstId}/{secondId}",
            "/dwyw/{firstId}/{secondId}","/jyxx/{firstId}/{secondId}"})
    public ModelAndView showViewById(@PathVariable Long firstId,@PathVariable Long secondId,
                                 @RequestParam(required = false)Integer pagenum,ModelAndView mv){
        List<SecondMenuEntity> secondMenus = secondMenuService.getSecondMenuByFirstId(firstId);
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize(), true);
        List<PageContentEntity> pageContentEntities = pageService.listContextsBySecondId(secondId);
        List<Boolean> isNew=new ArrayList<>();
        pages.setPageNumAll((long) Math.ceil(page.getTotal()*1.0/pages.getPageSize()));

        String firstMenuName = secondMenuService.getFirstMenuName(firstId);
        SecondMenuEntity secondMenuEntity = secondMenuService.getSecondMenuBySecondId(secondId);
        mv.addObject("firstMenu",firstMenuName);
        mv.addObject("twoMenus",secondMenus);
        mv.addObject("two",secondMenuEntity);
        if(pageContentEntities.size()==1 && pagenum == null) {
            mv.addObject("pagecontext",pageContentEntities.get(0));
            mv.setViewName("SecondaryA");
        }
        else {
            mv.addObject("pagecontexts",pageContentEntities);
            mv.addObject("pages",pages);
            mv.addObject("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
            mv.addObject("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
            mv.setViewName("SecondaryB");
        }
        return mv;
    }



}
