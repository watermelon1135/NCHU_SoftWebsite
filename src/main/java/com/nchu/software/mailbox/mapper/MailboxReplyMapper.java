package com.nchu.software.mailbox.mapper;

import com.nchu.software.mailbox.entity.MailboxReplyEntity;
import org.springframework.stereotype.Repository;

/**
 * @ClassName MailboxReplyMapper
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/7 20:28
 * @Version 1.0
 */
@Repository
public interface MailboxReplyMapper {
    int insertMailboxReply(MailboxReplyEntity mailboxReplyEntity);
    MailboxReplyEntity getMailboxReplyEntity(int mailboxAskId);
}
