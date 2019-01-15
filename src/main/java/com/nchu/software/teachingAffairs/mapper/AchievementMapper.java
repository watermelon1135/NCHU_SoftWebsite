package com.nchu.software.teachingAffairs.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName AchievementMappee
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 12:42
 * @Version 1.0
 */

@Repository
public interface AchievementMapper {

    void listInsert(List list);

    List listAchievement(String stuId);
}
