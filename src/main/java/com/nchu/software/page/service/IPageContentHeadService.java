package com.nchu.software.page.service;


import com.nchu.software.page.entity.PageContentHead;

import java.util.List;

/**
 * @ClassName HeadService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/6 15:38
 * @Version 1.0
 */
public interface IPageContentHeadService {

     /**
      * @Description //根据二级菜单id和要查询的数量查出相应的页面表头信息
      * @author  watermelon
      * @param secondMenuId
      * @param number
      * @return
      * @exception
      * @date   2019/1/7 22:54
     */
     List<PageContentHead> listPageContentHeadBySecondId(Long secondMenuId, Integer number);

}
