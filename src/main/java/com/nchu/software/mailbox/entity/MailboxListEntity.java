package com.nchu.software.mailbox.entity;

import lombok.Data;

import java.util.Date;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 用户列表显示数据所需的类
 * @create 2019-01-09 15:47
 */
@Data
public class MailboxListEntity {
    private Integer mailboxAskId; //提问id
    private String askName; //提问者姓名
    private String title; //标题
    private String context; //提问内容
    private String mailboxTypeName; //提问类型
    private Date askTime; //提问时间
    private Integer readCount; //阅读次数
    private Date replyTime; //回复时间
}
