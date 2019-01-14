package com.nchu.software.mailbox.entity;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName MailboxReplyEntity
 * @Description 信箱回复实体类
 * @Auther 范孝发
 * @Date 2019/1/7 20:11
 * @Version 1.0
 */

@Data
public class MailboxReplyEntity {
    private Integer mailboxReplyId;      //回复编号
    private Integer mailboxAskId;        //问题编号
    private String context;              //回复内容
    private Date replyTime;              //回复时间
    private String replyAppendix;        //回复附件
    private Integer satisfied;           //满意度
}
