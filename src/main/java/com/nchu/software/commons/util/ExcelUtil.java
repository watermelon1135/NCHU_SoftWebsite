package com.nchu.software.commons.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;

import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.regex.Pattern;

/**
 * @ClassName ExcelUtil
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 12:20
 * @Version 1.0
 */
public class ExcelUtil {

    public static boolean isStuNo(HSSFCell cell) {
        String regEx = "\\d{8}"; //8位数字
        Pattern pattern = Pattern.compile(regEx);
        return pattern.matcher(getCellValue(cell)).matches();
    }

    /**
     * 获取单元格数据
     *
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    public static String getCellValue(HSSFCell cell) {
        if (Objects.isNull(cell)) {
            return "";
        }

        String value = "";
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_NUMERIC: // 数字
                //如果为时间格式的内容
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    //注：format格式 yyyy-MM-dd HH:mm:ss 中小时为24小时制，若要12小时制，则把H变为小h即可，yyyy-MM-dd hh:mm:ss
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    value = sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString();
                    break;
                } else {
                    value = cell.getNumericCellValue()+"";
                }
                break;
            case Cell.CELL_TYPE_STRING: // 字符串
                value = cell.getStringCellValue();
                break;
            case Cell.CELL_TYPE_BOOLEAN: // Boolean
                value = cell.getBooleanCellValue() + "";
                break;
            case Cell.CELL_TYPE_FORMULA: // 公式
                value = cell.getCellFormula() + "";
                break;
            case Cell.CELL_TYPE_BLANK: // 空值
                value = "";
                break;
            case Cell.CELL_TYPE_ERROR: // 故障
                value = "非法字符";
                break;
            default:
                value = "未知类型";
                break;
        }
        return value;
    }
}
