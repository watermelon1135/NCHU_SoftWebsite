package com.nchu.software.Page.entity;

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
    int firstMenuId;
    String firstMenuName;
    String firstMenuUrl;
    int firstMenuFlag;
}
