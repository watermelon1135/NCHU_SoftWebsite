package com.nchu.software.page.service.impl;

import com.nchu.software.page.entity.PageContextEntity;
import com.nchu.software.page.mapper.PageContextMapper;
import com.nchu.software.page.service.IPageContextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName PageContentServiceImpl
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 10:37
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 10:37
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class PageContentServiceImpl implements IPageContextService {
    @Autowired
    PageContextMapper mapper;

    @Override
    public PageContextEntity getContextBySecondId(Integer secondId) {
       return mapper.getContextBySecondId(secondId);
    }
}
