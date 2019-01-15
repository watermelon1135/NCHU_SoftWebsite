package com.nchu.software.mailbox.entity;

import lombok.Data;

/**
    * @Description:    用于分页
    * @Author:         watermelon
    * @CreateDate:     2019/1/8 10:55
    * @UpdateUser:     watermelon
    * @UpdateDate:     2019/1/8 10:55
    * @UpdateRemark:   修改内容
    * @Version:        1.0
*/
@Data
public class Pages {
    /**
     * pagenum:当前页号
     * pagesize:页面大小
     * pagesize:总页面数
     */
    private Integer pageNum;
    private Integer PageSize = 8;
    private Long pageNumAll;

}
