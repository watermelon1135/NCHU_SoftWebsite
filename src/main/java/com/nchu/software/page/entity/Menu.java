package com.nchu.software.page.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.*;

/**
 * @ClassName Menu
 * @Description TODO
 * @author 范孝发
 * @Date 2019/1/6 11:48
 * @Version 1.0
 */

@Data
public class Menu {


    private FirstMenuEntity firstMenu;    // 一级菜单对象
    private List list;             //二级菜单列表

}
