package com.nchu.software.page.entity;

import lombok.Data;

import java.util.List;

/**
 * @ClassName Menu
 * @Description TODO
 * @author 范孝发
 * @Date 2019/1/6 11:48
 * @Version 1.0
 */

@Data
public class Menu {
    /**
     * firstMenu:一级菜单对象
     * list:二级菜单列表
     */
    private FirstMenuEntity firstMenu;
    private List list;

}
