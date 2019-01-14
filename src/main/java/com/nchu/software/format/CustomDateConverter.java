package com.nchu.software.format;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    Logger LOG = LoggerFactory.getLogger(this.getClass());

    private String datePattern;

    public void setDatePattern(String datePattern) {
        this.datePattern = datePattern;
    }

    @Override
    public Date convert(String s) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(this.datePattern);
        try {
            Date date = dateFormat.parse(s);
            return date;
        }catch (ParseException e){
            LOG.error("convertError",e);
        }
        return null;
    }
}
