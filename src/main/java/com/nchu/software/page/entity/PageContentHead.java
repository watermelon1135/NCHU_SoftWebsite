package com.nchu.software.page.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @ClassName PageContextHead
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/6 14:49
 * @Version 1.0
 */

@Setter
@Getter
public class PageContentHead {
    /**
     * pageContextId:页面内容编号
     * title:标题
     * uploadTime:上传时间
     * pageContextUrl:页面URL
     */
    private Long pageContextId;
    private String title;
    private Date uploadTime;
    /*private String pageContextUrl;*/
}
