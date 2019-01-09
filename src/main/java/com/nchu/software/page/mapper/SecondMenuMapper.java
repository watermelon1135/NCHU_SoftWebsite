package com.nchu.software.page.mapper;

import com.nchu.software.page.entity.SecondMenuEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName SecondMenuMapper
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 10:58
 * @Version 1.0
 **/
@Repository
public interface SecondMenuMapper {
    /**
     * @Description 根据一级菜单id查询所有二级菜单信息
     * @author  watermelon
     * @param firstmenuid
     * @return    List<SecondMenuEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    List<SecondMenuEntity> getSecondMenuByFirstId(Long firstmenuid);

    /**
     * @Description 根据二级菜单id查询一级菜单名称
     * @author  watermelon
     * @param secondId
     * @return     String
     * @exception
     * @date   2019/1/7 22:54
     */
    String getFirstMenuName(Long secondId);

    /**
     * @Description 根据二级菜单名称查询二级菜单信息
     * @author  watermelon
     * @param name
     * @return   SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    SecondMenuEntity getSecondMenuByName(String name);

    /**
     * @Description 根据二级菜单id拆线呢二级菜单信息
     * @author  watermelon
     * @param id
     * @return   SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    SecondMenuEntity getSecondMenuBySecondId(Long id);
}
