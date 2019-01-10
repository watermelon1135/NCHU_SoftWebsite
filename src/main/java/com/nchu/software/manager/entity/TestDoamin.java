package com.nchu.software.manager.entity;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName test
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2018/12/26 14:34
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/26 14:34
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Data
public class TestDoamin {
    private int id;
    private String name;

    //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

}
