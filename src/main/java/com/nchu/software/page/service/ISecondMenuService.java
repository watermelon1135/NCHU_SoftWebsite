package com.nchu.software.page.service;

import com.nchu.software.page.entity.SecondMenuEntity;

import java.util.List;

/**
 * @ClassName ISecondMenuService
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 10:59
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 10:59
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public interface ISecondMenuService {

    /**
     * @Description 根据一级菜单id查出二级菜单实体列表
     * @author  watermelon
     * @param firstmenuid
     * @return  List<SecondMenuEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    List<SecondMenuEntity> getSecondMenuByFirstId(Long firstmenuid);

    /**
     * @Description 根据二级菜单id查出一级菜单名称
     * @author  watermelon
     * @param secondId
     * @return  String
     * @exception
     * @date   2019/1/7 22:54
     */
    String getFirstMenuName(Long secondId);

    /**
     * @Description 根据二级菜单名称查出二级菜单信息
     * @author  watermelon
     * @param name
     * @return  SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    SecondMenuEntity getSecondMenuByName(String name);

    /**
     * @Description 根据二级菜id称查出二级菜单信息
     * @author  watermelon
     * @param id
     * @return  SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    SecondMenuEntity getSecondMenuBySecondId(Long id);
}
