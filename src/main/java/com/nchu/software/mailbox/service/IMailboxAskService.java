package com.nchu.software.mailbox.service;

import com.nchu.software.mailbox.entity.*;

import java.util.List;

/**
 * @ClassName IMailboxAskService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/7 20:31
 * @Version 1.0
 */
public interface IMailboxAskService {
    void insertMailBox(MailboxAskEntity askAuthor);
    List<MailboxAskHot> selectHot();
    MailboxAskEntity selectByQueryCode(String queryCode);
    MailboxReplyEntity getMailboxReplyEntity(Integer mailboxAskId);
    void updateCount(Integer mailboxid);
    List<MailboxListEntity> selectList();
    MailboxAskEntity selectDetailById(Integer mailboxid);
    void commit(Commit commit);
    List<MailboxAskType> selectTypeList();
    String selectTypeNameById(Integer mailboxasktypeid);
    List<MailboxListEntity> queryByKeyword(String keyword); //根据搜索进行模糊查询

    List<MailboxAskHeadEntity> listAll(int mailboxType, int flag);
    MailboxAskEntity getMailboxAskEntity(int mailboxAskId);
    int updateFlag(int mailboxAskId, int flag);
}
