package com.nchu.software.teachingAffairs.controller;

import com.nchu.software.commons.util.FiveElementUtil;
import com.nchu.software.teachingAffairs.entity.AnalyticResult;
import com.nchu.software.teachingAffairs.entity.StudentEntity;
import com.nchu.software.teachingAffairs.entity.StudentMark;
import com.nchu.software.teachingAffairs.service.impl.AchievementServiceImpl;
import com.nchu.software.teachingAffairs.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName AchievementController
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 20:18
 * @Version 1.0
 */

@Controller
public class AchievementController {
    @Autowired
    private StudentServiceImpl studentService;
    @Autowired
    private AchievementServiceImpl achievementService;

    @RequestMapping("/trend")
    public String developmentTrend(@RequestParam("classNo") String classNo,Model model){
        if(classNo != null && !classNo.equals("")){
            List<StudentEntity> students = studentService.listClass(Integer.parseInt(classNo));
            List<StudentMark> studentMarks = new ArrayList<>();
            for(int i = 0;i < students.size();i ++){
                StudentMark studentMark = new StudentMark();
                String stuId = students.get(i).getStuNo();
                String stuName = students.get(i).getName();
                studentMark.setStuId(stuId);
                studentMark.setStuName(stuName);
                studentMark.setGrade(achievementService.listAchievement(stuId));
                studentMarks.add(studentMark);
            }
            List<AnalyticResult> analyticResults = FiveElementUtil.CalcResult(studentMarks);
            model.addAttribute("analyticResults",analyticResults);
        }
        model.addAttribute("classNo",classNo);
        return "teachingAffairs/bszn";
    }
}
