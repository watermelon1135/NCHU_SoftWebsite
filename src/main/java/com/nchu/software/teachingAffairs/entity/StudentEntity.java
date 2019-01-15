package com.nchu.software.teachingAffairs.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @ClassName StudentEntity
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 14:02
 * @Version 1.0
 */
@Data
public class StudentEntity {
    @Excel(name = "学号")
    @NotNull
    private String stuNo;
    @Excel(name = "班级编号")
    private Integer classNo;
    @Excel(name = "姓名")
    private String name;
    @Excel(name = "身份证号码")
    private String idCard;
    @Excel(name = "性别")
    private String sex;
    @Excel(name = "民族")
    private String nation;
    @Excel(name = "政治面貌")
    private String political;
    @Excel(name = "生源所在地")
    private String source;
    @Excel(name = "入学时间")
    private Date intentedDate;
    @Excel(name = "毕业时间")
    private Date graduationDate;
    @Excel(name = "手机号码")
    private String phone;
    @Excel(name = "电子邮箱")
    private String email;
    @Excel(name = "宿舍")
    private String dormitoryId;
    @Excel(name = "父亲联系电话")
    private String fatherPhone;
    @Excel(name = "母亲联系电话")
    private String motherPhone;
    @Excel(name = "家庭常用电话")
    private String familyPhone;
    @Excel(name = "家庭常用地址")
    private String familyAddress;
    @Excel(name = "邮政编码")
    private String zipCode;
    @Excel(name = "QQ号码")
    private String QQNo;
    @Excel(name = "微信号码")
    private String micromessageNo;
    /*@Excel(name = "照片")
    private String picture;*/
    @Excel(name = "学生状态")
    private Integer status;                 //1：正常；2：休学；3：退学；4：毕业

}
