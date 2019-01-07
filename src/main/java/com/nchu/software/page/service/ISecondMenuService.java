package com.nchu.software.page.service;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.SecondMenuEntity;

import java.util.List;

/**
 * @ClassName ISecondMenuService
 * @Description: java类作用描述
 * @Author: watermelon
 * @CreateDate: 2019/1/6 10:59
 * @UpdateUser: watermelon
 * @UpdateDate: 2019/1/6 10:59
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
public interface ISecondMenuService {
    List<SecondMenuEntity> getSecondMenuByFirstId(Integer firstmenuid);
    String getFirstMenuName(Integer secondId);
    SecondMenuEntity getSecondMenuByName(String name);
}
