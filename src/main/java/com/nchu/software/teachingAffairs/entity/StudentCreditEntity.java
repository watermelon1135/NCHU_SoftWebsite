package com.nchu.software.teachingAffairs.entity;

import lombok.Data;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description
 * @create 2019-01-12 19:18
 */
@Data
public class StudentCreditEntity {
    private String stuno;   //学号
    private String name;    //姓名
    private String phone;   //电话
    private String familyPhone; //家庭电话号码
    private List<String> courses;   //课程
    private List<Float> credits;    //课程学分
}
