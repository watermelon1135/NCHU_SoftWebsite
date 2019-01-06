package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.FirstMenuEntity;
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

    @Override
    public List<SecondMenuEntity> getSecondMenuByFirstId(Integer firstmenuid) {
        return mapper.getSecondMenuByFirstId(firstmenuid);
    }

    @Override
    public String getFirstMenuName(Integer secondId) {
        return mapper.getFirstMenuName(secondId);
    }
}
