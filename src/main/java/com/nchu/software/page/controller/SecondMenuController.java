package com.nchu.software.page.controller;

import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IPageContentService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    ISecondMenuService service;

    @Autowired
    IPageContentService pageService;


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
    @RequestMapping("/xygk/{firstId}/{secondId}")
    public ModelAndView show(@PathVariable Integer firstId,@PathVariable Integer secondId, ModelAndView mv){
        List<SecondMenuEntity> sms = service.getSecondMenuByFirstId(firstId);
        PageContentEntity pagecontext = pageService.getContextBySecondId(secondId);

        String firstMenuName = service.getFirstMenuName(firstId);
        mv.addObject("twoMenus",sms);
        mv.addObject("firstMenu",firstMenuName);
        mv.addObject("pagecontext",pagecontext);

        mv.setViewName("SecondaryA");
        return mv;
    }
}
