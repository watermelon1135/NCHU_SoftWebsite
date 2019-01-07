package com.nchu.software.page.mapper;

import com.nchu.software.page.entity.FirstMenuEntity;
import com.nchu.software.page.entity.SecondMenuEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName SecondMenuMapper
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 10:58
 * @Version 1.0
 **/
@Repository
public interface SecondMenuMapper {

    List<SecondMenuEntity> getSecondMenuByFirstId(Integer firstmenuid);

    String getFirstMenuName(Integer secondId);

    SecondMenuEntity getSecondMenuByName(String name);
}
