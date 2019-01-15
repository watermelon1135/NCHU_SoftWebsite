package com.nchu.software.teachingAffairs.service.impl;

import com.nchu.software.teachingAffairs.mapper.CourseMapper;
import com.nchu.software.teachingAffairs.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CourseServiceImpl
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 15:52
 * @Version 1.0
 */
@Service
public class CourseServiceImpl implements ICourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public void listInsert(List list) {
        courseMapper.listInsert(list);
    }
}
