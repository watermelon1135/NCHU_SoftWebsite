package com.nchu.software.teachingAffairs.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName CourseMapper
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 15:42
 * @Version 1.0
 */

@Repository
public interface CourseMapper {

    void listInsert(List list);
}
