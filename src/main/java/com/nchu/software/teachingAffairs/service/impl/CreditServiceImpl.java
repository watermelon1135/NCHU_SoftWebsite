package com.nchu.software.teachingAffairs.service.impl;

import com.nchu.software.teachingAffairs.entity.NetworkEntity;
import com.nchu.software.teachingAffairs.entity.StudentCreditEntity;
import com.nchu.software.teachingAffairs.mapper.CreditMapper;
import com.nchu.software.teachingAffairs.service.ICreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description
 * @create 2019-01-12 15:16
 */
@Service
public class CreditServiceImpl implements ICreditService {
    @Autowired
    private CreditMapper mapper;

    @Override
    public List<String> selectEarlyWarning() {
        return mapper.selectEarlyWarning();
    }

    @Override
    public List<String> selectCourses(String stuno) {
        return mapper.selectCourses(stuno);
    }

    @Override
    public StudentCreditEntity selectStuInfo(String stuno) {
        return mapper.selectStuInfo(stuno);
    }

    @Override
    public List<NetworkEntity> selectAllNetwork() {
        return mapper.selectAllNetwork();
    }
}
