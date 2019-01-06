package com.nchu.software.Page.entity;

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
    int secondeMenuId;
    int firstMenuId;
    String secondeMenuName;
    String secondeMenuUrl;
}
