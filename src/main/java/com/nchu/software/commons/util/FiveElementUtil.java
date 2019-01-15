package com.nchu.software.commons.util;

import com.nchu.software.teachingAffairs.entity.AnalyticResult;
import com.nchu.software.teachingAffairs.entity.StudentMark;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 曾溱泷
 * @program NCHU_Software_Website
 * @description 多元联系数预测学生成绩趋势
 * @create 2019-01-10 14:05
 */

public class FiveElementUtil {
    /**
    * @Description:  遍历学生成绩集合，分析每个学生的成绩，返回趋势结果
    * @Param:  学生成绩的集合
    * @return:  返回学生预测结果的集合
    */
    public static List<AnalyticResult> CalcResult(List<StudentMark> students){
        List<AnalyticResult> results = new ArrayList<>(); //创建一个结果集合
        for (int i = 0;i < students.size();i ++){
            StudentMark student = students.get(i); //读取每一个学生
            double[] doubles = getDoubles(student); //获取每个学生的当前态势的五联系数
            System.out.println("double");
            testDoubles(doubles);
            AnalyticResult analyticResult = new AnalyticResult(); //创建一个分析结果
            analyticResult.setStuId(student.getStuId()); //传入学生id
            analyticResult.setStuName(student.getStuName());
            List<String> trend = new ArrayList<>(); //创建一个趋势结果集合
            double u = doubles[0] - doubles[4];  //当前态势计算
            System.out.println(u);
            trend.add(getString(u));
            double[] doubles1 = getDoubleTwo(doubles); //获取每个学生一阶偏联系数
            System.out.println("double1");
            testDoubles(doubles1);
            double u1 = doubles1[0] - doubles1[2] - doubles1[3]; //计算一阶潜在趋势
            System.out.println(u1);
            trend.add(getString(u1));
            double[] doubles2 = getDoubleTwo(doubles1);  //获取每个学生的二阶偏联系数
            System.out.println("double2");
            testDoubles(doubles2);
            double u2 = doubles2[0] - doubles2[1] - doubles2[2]; //计算二阶潜在趋势
            System.out.println(u2);
            trend.add(getString(u2));
            double[] doubles3 = getDoubleTwo(doubles2); //获取每个学生的三阶偏联系数
            System.out.println("double3");
            testDoubles(doubles3);
            double u3 = doubles3[0] - doubles3[1];  //计算三阶潜在趋势
            System.out.println(u3);
            trend.add(getString(u3));
            double u4 = getPC(doubles3[0],doubles3[1]);  //四阶偏联系数==四阶潜在趋势
            System.out.println("double4");
            System.out.println(u4);
            trend.add(getString(u4));
            analyticResult.setTrend(trend);
            results.add(analyticResult);  //添加每个学生的分析结果
        }
        return results;
    }

    /**
    * @Description: 根据系数获得偏联系数
    * @Param: 两个系数
    * @return:  偏联系数
    */
    public static double getPC(double a,double b){
        if ((a + b) == 0)
            return 0;
        return a/(a + b);
    }

    /**
    * @Description: 根据学生成绩，得到学生的联系数分量数组
    * @Param:   学生成绩集合
    * @return:  联系数分量数组
    */
    public static double[] getDoubles(StudentMark student){
        int length = student.getGrade().size();
        int[] ints = new int[5];
        for (int j = 0;j < length;j ++){
            if (student.getGrade().get(j) >= 90)
                ints[0] ++;
            else if (student.getGrade().get(j) >= 80)
                ints[1] ++;
            else if (student.getGrade().get(j) >= 70)
                ints[2] ++;
            else if (student.getGrade().get(j) >= 60)
                ints[3] ++;
            else ints[4] ++;
        }
        double[] doubles = new double[5];
        for (int i = 0;i < ints.length;i ++)
            doubles[i] = (double)ints[i]/length;
        return doubles;
    }

    /**
    * @Description: 根据态势，得出趋势结果
    * @Param:  态势
    * @return: 趋势结果
    */
    public static String getString(double x){
        if (x > 0){
            return "提高";
        }else if (x == 0)
            return  "不确定";
        return "下降";
    }

    /**
    * @Description:  根据当前偏联系数数组，获取高一阶的偏联系数数组
    * @Param:  当前偏联系数数组
    * @return:  高一阶的偏联系数数组
    */
    public static double[] getDoubleTwo(double[] doubles){
        double[] doubles1 = new double[doubles.length - 1];
        for (int i = 0;i < doubles.length -1;i ++)
            doubles1[i] = getPC(doubles[i],doubles[i + 1]);
        return doubles1;
    }

    public static void testDoubles(double[] doubles){
        for (int i = 0;i < doubles.length;i ++)
            System.out.print("+"+doubles[i]);
        System.out.println();
    }
}
