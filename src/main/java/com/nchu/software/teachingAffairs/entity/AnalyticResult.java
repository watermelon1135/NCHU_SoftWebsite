package com.nchu.software.teachingAffairs.entity;

import lombok.Data;

import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 学生成绩分析结果
 * @create 2019-01-10 14:29
 */
@Data
public class AnalyticResult {
    private String stuId;   //学号
    private String stuName;   //姓名
    private List<String> trend; //趋势
}
