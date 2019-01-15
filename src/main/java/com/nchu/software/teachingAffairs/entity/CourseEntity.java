package com.nchu.software.teachingAffairs.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @ClassName CourseEntity
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 14:58
 * @Version 1.0
 */
@Data
public class CourseEntity{
    @Excel(name = "课程编号")
    @NotNull
    private Integer courseNo;
    @Excel(name = "课程类型编号")
    private Integer courseTypeNo;
    @Excel(name = "课程名称")
    private String courseName;
    @Excel(name = "总学时")
    private Integer totalHour;
    @Excel(name = "理论学时")
    private Integer theoryHour;
    @Excel(name = "实验学时")
    private Integer experimentHour;
    @Excel(name = "学分")
    private Float credit;
    @Excel(name = "备注")
    private String memo;
}
