package com.nchu.software.page.mapper;


import com.nchu.software.page.entity.PageContentEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author TyCoding
 * @date 18-4-30上午9:50
 */
@Repository
public interface PageContentMapper {
    /**
     * @Description 根据二级菜单id查询页面信息
     * @author  watermelon
     * @param secondId
     * @return   PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    PageContentEntity getContextBySecondId(Long secondId);

    /**
     * @Description 根据二级菜单id所有页面信息
     * @author  watermelon
     * @param secondId
     * @return   List<PageContentEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    List<PageContentEntity> listContextsBySecondId(Long secondId);

    /**
     * @Description 根据页面id查询页面信息
     * @author  watermelon
     * @param id
     * @return    PageContentEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    PageContentEntity getPageByPageContextId(Long id);

    /**
     * @Description //阅读次数+1
     * @author  watermelon
     * @param pageContextId
     * @return  
     * @exception 
     * @date   2019/1/10 14:34
    */
    int updateIncrementCount(Long pageContextId);

    int updatePageContent(PageContentEntity pageContentEntity);

    int addPageContent(PageContentEntity pageContentEntity);

    int deletePageContent(Integer pageContextId);

    int addToRecycle(Integer pageContextId);

    int removeToRecycle(Integer pageContextId);

    List<PageContentEntity> listRecycle();

    List<PageContentEntity> listPageContentByKeyword(String keyword);

}
