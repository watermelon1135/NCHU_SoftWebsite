package com.nchu.software.teachingAffairs.service;

import com.nchu.software.teachingAffairs.entity.StudentEntity;

import java.util.List;

/**
 * @ClassName IStudentService
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 14:42
 * @Version 1.0
 */
public interface IStudentService {
    void listInsert(List list);
    List<StudentEntity> listClass(Integer classNo);
}
