package com.nchu.software.mailbox.entity;

import lombok.Data;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 信箱提问的类型
 * @create 2019-01-09 13:36
 */
@Data
public class MailboxAskType {
    private Integer mailboxtypeid; //信箱类型编号
    private String mailboxtypename; //信箱类型名称
    //private Integer mailboxtypeflag; //信箱类型名称
}
