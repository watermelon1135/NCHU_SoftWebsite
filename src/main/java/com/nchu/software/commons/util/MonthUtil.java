package com.nchu.software.commons.util;


import java.util.Date;

/**
 * @ClassName MonthUtil
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/9 20:03
 * @Version 1.0
 */
public class MonthUtil {
    public static String changeMonth(Date date){
        if(date == null){
            return null;
        }
        int m = date.getMonth();
        String months[] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
        return months[m];
    }
}
