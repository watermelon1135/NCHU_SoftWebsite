package com.nchu.software.page.controller;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.PageContextEntity;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IPageContextService;
import com.nchu.software.page.service.ISecondMenuService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.soap.SOAPBinding;
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

    @Autowired
    IPageContextService pageService;


    @RequestMapping("/xygk/{firstId}/{secondId}")
    public ModelAndView show(@PathVariable Integer firstId,@PathVariable Integer secondId, ModelAndView mv){
        List<SecondMenuEntity> sms = service.getSecondMenuByFirstId(firstId);
        PageContextEntity pagecontext = pageService.getContextBySecondId(secondId);

        String firstMenuName = service.getFirstMenuName(firstId);
        mv.addObject("twoMenus",sms);
        mv.addObject("firstMenu",firstMenuName);
        mv.addObject("pagecontext",pagecontext);

        mv.setViewName("SecondaryA");
        return mv;
    }
}
