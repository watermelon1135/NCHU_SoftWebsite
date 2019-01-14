package com.nchu.software.mailbox.entity;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName MailboxAskHeadEntity
 * @Description 提问信件头部实体类
 * @Auther 范孝发
 * @Date 2019/1/8 09:12
 * @Version 1.0
 */

@Data
public class MailboxAskHeadEntity {

    private Integer mailboxAskId;          //问题编号
    private String askName;                //提问人姓名
    private String title;                  //问题标题
    private String context;                //问题内容
    private Integer mailboxType;           //问题类型（1书记，2院长）
    private Date askTime;                  //提问时间
    private Integer readCount;             //阅读次数
    private Integer flag;                  //标志位（1管理员未读，2可以显示，3不可显示）

}
