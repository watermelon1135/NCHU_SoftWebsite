package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.PageContentEntity;
import com.nchu.software.page.mapper.PageContentMapper;
import com.nchu.software.page.service.IPageContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName PageContentServiceImpl
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 10:37
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 10:37
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class PageContentServiceImpl implements IPageContentService {
    @Autowired
    PageContentMapper mapper;

    /**
     * @Description 根据二级菜单id查出相应的页面信息
     * @author  watermelon
     * @param secondId
     * @return PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public PageContentEntity getContextBySecondId(Long secondId) {
        return mapper.getContextBySecondId(secondId);
    }


    /**
     * @Description 根据二级菜单id查出相应的页面信息列表
     * @author  watermelon
     * @param secondId
     * @return List<PageContentEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public List<PageContentEntity> listContextsBySecondId(Long secondId) {
        return mapper.listContextsBySecondId(secondId);
    }

    /**
     * @Description 根据页面id查出相应的页面信息
     * @author  watermelon
     * @param pageId
     * @return PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public PageContentEntity getPageContentById(Long pageId) {
        return mapper.getPageByPageContextId(pageId);
    }

    @Override
    public int updateIncrementCount(Long pageContextId) {
       return  mapper.updateIncrementCount(pageContextId);
    }

    @Override
    public int updatePageContent(PageContentEntity pageContentEntity) {
        return mapper.updatePageContent(pageContentEntity);
    }

    @Override
    public int addPageContent(PageContentEntity pageContentEntity) {
        return mapper.addPageContent(pageContentEntity);
    }

    @Override
    public int addToRecycle(Integer pageContextId) {
        return mapper.addToRecycle(pageContextId);
    }

    @Override
    public int removeToRecycle(Integer pageContextId) {
        return mapper.removeToRecycle(pageContextId);
    }

    @Override
    public int deletePageContent(Integer pageContextId) {
        return mapper.deletePageContent(pageContextId);
    }

    @Override
    public List<PageContentEntity> listRecycle() {
        return mapper.listRecycle();
    }

    @Override
    public List<PageContentEntity> listPageContentByKeyword(String keyword) {
        return mapper.listPageContentByKeyword(keyword);
    }
}
