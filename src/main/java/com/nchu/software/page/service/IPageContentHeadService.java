package com.nchu.software.page.service;


import com.nchu.software.page.entity.PageContentHead;

import java.util.ArrayList;

/**
 * @ClassName HeadService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/6 15:38
 * @Version 1.0
 */
public interface IPageContentHeadService {

    public ArrayList<PageContentHead> queryNew(Integer secondMenuId, Integer number);

}
