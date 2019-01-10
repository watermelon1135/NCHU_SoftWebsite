package com.nchu.software.manager.controller;

import com.nchu.software.manager.entity.AdministratorEntity;
import com.nchu.software.manager.service.IAdministratorService;
import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.Menu;
import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.service.IFirstMenuService;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.nchu.software.commons.util.ThisSystemUtil.md5;

/**
 * @ClassName AdminController
 * @Description: java类作用描述
 * @Author: Taodada
 * @CreateDate: 2018/1/9 12:00
 * @UpdateUser: Taodada
 * @UpdateDate: 2018/1/9 12:00
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Controller
public class AdminController {


    @Autowired
    IFirstMenuService firstMenuService;
    @Autowired
    ISecondMenuService secondMenuService;
    @Autowired
    IAdministratorService administratorService;

    @RequestMapping(path = "/administration",method = RequestMethod.POST)
    public String index(String username, String password, HttpSession session, HttpServletRequest request){
        //通过用户名查询管理员信息
        AdministratorEntity administratorEntity = administratorService.findUserByUsername(username);
        //加密
        String password2 = md5(password);
        //判断用户名或密码是否正确
        if(administratorEntity == null || !password2.equals(administratorEntity.getPassword())){
            request.setAttribute("username",username);
            request.setAttribute("msg","用户名或密码不正确!!");
            return "forward:/index";
        }
        //加载管理员界面信息
        InitTopConetnt(session);
        session.setAttribute("AdminName",username);
        return "Administration";
    }


    private void InitTopConetnt(HttpSession session){
        //管理员界面一级菜单名数组
        String[] firstMenuNmaes={"党务院务","人才培养","科学研究","工会工作","招生就业","建议信箱"};

        //根据一级菜单名称查询一级菜单信息
        List<FirstMenuEntity> firstMenus = new ArrayList<>();
        for(int i = 0;i < firstMenuNmaes.length;i++){
            FirstMenuEntity firstMenu = firstMenuService.getFirstMenuByName(firstMenuNmaes[i]);
            firstMenus.add(firstMenu);
        }
        List<Menu> menus = new ArrayList<>();
        for(int i = 0;i < firstMenus.size();i ++){
            //根据一级菜单id查询所有二级菜单信息
            List<SecondMenuEntity> twoMenu = secondMenuService.getSecondMenuByFirstId(firstMenus.get(i).getFirstMenuId());
            Menu menu = new Menu();
            menu.setFirstMenu(firstMenus.get(i));
            if (twoMenu != null) {
                menu.setList(twoMenu);
            }
            menus.add(menu);
        }
        session.setAttribute("adminMenus",menus);
    }
}
