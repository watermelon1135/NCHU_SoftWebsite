package com.nchu.software.teachingAffairs.mapper;

import com.nchu.software.teachingAffairs.entity.StudentEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName StudentMapper
 * @Description TODO
 * @Auther 范孝发
 * @Date 2019/1/12 14:31
 * @Version 1.0
 */

@Repository
public interface StudentMapper {

    void listInsert(List list);
    List<StudentEntity> listClass(Integer classNo);
}
