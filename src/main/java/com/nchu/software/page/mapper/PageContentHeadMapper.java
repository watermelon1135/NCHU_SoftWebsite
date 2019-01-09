package com.nchu.software.page.mapper;

import com.nchu.software.page.entity.PageContentHead;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * @ClassName HeadMapper
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/6 15:21
 * @Version 1.0
 */
@Repository
public interface PageContentHeadMapper {
     /**
      * @Description 根据二级菜单id查询所有页面表头信息
      * @author  watermelon
      * @param secondMenuId
      * @return  ArrayList<PageContentHead>
      * @exception
      * @date   2019/1/7 22:54
      */
     ArrayList<PageContentHead> listPageContentHeadBySecondId(@Param("secondMenuId") Long secondMenuId, @Param("number") Integer number);

}
