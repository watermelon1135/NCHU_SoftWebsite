package com.nchu.software.manager.service.impl;

import com.nchu.software.manager.entity.AdministratorEntity;
import com.nchu.software.manager.mapper.AdministratorMapper;
import com.nchu.software.manager.service.IAdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName CustomDateConverter
 * @Description: java类作用描述
 * @Author: Taodada
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Service
public class AdministratorServiceImpl implements IAdministratorService {
    @Autowired
    AdministratorMapper mapper;
    @Override
    public AdministratorEntity findUserByUsername(String username) {
        return mapper.findUserByUsername(username);
    }
}
