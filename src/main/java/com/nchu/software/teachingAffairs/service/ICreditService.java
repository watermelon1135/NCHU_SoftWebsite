package com.nchu.software.teachingAffairs.service;

import com.nchu.software.teachingAffairs.entity.NetworkEntity;
import com.nchu.software.teachingAffairs.entity.StudentCreditEntity;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description
 * @create 2019-01-12 15:14
 */
public interface ICreditService {
    List<String> selectEarlyWarning();
    List<String> selectCourses(String stuno);
    StudentCreditEntity selectStuInfo(String stuno);
    List<NetworkEntity> selectAllNetwork();
}
