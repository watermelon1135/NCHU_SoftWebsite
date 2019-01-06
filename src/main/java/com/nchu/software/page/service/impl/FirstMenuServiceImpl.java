package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.mapper.FirstMenuMapper;
import com.nchu.software.page.service.IFirstMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName FirstMenuServiceImpl
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 19:00
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 19:00
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class FirstMenuServiceImpl implements IFirstMenuService {

    @Autowired
    FirstMenuMapper mapper;

    @Override
    public List<FirstMenuEntity> listAll() {
        return mapper.listAll();
    }
}
