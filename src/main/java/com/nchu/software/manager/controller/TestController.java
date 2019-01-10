package com.nchu.software.manager.controller;

import com.nchu.software.manager.entity.TestDoamin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName test
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2018/12/25 14:24
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/25 14:24
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class TestController {

    @RequestMapping(value = "/test",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String test(TestDoamin t){
        System.out.println(t);
        return t.toString();
    }

    @RequestMapping("/testpojo")
    public String test1(Model model, @ModelAttribute("ss") TestDoamin aa){
        //aa.setId(1);
        //aa.setDate(new Date());
        System.out.println(aa.getName());

      //  model.addAttribute("aa",aa);
        return "test/pojo";
    }
}
