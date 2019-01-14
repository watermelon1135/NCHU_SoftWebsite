package com.nchu.software.mailbox.service.impl;

import com.nchu.software.mailbox.entity.*;
import com.nchu.software.mailbox.mapper.MailboxAskMapper;
import com.nchu.software.mailbox.mapper.MailboxReplyMapper;
import com.nchu.software.mailbox.service.IMailboxAskService;
import com.nchu.software.mailbox.service.IMailboxReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName MailboxServiceImpl
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/8 09:27
 * @Version 1.0
 */
@Service
public class MailboxServiceImpl implements IMailboxAskService,IMailboxReplyService {

    @Autowired
    private MailboxAskMapper mailboxAskMapper;

    @Autowired
    private MailboxReplyMapper mailboxReplyMapper;

    @Override
    public void insertMailBox(MailboxAskEntity askAuthor) {
        mailboxAskMapper.insertMailBox(askAuthor);
    }

    @Override
    public List<MailboxAskHot> selectHot() {
        return mailboxAskMapper.selectHot();
    }

    @Override
    public MailboxAskEntity selectByQueryCode(String queryCode) {
        return mailboxAskMapper.selectByQueryCode(queryCode);
    }

    @Override
    public MailboxReplyEntity getMailboxReplyEntity(Integer mailboxAskId) {
        return mailboxAskMapper.getMailboxReplyEntity(mailboxAskId);
    }

    @Override
    public void updateCount(Integer mailboxid) {
        mailboxAskMapper.updateCount(mailboxid);
    }

    @Override
    public List<MailboxListEntity> selectList() {
        return mailboxAskMapper.selectList();
    }

    @Override
    public MailboxAskEntity selectDetailById(Integer mailboxid) {
        return mailboxAskMapper.selectDetailById(mailboxid);
    }

    @Override
    public void commit(Commit commit) {
        mailboxAskMapper.commit(commit);
    }

    @Override
    public List<MailboxAskType> selectTypeList() {
        return mailboxAskMapper.selectTypeList();
    }

    @Override
    public String selectTypeNameById(Integer mailboxasktypeid) {
        return mailboxAskMapper.selectTypeNameById(mailboxasktypeid);
    }

    @Override
    public List<MailboxListEntity> queryByKeyword(String keyword) {
        return mailboxAskMapper.queryByKeyword(keyword);
    }



    @Override
    public List<MailboxAskHeadEntity> listAll(int mailboxType, int flag) {
        return mailboxAskMapper.listAll(mailboxType,flag);
    }

    @Override
    public MailboxAskEntity getMailboxAskEntity(int mailboxAskId) {
        return mailboxAskMapper.getMailboxAskEntity(mailboxAskId);
    }

    @Override
    public int updateFlag(int mailboxAskId, int flag) {
        return mailboxAskMapper.updateFlag(mailboxAskId,flag);
    }

    @Override
    public int insertMailboxReply(MailboxReplyEntity mailboxReplyEntity) {
        return mailboxReplyMapper.insertMailboxReply(mailboxReplyEntity);
    }

    @Override
    public MailboxReplyEntity getMailboxReplyEntity(int mailboxAskId) {
        return mailboxReplyMapper.getMailboxReplyEntity(mailboxAskId);
    }
}
