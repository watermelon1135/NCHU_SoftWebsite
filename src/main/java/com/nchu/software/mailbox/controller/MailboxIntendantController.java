package com.nchu.software.mailbox.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nchu.software.commons.util.FileUtil;
import com.nchu.software.mailbox.entity.*;
import com.nchu.software.mailbox.service.impl.MailboxServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * @ClassName MailboxIntendantController
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/8 09:36
 * @Version 1.0
 */
@Controller
public class MailboxIntendantController {

    @Autowired
    private MailboxServiceImpl mailboxServiceImpl;

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 管理员主界面
     * @Date 15:26 2019/1/14
     * @Param [mailboxType, flag, pagenum, model]
     * @exception
     * @return java.lang.String
     **/
    @RequestMapping(value = "/mailbox/{mailboxType}/{flag}")
    public String toIntendant(@PathVariable int mailboxType, @PathVariable int flag, @RequestParam(required = false)Integer pagenum, Model model){
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize());
        //根据问题类型（1 书记，2 院长。。。）和标志（1 未读 2 公开 3 私密）查询问题
        List<MailboxAskHeadEntity> mailboxAskHeads = mailboxServiceImpl.listAll(mailboxType,flag);
        pages.setPageNumAll((long) Math.ceil(page.getTotal()*1.0/pages.getPageSize()));
        model.addAttribute("mailboxAskHeads",mailboxAskHeads);
        model.addAttribute("pages",pages);
        model.addAttribute("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        model.addAttribute("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        return "mailbox/jyxx";
    }

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 由管理员主界面转向详情界面中间处理方法
     * @Date 15:28 2019/1/14
     * @Param [flag, mailboxAskId, model]
     * @exception
     * @return java.lang.String
     **/
    @RequestMapping(value = "/mailbox/mail/{flag}/{mailboxAskId}")
    public String toIntendantDetail(@PathVariable int flag,@PathVariable int mailboxAskId, Model model){
        //根据问题ID查询问题
        MailboxAskEntity mailboxAsk = mailboxServiceImpl.getMailboxAskEntity(mailboxAskId);
        model.addAttribute("mailboxAsk",mailboxAsk);
        //如果问题存在附件，则处理附件名字（剪去时间戳）并传给前台
        if(mailboxAsk.getAskAppendix() != null && !mailboxAsk.getAskAppendix().equals("")){
            model.addAttribute("askFile",FileUtil.getFileName(mailboxAsk.getAskAppendix()));
        }
        //如果问题已读（公开、私密），则查询回复内容，然后转向详情界面，否则转向回复页面
        if(flag != 1){
            MailboxReplyEntity mailboxReply = mailboxServiceImpl.getMailboxReplyEntity(mailboxAskId);
            model.addAttribute("mailboxReply",mailboxReply);
            //如果回复存在附件，则处理附件名字（剪去时间戳）并传给前台
            if(mailboxReply.getReplyAppendix() != null && !mailboxReply.getReplyAppendix().equals("")){
                model.addAttribute("replyFile",FileUtil.getFileName(mailboxReply.getReplyAppendix()));
            }
            return "mailbox/jyxx-details";
        }else {
            return "mailbox/jyxx-detailsW";
        }
    }

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 处理提交回复方法
     * @Date 15:36 2019/1/14
     * @Param [vo, replyAppendix, request]
     * @exception
     * @return java.lang.String
     **/
    @RequestMapping(value = "/mailbox/reply")
    public String reply(ReplyEntity vo, @Param("replyAppendix") MultipartFile replyAppendix, HttpServletRequest request) {
       // System.out.println(vo);
        int mailboxAskId = Integer.parseInt(vo.getMailboxAskId());
        if(vo.getContext().length()!=0) {
            MailboxReplyEntity mailboxReply = new MailboxReplyEntity(); //创建一个信箱回复的实体类
            //文件上传并保存文件名
            mailboxReply.setReplyAppendix(FileUtil.upload("/upload/mailbox",replyAppendix,request));
            mailboxReply.setMailboxAskId(mailboxAskId);
            mailboxReply.setContext(vo.getContext()); //存入内容
            mailboxReply.setReplyTime(new Date()); //存入当前时间
            mailboxServiceImpl.insertMailboxReply(mailboxReply); //插入回复内容
        }
        mailboxServiceImpl.updateFlag(mailboxAskId,Integer.parseInt(vo.getNewFlag()));//修改标识
        return "redirect:/mailbox/"+vo.getMailboxType() +"/"+vo.getOldFlag(); //返回页面
    }

    /**
     * 方法实现说明
     * @Author 范孝发
     * @Description 文件下载方法
     * @Date 15:37 2019/1/14
     * @Param [request, response]
     * @exception
     * @return void
     **/
    @RequestMapping("/downloadAppendix")
    public void downloadAskAppendix(HttpServletRequest request, HttpServletResponse response){
        String appendix = request.getParameter("appendix");
        if(FileUtil.download("/upload/mailbox",appendix,request,response)==0){
            request.setAttribute("message", "下载资源失败！！");
        }
        
    }

}
