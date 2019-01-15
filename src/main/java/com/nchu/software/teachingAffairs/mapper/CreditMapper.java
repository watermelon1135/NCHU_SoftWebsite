package com.nchu.software.teachingAffairs.mapper;

import com.nchu.software.teachingAffairs.entity.NetworkEntity;
import com.nchu.software.teachingAffairs.entity.StudentCreditEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 学分Mapper
 * @create 2019-01-12 15:09
 */
@Repository
public interface CreditMapper {
    List<String> selectEarlyWarning();
    List<String> selectCourses(String stuno);
    StudentCreditEntity selectStuInfo(String stuno);
    List<NetworkEntity> selectAllNetwork();
}
