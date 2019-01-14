package com.nchu.software.mailbox.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nchu.software.commons.util.FileUtil;
import com.nchu.software.mailbox.entity.*;
import com.nchu.software.mailbox.service.impl.MailboxServiceImpl;
import com.nchu.software.page.entity.Pages;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 书记/院长信箱的提问部分的控制器控制器
 * @create 2019-01-07 15:06
 */
@Controller
public class MailboxAskController {

    @Autowired
    private MailboxServiceImpl service;

    /**
    * @Description:  用于跳转到提问界面的方法
    * @Param:
    * @return:  页面前缀
    */
    @RequestMapping("/askQuestion")
    public String askQuestion(Model model) {
        //获得信箱的所有类型
        List<MailboxAskType> typeList = service.selectTypeList();
        model.addAttribute("typeList",typeList);
        List<MailboxAskHot> list = service.selectHot(); //最热提问版块
        model.addAttribute("hot",list);
        return "mailbox/jyxxQuestion";
    }

    /**
    * @Description:  处理页面传过来的数据，有附件的时候上传附件，并将所有数据存入数据库中
    * @Param:  vo:用于将表单数据部分封装在对象中
     *          appendix:上传的附件
     *          request:用于获取HttpServletRequest，用它来得到存放文件路径
    * @return:
    * @Date:
    */
    @RequestMapping("/handle")
    public String handle(SubmitVo vo, @Param("appendix") MultipartFile appendix, HttpServletRequest request, Model model) throws Exception {
        MailboxAskEntity askAuthor = new MailboxAskEntity(); //创建一个信箱提问的实体类
        String fileName =  FileUtil.upload("/upload/mailbox",appendix,request);
        askAuthor.setAskAppendix(fileName);
        System.out.println("name=" + request.getParameter("askName"));
        if (vo.getNameFlag().equals("1")){
            askAuthor.setAskName(vo.getAskName()); //存入提问者姓名
            askAuthor.setNameFlag(1);
        }else {
            askAuthor.setNameFlag(0);
            askAuthor.setAskName("匿名");
        }
        askAuthor.setContext(vo.getContext()); //存入内容
        askAuthor.setTitle(vo.getTitle()); //存入标题
        askAuthor.setAskTime(new Date()); //存入当前时间
        System.out.println("mailbox=" + vo.getMailbox());
        askAuthor.setMailbox(vo.getMailbox()); //存入邮箱
        System.out.println("phone=" + vo.getPhone());
        askAuthor.setPhone(vo.getPhone()); //存入号码
        askAuthor.setFlag(1); //默认标志
        UUID uuid = UUID.randomUUID(); //得到一个随机数
        String queryCode = uuid.toString();
        queryCode = queryCode.replaceAll("-", ""); //去除-
        queryCode = queryCode.substring(0, 12); //截取12位
        askAuthor.setQueryCode(queryCode); //存入查询码
        //存入类型，先判断是否位空
        if (vo.getMailboxtype() != null && !vo.getMailboxtype().equals("")){
            askAuthor.setMailboxType(Integer.parseInt(request.getParameter("mailboxtype")));
        }
        else {
            askAuthor.setMailboxType(null);
        }
        //存入阅读次数，默认为1
        askAuthor.setReadCount(0);
        service.insertMailBox(askAuthor); //插入数据
        model.addAttribute("queryCode",queryCode);
        return "mailbox/successTW"; //返回页面
    }

    @RequestMapping("/mailboxshow")
    public String mailboxshow(@RequestParam(required = false)Integer pagenum, Model model){
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize());
        List<MailboxListEntity> askmailboxlist = service.selectList(); //提问展示板块
        pages.setPageNumAll((long) Math.ceil(page.getTotal()*1.0/pages.getPageSize()));
        List<MailboxAskHot> list = service.selectHot(); //最热提问版块
        model.addAttribute("hot",list);
        model.addAttribute("askmailboxlist",askmailboxlist);
        model.addAttribute("pages",pages);
        model.addAttribute("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        model.addAttribute("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        model.addAttribute("pageUrl","/mailboxshow");
        return "mailbox/index";
    }

