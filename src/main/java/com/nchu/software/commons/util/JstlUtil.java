package com.nchu.software.commons.util;


import java.util.Date;

/**
 * @ClassName JstlUtil
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/9 20:03
 * @Version 1.0
 */
public class JstlUtil {
    public static String changeMonth(Date date){
        if(date == null){
            return null;
        }
        int m = date.getMonth();
        String months[] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
        return months[m];
    }
    public static String changeRelevance(String str){
        if(str == null){
            return null;
        }
        String rel[] = {"网络对于学习的总体影响利大于弊","网络对于学习的总体影响弊大于利","网络对于学习的总体影响影响不大",
                "学习遇到困难时，常去图书馆查阅资料","学习遇到困难时，常向老师请教","学习遇到困难时，常向同学请教","学习遇到困难时，常上网查资料",
                "经常看网络公开课","从不看网络公开课","偶尔看网络公开课",
                "熬夜上网主要是学习","熬夜上网主要是娱乐","熬夜上网主要是社交","基本上不熬夜上网",
                "上课时上网主要是查询与课堂教学有关的内容","上课时上网主要是娱乐","上课基本上不上网",
                "成绩优秀","成绩良好","成绩较差"};
        return rel[Integer.parseInt(str)-1];
    }

}
