package com.nchu.software.page.controller;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IPageContextService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName SecondMenuController
 * @Description: java类作用描述
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



    @RequestMapping("/xygk")
    public ModelAndView show(String firstId, ModelAndView mv){
        Integer id = new Integer(firstId);
        List<SecondMenuEntity> sms = service.getSecondMenuByFirstId(id);
        String firstMenuName = service.getFirstMenuName(id);
        mv.addObject("twoMenus",sms);
        mv.addObject("firstMenu",firstMenuName);
        mv.setViewName("SecondaryA");
        return mv;
    }
}
