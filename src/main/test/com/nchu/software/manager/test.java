package com.nchu.software.manager;

import com.nchu.software.manager.mapper.TestMapper;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @ClassName test
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2018/12/26 14:38
 * @UpdateUser: watermelon
 * @UpdateDate: 2018/12/26 14:38
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-context.xml")
public class test {

    @Autowired
    TestMapper mapper;

    @Test
    public void test (){
        System.out.println(mapper.listAll());
    }


    @Test
    public void loggerTest(){
        Logger logger  = Logger.getLogger(test.class);
        logger.debug("这是测试用的");
    }
}
