package com.nchu.software.page.service;

import com.nchu.software.page.entity.PageContentEntity;

import java.util.List;

/**
 * @ClassName IPageContentService
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 10:36
 * @Version 1.0
 **/
public interface IPageContentService {


    /**
     * @Description 根据二级菜单id查出相应的页面信息
     * @author  watermelon
     * @param secondId
     * @return PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     **/
    PageContentEntity getContextBySecondId(Long secondId);

    /**
     * @Description 根据二级菜单id查出相应的页面信息列表
     * @author  watermelon
     * @param secondId
     * @return List<PageContentEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    List<PageContentEntity> listContextsBySecondId(Long secondId);

    /**
     * @Description 根据页面id查出相应的页面信息
     * @author  watermelon
     * @param pageId
     * @return PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    PageContentEntity getPageContentById(Long pageId);
}
