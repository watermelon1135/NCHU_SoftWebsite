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

    public ArrayList<PageContentHead> queryNew(@Param("secondMenuId") Integer secondMenuId, @Param("number") Integer number);

}
