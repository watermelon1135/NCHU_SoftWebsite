package com.nchu.software.page.controller;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.Menu;
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
import java.util.List;

/**
 * @ClassName IndexController
 * @Description: 处理请求主页的请求
 * @Author: watermelon
 * @CreateDate: 2019/1/6 14:50
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 14:50
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class IndexController {

    /**
     * 新闻公告显示的条数
     */
    private static final int TOTAL_NEWS = 4;

    /**
     * 相对应的4个快捷按钮
     */
    private static final String MENU1 = "工会工作";
    private static final String MENU2 = "办事指南";
    private static final String MENU3 = "人才培养";
    private static final String MENU4 = "招生就业";

    /**
     * 主页面中快捷栏中最多显示多少条数据
     */
    private static final int TOTAL_PAGE = 11;

    /**
     * 主页面中五个快捷栏名字
     */
    private static final String GENERAL0 = "学院新闻";
    private static final String GENERAL1 = "通知公告";
    private static final String GENERAL2 = "支部建设";
    private static final String GENERAL3 = "科研获奖";
    private static final String GENERAL4 = "招生信息";



    @Autowired
    IFirstMenuService firstMenuService;
    @Autowired
    ISecondMenuService secondMenuService;
    @Autowired
    IPageContentHeadService pageContentHeadService;

    /**
     * 处理index请求
     * @author    watermelon
     * @param
     * @return    java.lang.String
     * @exception
     * @date        2019/1/6 22:02
    */

    @RequestMapping({"/index"," ","/"})
    public String index(HttpSession session,Model model){
        //if (session.getAttribute("menus") == null){
            InitTopConetnt(session);
      //  }
        SecondMenuEntity news = queryTwoMenu(GENERAL0);
        List newsHeads = queryNew(news.getSecondMenuId(), TOTAL_NEWS);
        model.addAttribute("news",news);
        model.addAttribute("newsHeads",newsHeads);

        SecondMenuEntity inform = queryTwoMenu(GENERAL1);
        List informHeads = queryNew(inform.getSecondMenuId(), TOTAL_PAGE);
        model.addAttribute("inform",inform);
        model.addAttribute("informHeads",informHeads);

        SecondMenuEntity party = queryTwoMenu(GENERAL2);
        List partyHeads = queryNew(party.getSecondMenuId(), TOTAL_PAGE);
        model.addAttribute("party",party);
        model.addAttribute("partyHeads",partyHeads);

        SecondMenuEntity research = queryTwoMenu(GENERAL3);
        List researchHeads = queryNew(research.getSecondMenuId(), TOTAL_PAGE);
        model.addAttribute("research",research);
        model.addAttribute("researchHeads",researchHeads);

        SecondMenuEntity enroll = queryTwoMenu(GENERAL4);
        List enrollHeads = queryNew(enroll.getSecondMenuId(), TOTAL_PAGE);
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

    /**
     * 第一次访问时 将页面中头部jsp数据放入session
     * @author  watermelon
     * @param session
     * @return
     * @exception
     * @date   2019/1/7 22:29
    */
    private void InitTopConetnt(HttpSession session){
        List<FirstMenuEntity> firstMenus = firstMenuService.listAll();
        List<Menu> menus = new ArrayList<>();
        for(int i = 0;i < firstMenus.size();i ++){
            List<SecondMenuEntity> twoMenu = secondMenuService.getSecondMenuByFirstId(firstMenus.get(i).getFirstMenuId());
            Menu menu = new Menu();
            menu.setFirstMenu(firstMenus.get(i));
            if (twoMenu != null) {
                menu.setList(twoMenu);
            }
            menus.add(menu);
        }
        session.setAttribute("menus",menus);
    }


    private FirstMenuEntity queryFirstMenu(String name){
        return firstMenuService.getFirstMenuByName(name);
    }



    private SecondMenuEntity queryTwoMenu(String name){
        return secondMenuService.getSecondMenuByName(name);
    }


    private List queryNew(Long id, Integer number){
        return pageContentHeadService.listPageContentHeadBySecondId(id,number);
    }

}
