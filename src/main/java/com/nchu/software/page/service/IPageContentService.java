package com.nchu.software.page.service;

import com.nchu.software.page.entity.PageContentEntity;

/**
 * @ClassName IPageContentService
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 10:36
 * @Version 1.0
 **/
public interface IPageContentService {
    PageContentEntity getContextBySecondId(Integer secondId);
}
