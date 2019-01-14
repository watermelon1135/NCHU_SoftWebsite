package com.nchu.software.mailbox.entity;

import lombok.Data;

/**
 * @ClassName ReplyEntity
 * @Description 回复时向前台拿数据实体类
 * @Auther 范孝发
 * @Date 2019/1/8 14:05
 * @Version 1.0
 */
@Data
public class ReplyEntity {

    private String mailboxAskId;          //问题编号
    private String mailboxType;           //问题类型（1书记，2院长）
    private String context;                //回复内容
    private String oldFlag;               //更新前标记
    private String newFlag;               //更新后标记

}
