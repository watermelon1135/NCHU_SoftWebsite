package com.nchu.software.page.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class PageContentEntity implements Serializable{
	/**
	 * pageContextId:页面内容编号
	 * secondMenuId:二级菜单编号
	 * title:标题
	 * author:作者
	 * context:内容
	 * source:文章来源
	 * uploadTime:上传时间
	 * count:点击数
	 * status:状态
	 */
	private Long pageContextId;
	private Long secondMenuId;
	private String title;
	private String author;
	private String context;
	private String source;
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date uploadTime;
	private Integer count = 0;
	private Integer status = 1;
	//private String pageContextUrl;
	//private Integer verify;
	//private Integer published;

}
