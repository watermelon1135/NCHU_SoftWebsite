package com.nchu.software.page.controller;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.IPageContentHeadService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * @ClassName IndexController
 * @Description: 处理主页的请求
 * @Author: watermelon
 * @CreateDate: 2019/1/6 14:50
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 14:50
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class IndexController {

    private static final int NUMBER1 = 4;
    private static final int NUMBER2 = 11;
    private static final String GENERAL0 = "学院新闻";
    private static final String GENERAL1 = "通知公告";
    private static final String GENERAL2 = "支部建设";
    private static final String GENERAL3 = "科研获奖";
    private static final String GENERAL4 = "招生信息";
    private static final String MENU1 = "工会工作";
    private static final String MENU2 = "办事指南";
    private static final String MENU3 = "人才培养";
    private static final String MENU4 = "招生就业";


    @Autowired
    IFirstMenuService firstMenuService;
    @Autowired
    ISecondMenuService secondMenuService;
    @Autowired
    IPageContentHeadService headService;

    /**
     * 处理index请求
     * @author    watermelon
     * @param
     * @return    java.lang.String
     * @exception
     * @date        2019/1/6 22:02
    */
    //@RequestMapping("/index")
    //public String index(){
      //  return "redirect:/index1.jsp";
   // }

    @RequestMapping("/index")
    public String index(Model model){
        //toIndexTop(session);

        SecondMenuEntity news = queryTwoMenu(GENERAL0);
        ArrayList newsHeads = queryNew(news.getSecondMenuId(),NUMBER1);
        model.addAttribute("news",news);
        model.addAttribute("newsHeads",newsHeads);

        SecondMenuEntity inform = queryTwoMenu(GENERAL1);
        ArrayList informHeads = queryNew(inform.getSecondMenuId(),NUMBER2);
        model.addAttribute("inform",inform);
        model.addAttribute("informHeads",informHeads);

        SecondMenuEntity party = queryTwoMenu(GENERAL2);
        ArrayList partyHeads = queryNew(party.getSecondMenuId(),NUMBER2);
        model.addAttribute("party",party);
        model.addAttribute("partyHeads",partyHeads);

        SecondMenuEntity research = queryTwoMenu(GENERAL3);
        ArrayList researchHeads = queryNew(research.getSecondMenuId(),NUMBER2);
        model.addAttribute("research",research);
        model.addAttribute("researchHeads",researchHeads);

        SecondMenuEntity enroll = queryTwoMenu(GENERAL4);
        ArrayList enrollHeads = queryNew(enroll.getSecondMenuId(),NUMBER2);
        model.addAttribute("enroll",enroll);
        model.addAttribute("enrollHeads",enrollHeads);

        FirstMenuEntity union = queryFirstMenu(MENU1);
        model.addAttribute("union",union);

        FirstMenuEntity guide = queryFirstMenu(MENU2);
        model.addAttribute("guide",guide);

        FirstMenuEntity foster = queryFirstMenu(MENU3);
        model.addAttribute("foster",foster);

        FirstMenuEntity eap = queryFirstMenu(MENU4);
        model.addAttribute("eap",eap);

        return "forward:/index.jsp";
    }


    private FirstMenuEntity queryFirstMenu(String name){
        return firstMenuService.getFirstMenuByName(name);
    }

    private SecondMenuEntity queryTwoMenu(String name){
        return secondMenuService.getSecondMenuByName(name);
    }

    private ArrayList queryNew(int id, int number){
        return headService.queryNew(id,number);
    }

}
