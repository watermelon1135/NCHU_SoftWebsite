package com.nchu.software.teachingAffairs.service;

import java.util.List;

/**
 * @ClassName IAchievementService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 12:54
 * @Version 1.0
 */
public interface IAchievementService {

    void listInsert(List list);
    List listAchievement(String stuId);
}
