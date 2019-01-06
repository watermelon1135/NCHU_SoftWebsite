package com.nchu.software.page.service;

import com.nchu.software.page.entity.PageContextEntity;

/**
 * @ClassName IPageContextService
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 10:36
 * @Version 1.0
 **/
public interface IPageContextService {
    PageContextEntity getContextBySecondId(Integer secondId);
}
