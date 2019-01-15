package com.nchu.software.teachingAffairs.controller;

import com.nchu.software.commons.util.AprioriTwo;
import com.nchu.software.teachingAffairs.entity.NetworkEntity;
import com.nchu.software.teachingAffairs.entity.StudentCreditEntity;
import com.nchu.software.teachingAffairs.service.impl.CreditServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description
 * @create 2019-01-12 15:52
 */
@Controller
public class CreditController {
    @Autowired
    private CreditServiceImpl service;

    @RequestMapping("/creditwarn")
    public String selectCredit(Model model){
        System.out.println("service=" + service);
        List<String> stuList = service.selectEarlyWarning();
        List<StudentCreditEntity> stusCourse = new ArrayList<>();
        for (int i = 0;i < stuList.size();i ++){
            StudentCreditEntity entity = service.selectStuInfo(stuList.get(i));
            entity.setStuno(stuList.get(i));
            List<String> list = service.selectCourses(stuList.get(i));
            entity.setCourses(list);
            stusCourse.add(entity);
        }
        model.addAttribute("students",stusCourse);
        return "teachingAffairs/bszn";
    }

    @RequestMapping("/recode")
    public String getRecode(Model model){
        List<NetworkEntity> lists = service.selectAllNetwork();
        List<List<String>> recode = new ArrayList<>();
        for (int i = 0;i <lists.size();i ++){
            NetworkEntity entity = lists.get(i);
            System.out.println("entity=" + entity.toString() + ",i=" + i);
            List<String> list = new ArrayList<>();
            System.out.println("netone=" + entity.getNetwork_one() + ",i=" + i);
            list.add(entity.getNetwork_one().toString());
            System.out.println("nettwo=" + entity.getNetwork_two() + ",i=" + i);
            list.add(entity.getNetwork_two().toString());
            System.out.println("netone=" + entity.getNetwork_three() + ",i=" + i);
            list.add(entity.getNetwork_three().toString());
            System.out.println("netone=" + entity.getNetwork_four() + ",i=" + i);
            list.add(entity.getNetwork_four().toString());
            System.out.println("netone=" + entity.getNetwork_five() + ",i=" + i);
            list.add(entity.getNetwork_five().toString());
            System.out.println("list=" + list.toString());
            list.add(entity.getGrade().toString());
            recode.add(list);
        }
//        System.out.println("recode="+recode.toString());
        AprioriTwo two = new AprioriTwo();
        two.setRecord(recode);
        List<List<String>> results = two.calcApriori();
        model.addAttribute("results",results);
        return "teachingAffairs/bszn";
    }
}
