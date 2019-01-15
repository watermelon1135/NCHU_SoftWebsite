package com.nchu.software.teachingAffairs.service.impl;

import com.nchu.software.teachingAffairs.mapper.AchievementMapper;
import com.nchu.software.teachingAffairs.service.IAchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName AchievementServiceImpl
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 12:56
 * @Version 1.0
 */

@Service
public class AchievementServiceImpl implements IAchievementService {

    @Autowired
    private AchievementMapper achievementMapper;

    @Override
    public void listInsert(List list) {
        achievementMapper.listInsert(list);
    }

    @Override
    public List listAchievement(String stuId) {
        return achievementMapper.listAchievement(stuId);
    }
}
