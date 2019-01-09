package com.nchu.software.page.entity;

import lombok.Data;

/**
 * @ClassName FirstLevelMenu
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 9:09
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 9:09
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class FirstMenuEntity {
    /**
     * firstMenuId:一级菜单编号
     * firstMenuName:一级菜单名称
     * firstMenuUrl:一级菜单URL
     * firstMenuFlag:显示标识
     */
    Long firstMenuId;
    String firstMenuName;
    String firstMenuUrl;
    int firstMenuFlag;
}
