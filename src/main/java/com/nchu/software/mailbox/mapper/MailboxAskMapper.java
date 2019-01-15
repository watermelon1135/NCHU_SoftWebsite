package com.nchu.software.mailbox.mapper;

import com.nchu.software.mailbox.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName MailboxAskMapper
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/7 20:25
 * @Version 1.0
 */

@Repository
public interface MailboxAskMapper {
    void insertMailBox(MailboxAskEntity askAuthor);//插入提问数据
    List<MailboxAskHot> selectHot(); //查询最热提问
    MailboxAskEntity selectByQueryCode(String queryCode); //根据查询码查询信息
    MailboxReplyEntity getMailboxReplyEntity(Integer mailboxAskId); //得到回复实体
    void updateCount(Integer mailboxid); //修改次数
    List<MailboxListEntity> selectList(); //查询列表数据
    MailboxAskEntity selectDetailById(Integer mailboxid); //根据id查询提问实体
    void commit(Commit commit); //提交评价
    List<MailboxAskType> selectTypeList(); //得到信箱类型名称
    String selectTypeNameById(Integer mailboxasktypeid); //根据id查询信箱类型
    List<MailboxListEntity> queryByKeyword(String keyword); //根据搜索进行模糊查询
    List<MailboxAskHeadEntity> listAll(@Param("mailboxType") int mailboxType, @Param("flag") int flag);
    MailboxAskEntity getMailboxAskEntity(int mailboxAskId);
    int updateFlag(@Param("mailboxAskId") int mailboxAskId, @Param("flag") int flag);
    int deleteMailboxAskById(int mailboxAskId);
}
