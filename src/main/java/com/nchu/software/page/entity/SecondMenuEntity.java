package com.nchu.software.page.entity;

import lombok.Data;

/**
 * @ClassName SecondLevelMenu
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 9:21
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 9:21
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class SecondMenuEntity {
    /**
     * secondMenuId:二级菜单编号
     * firstMenuId:一级菜单编号
     * secondMenuName:二级菜单名称
     * secondMenuUrl:二级菜单URL
     */
    Long secondMenuId;
    Long firstMenuId;
    String secondMenuName;
    String secondMenuUrl;
}
