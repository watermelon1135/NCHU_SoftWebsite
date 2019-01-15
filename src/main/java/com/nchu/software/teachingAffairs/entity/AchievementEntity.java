package com.nchu.software.teachingAffairs.entity;

import lombok.Data;

/**
 * @ClassName AchievementEntity
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 12:04
 * @Version 1.0
 */

@Data
public class AchievementEntity {

    private Integer achievementId;          //成绩编号
    private String stuNo;                   //学号
    private Integer courseNO;               //课程编号
    private Float experimentalResults;      //实验成绩
    private Float normalResults;            //平时成绩
    private Float midtermResults;           //期中成绩
    private Float finalResults;             //期末成绩
    private Float totalResults;             //总成绩
    private Integer flag;                   //标志

    public AchievementEntity(String stuNo, String courseNO, String experimentalResults, String normalResults,
                             String midtermResults, String finalResults,
                             String totalResults, String flag) {
        this.stuNo = stuNo;
        if (courseNO != null && !courseNO.equals("")) {
            this.courseNO = Integer.parseInt(courseNO);
        }
        if (experimentalResults != null && !experimentalResults.equals("")) {
            this.experimentalResults = Float.parseFloat(experimentalResults);
        }
        if (normalResults != null && !normalResults.equals("")) {
            this.normalResults = Float.parseFloat(normalResults);
        }
        if (midtermResults != null && !midtermResults.equals("")) {
            this.midtermResults = Float.parseFloat(midtermResults);
        }
        if (finalResults != null && !finalResults.equals("")) {
            this.finalResults = Float.parseFloat(finalResults);
        }
        if (totalResults != null && !totalResults.equals("")) {
            this.totalResults = Float.parseFloat(totalResults);
        }
        if (flag != null && !flag.equals("")) {
            this.flag = Integer.parseInt(flag);
        }
    }
}
