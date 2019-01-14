package com.nchu.software.mailbox.service;

import com.nchu.software.mailbox.entity.MailboxReplyEntity;

/**
 * @ClassName IMailboxReplyService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/7 20:32
 * @Version 1.0
 */
public interface IMailboxReplyService {
    int insertMailboxReply(MailboxReplyEntity mailboxReplyEntity);
    MailboxReplyEntity getMailboxReplyEntity(int mailboxAskId);
}
