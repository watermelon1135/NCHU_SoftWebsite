package com.nchu.software.manager.mapper;


import com.nchu.software.manager.entity.TestDoamin;

import java.util.List;

/**
 * @ClassName TestMapper
 * @Description TODO
 * @Author watermelon
 * @Date 2018/12/26 14:43
 * @Version 1.0
 **/
public interface TestMapper {

    /**
     * @return 所有的实体类
     */
    List<TestDoamin> listAll();
}
