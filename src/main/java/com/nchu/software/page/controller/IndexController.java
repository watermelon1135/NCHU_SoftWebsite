package com.nchu.software.page.controller;

import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName IndexController
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 14:50
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 14:50
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class IndexController {

    @Autowired
    IFirstMenuService firstMenuService;
    @Autowired
    ISecondMenuService secondMenuService;

    //@RequestMapping(value = "/top")

    @RequestMapping("/index")
    public String index(){

        return "redirect:/index.jsp";
    }
}
