package com.nchu.software.teachingAffairs.service.impl;

import com.nchu.software.teachingAffairs.entity.StudentEntity;
import com.nchu.software.teachingAffairs.mapper.StudentMapper;
import com.nchu.software.teachingAffairs.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName StudentServiceImpl
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 14:42
 * @Version 1.0
 */

@Service
public class StudentServiceImpl implements IStudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public void listInsert(List list) {
        studentMapper.listInsert(list);
    }

    @Override
    public List<StudentEntity> listClass(Integer classNo) {
        return studentMapper.listClass(classNo);
    }
}
