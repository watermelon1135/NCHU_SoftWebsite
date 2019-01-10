package com.nchu.software.page.service;

import com.nchu.software.page.entity.FirstMenuEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName IFirstMenuService
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 18:15
 * @Version 1.0
 **/

public interface IFirstMenuService {

    /**
     * 查询出所有的一级菜单
     * @author  watermelon
     * @param null
     * @return  List
     * @exception
     * @date   2019/1/7 22:46
    */
    List<FirstMenuEntity> listAll();

    /**
     * 根据名字和标志位查询出一级菜单
     * @author  watermelon
     * @param name
     * @return  FirstMenuEntity
     * @exception
     * @date   2019/1/7 22:46
    */
    FirstMenuEntity getFirstMenuByName(String name);

    List<FirstMenuEntity> listAllByFlag(int flag);

}
