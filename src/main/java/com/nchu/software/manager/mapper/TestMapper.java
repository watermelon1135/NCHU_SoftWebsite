package com.nchu.software.manager.mapper;


import com.nchu.software.manager.domain.TestDoamin;

import java.util.List;

/**
 * @ClassName TestMapper
 * @Description TODO
 * @Author watermelon
 * @Date 2018/12/26 14:43
 * @Version 1.0
 **/
public interface TestMapper {

    List<TestDoamin> listAll();
}
