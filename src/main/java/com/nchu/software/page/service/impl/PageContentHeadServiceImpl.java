package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.PageContentHead;
import com.nchu.software.page.mapper.PageContentHeadMapper;
import com.nchu.software.page.service.IPageContentHeadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * @ClassName HeadServiceImpl
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/6 15:38
 * @Version 1.0
 */

@Service
public class PageContentHeadServiceImpl implements IPageContentHeadService {

    @Autowired
    private PageContentHeadMapper headMapper;

    @Override
    public ArrayList<PageContentHead> queryNew(Integer secondMenuId, Integer number) {
        return headMapper.queryNew(secondMenuId, number);
    }
}
