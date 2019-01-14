package com.nchu.software.mailbox.entity;

import lombok.Data;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 提交字段，用于传输表单提交的数据
 * @create 2019-01-07 14:42
 */
@Data
public class SubmitVo {
    private String askName; //姓名
    private String title; //标题
    private String context; //内容
    private String mailboxtype; //类型
    private String mailbox; //邮箱
    private String phone; //号码
    private String nameFlag; //是否匿名
}
