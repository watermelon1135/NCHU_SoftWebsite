package com.nchu.software.page.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class PageContentEntity implements Serializable{

	private Long pageContextId;
	private Long secondMenuId;
	private String title;
	private String author;
	private String context;
	private String source;
	private Date uploadTime;
	private Integer count;
	private Integer status;
	//private Integer verify;
	//private Integer published;

}
