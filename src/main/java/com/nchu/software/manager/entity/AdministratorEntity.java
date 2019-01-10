package com.nchu.software.manager.entity;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName AdministratorEntity
 * @Description: java类作用描述
 * @Author: Taodada
 * @CreateDate: 2019/1/9 18:03
 * @UpdateUser:Taodada
 * @UpdateDate: 2019/1/9 18:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class AdministratorEntity {
    int id;
    String username;
    String password;
    String name;
    String telephone;
    Date createTime;
}