    /**
    * @Description:  根据查询码查询内容，有就直接进入详情页面，并提供一个评价字段
    * @Param:  得到一个查询码
    * @return:  返回详情页面
    */
    @RequestMapping("/search")
    public String search(@Param("queryCode") String queryCode,Model model,HttpServletRequest request) throws Exception{
        System.out.println("queryCode=" + queryCode);
        //创建一个提问实体
        MailboxAskEntity askentity = service.selectByQueryCode(queryCode);
        if (askentity == null){//如果查询码结果为空，则进行模糊查询
            String keyword = new String(queryCode.getBytes("utf-8"),"iso8859-1");
            return "forward:/queryByKeyword";
        }

        //每一次点击更新一次阅读次数
        service.updateCount(askentity.getMailboxAskId());
        askentity.setReadCount(askentity.getReadCount() + 1);
        model.addAttribute("mailboxAsk",askentity);
        //创建一个回答实体
        MailboxReplyEntity replyEntity = service.getMailboxReplyEntity(askentity.getMailboxAskId());
        if (replyEntity == null){
            MailboxReplyEntity replyEntity1 = new MailboxReplyEntity();
            replyEntity1.setContext("暂无回复内容，请耐心等待");
            model.addAttribute("reply",0);
            model.addAttribute("mailboxReply",replyEntity1);
        }else{
            model.addAttribute("mailboxReply",replyEntity);
            //标志位，如果是根据查询号查询，如果评价内容为空，则返回评价字段,否则返回评价结果
            if (replyEntity.getSatisfied() == null){
                model.addAttribute("showFlag",1);
            }
            else{
                model.addAttribute("satisfied",replyEntity.getSatisfied());
            }
            if(replyEntity.getReplyAppendix() != null && !replyEntity.getReplyAppendix().equals("")){
                System.out.println("replyAppendix=" + replyEntity.getReplyAppendix());
                model.addAttribute("replyFile",FileUtil.getFileName(replyEntity.getReplyAppendix()));
            }
        }
        //将类型转化为名称类型名称传给详情页面
        String typeName = service.selectTypeNameById(askentity.getMailboxType());
        model.addAttribute("typeName",typeName);
        List<MailboxAskHot> list = service.selectHot(); //最热提问版块
        model.addAttribute("hot",list);
        //如果问题存在附件，则处理附件名字（剪去时间戳）并传给前台
        if(askentity.getAskAppendix() != null && !askentity.getAskAppendix().equals("")){
            System.out.println("askAppendix=" + askentity.getAskAppendix());
            model.addAttribute("askFile",FileUtil.getFileName(askentity.getAskAppendix()));
        }
        return "mailbox/jyxxDetail";
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
    /*@RequestMapping("/downloadAppendix")
    public void downloadAppendix(HttpServletRequest request, HttpServletResponse response){
        String appendix = request.getParameter("appendix");
        if(FileUtil.download("/upload/mailbox",appendix,request,response)==0){
            request.setAttribute("message", "下载资源失败！！");
        }

    }*/

    /**
    * @Description:  用户通过点击查看详情后进入此方法，将所有信息都查询出来，返回给详情页面
    * @Param:  提问的id号
    * @return:
    */
    @RequestMapping("/showdetail")
    public String selectDetailById(Model model,@Param("mailboxaskid") String mailboxaskid){
        System.out.println("mailboxaskid="+mailboxaskid);
        if (mailboxaskid == null || mailboxaskid.equals("")){
            return "不好意思，出错了"; //判空操作
        }
        //根据id得到一个提问的实体类
        MailboxAskEntity askEntity = service.selectDetailById(Integer.parseInt(mailboxaskid));
        //根据得到提问实体的id得到一个回复的实体
        MailboxReplyEntity replyEntity = service.getMailboxReplyEntity(askEntity.getMailboxAskId());
        //更新阅读次数
        service.updateCount(askEntity.getMailboxAskId());
        askEntity.setReadCount(askEntity.getReadCount() + 1);
        model.addAttribute("mailboxAsk",askEntity);
        model.addAttribute("mailboxReply",replyEntity);
        if (replyEntity != null){
            model.addAttribute("satisfied",replyEntity.getSatisfied());
        }
        //将类型转化为名称类型名称传给详情页面
        String typeName = service.selectTypeNameById(askEntity.getMailboxType());
        model.addAttribute("typeName",typeName);
        List<MailboxAskHot> list = service.selectHot(); //最热提问版块
        model.addAttribute("hot",list);
        if(askEntity.getAskAppendix() != null && !askEntity.getAskAppendix().equals("")){
            System.out.println("askAppendix=" + askEntity.getAskAppendix());
            model.addAttribute("askFile",FileUtil.getFileName(askEntity.getAskAppendix()));
        }
        if(replyEntity.getReplyAppendix() != null && !replyEntity.getReplyAppendix().equals("")){
            System.out.println("replyAppendix=" + replyEntity.getReplyAppendix());
            model.addAttribute("replyFile",FileUtil.getFileName(replyEntity.getReplyAppendix()));
        }
        return "mailbox/jyxxDetail";
    }

    /**
    * @Description: 用户提交评价
    * @Param:
    * @return:
    */
    @RequestMapping("/commit")
    public String commit(HttpServletRequest request){
        //得到用户评价的分数和评价的内容id
        String satisfied = request.getParameter("score");
        String mailboxaskid = request.getParameter("replyid");
        String askId = request.getParameter("askid");
        System.out.println("satisfied=" + satisfied);
        System.out.println("mailboxaskid" + mailboxaskid);
        Commit commit = new Commit();
        if (satisfied == null || satisfied.equals("")){
            return "";
        }
        if (mailboxaskid == null || mailboxaskid.equals("")){
            return "";
        }
        //评价
        commit.setMailboxreplyid(Integer.parseInt(mailboxaskid));
        commit.setSatisfied(Integer.parseInt(satisfied));
        service.commit(commit);
        return "redirect:/showdetail?mailboxaskid=" + askId;
    }

    @RequestMapping("/queryByKeyword")
    public String queryByKeyword(@RequestParam(required = false)Integer pagenum,@RequestParam("queryCode")String keyword,Model model) throws Exception{
        //keyword = new String(keyword.getBytes("iso8859-1"),"utf-8");

        System.out.println("keyword=" + keyword);
        Pages pages = new Pages();
        if(pagenum == null) {
            pages.setPageNum(1);
        }
        else {
            pages.setPageNum(pagenum);
        }
        Page page = PageHelper.startPage(pages.getPageNum(), pages.getPageSize());
        List<MailboxListEntity> askmailboxlist = service.queryByKeyword(keyword);
        pages.setPageNumAll((long) Math.ceil(page.getTotal()*1.0/pages.getPageSize()));
        model.addAttribute("askmailboxlist",askmailboxlist);
        List<MailboxAskHot> list = service.selectHot(); //最热提问版块
        model.addAttribute("hot",list);
        model.addAttribute("pages",pages);
        model.addAttribute("pagesBegin",(Math.ceil(pages.getPageNum()/5.0)-1)*5+1);
        model.addAttribute("pagesEnd",pages.getPageNumAll()<(Math.ceil(pages.getPageNum()/5.0)*5)?pages.getPageNumAll():(Math.ceil(pages.getPageNum()/5.0)*5));
        model.addAttribute("pageUrl","/queryByKeyword");
        model.addAttribute("keyword",keyword);
        return "mailbox/index";
    }
}