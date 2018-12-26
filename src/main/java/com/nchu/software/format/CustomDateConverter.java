package com.nchu.software.format;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName CustomDateConverter
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2018/12/26 17:03
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/26 17:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public class CustomDateConverter implements Converter<String,Date> {

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            //解析成功就返回
            return sdf.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //否则返回null
        return null;
    }
}
