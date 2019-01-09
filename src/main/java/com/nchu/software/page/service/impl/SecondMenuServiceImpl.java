package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.SecondMenuEntity;
import com.nchu.software.page.mapper.SecondMenuMapper;
import com.nchu.software.page.service.ISecondMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName SecondServiceImpl
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 11:00
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 11:00
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class SecondMenuServiceImpl implements ISecondMenuService {

    @Autowired
    SecondMenuMapper mapper;

    /**
     * @Description 根据一级菜单id查出二级菜单实体列表
     * @author  watermelon
     * @param firstmenuid
     * @return  List<SecondMenuEntity>
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public List<SecondMenuEntity> getSecondMenuByFirstId(Long firstmenuid) {
        return mapper.getSecondMenuByFirstId(firstmenuid);
    }

    /**
     * @Description 根据二级菜单id查出一级菜单名称
     * @author  watermelon
     * @param secondId
     * @return  String
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public String getFirstMenuName(Long secondId) {
        return mapper.getFirstMenuName(secondId);
    }

    /**
     * @Description 根据二级菜单名称查出二级菜单信息
     * @author  watermelon
     * @param name
     * @return  SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public SecondMenuEntity getSecondMenuByName(String name) {
        return mapper.getSecondMenuByName(name);
    }

    /**
     * @Description 根据二级菜id称查出二级菜单信息
     * @author  watermelon
     * @param id
     * @return  SecondMenuEntity
     * @exception
     * @date   2019/1/7 22:54
     */
    @Override
    public SecondMenuEntity getSecondMenuBySecondId(Long id) {
        return mapper.getSecondMenuBySecondId(id);
    }
}
