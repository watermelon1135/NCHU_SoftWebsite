package com.nchu.software.page.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

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

    private Integer pageContextId;
    private String title;
    private Date uploadTime;
    private String pageContextUrl;
}
