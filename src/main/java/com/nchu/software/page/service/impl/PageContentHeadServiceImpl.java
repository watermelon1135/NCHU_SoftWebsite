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

    /**
     * @Description 根据二级菜单id和要查询的数量查出相应的页面表头信息
     * @author  watermelon
     * @param secondMenuId
     * @param number
     * @return
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public ArrayList<PageContentHead> listPageContentHeadBySecondId(Long secondMenuId, Integer number) {
        return headMapper.listPageContentHeadBySecondId(secondMenuId, number);
    }
}
