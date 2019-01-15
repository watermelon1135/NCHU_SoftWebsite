package com.nchu.software.teachingAffairs.entity;

import lombok.Data;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 学生成绩
 * @create 2019-01-10 14:22
 */
@Data
public class StudentMark {
    private String stuId;       //学号
    private String stuName;       //姓名
    List<Float> grade;          //多门成绩集合
    private String term;        //学期
}
