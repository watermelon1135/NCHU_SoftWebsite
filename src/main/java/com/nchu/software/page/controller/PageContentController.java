package com.nchu.software.page.controller;

import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.service.IPageContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageContentController {

    @Autowired
    IPageContentService pageContentService;

    @RequestMapping("item/{pageId}")
    public ModelAndView showPageContent(@PathVariable Long pageId, ModelAndView mv) {
        PageContentEntity pageContextEntity = pageContentService.getPageContentById(pageId);
        pageContentService.updateIncrementCount(pageId);
        mv.addObject("pagecontext",pageContextEntity);
        mv.setViewName("SecondaryD");
        return mv;
    }

}
