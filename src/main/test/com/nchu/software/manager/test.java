package com.nchu.software.manager;

import com.nchu.software.manager.mapper.TestMapper;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

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

    //@Autowired
    //TestMapper mapper;

    //@Test
    //public void test (){
      //  System.out.println(mapper.listAll());
    //}


    @Test
    public void loggerTest(){
        int a=0;
        List<String> list = new ArrayList<>();
        list.add("aa");
        list.add("bb");
        list.add("cc");
        list.add("dd");
        a++;
        System.out.println(a+".............");
    }
}
