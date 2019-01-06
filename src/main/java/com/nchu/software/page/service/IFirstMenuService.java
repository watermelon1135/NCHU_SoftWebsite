package com.nchu.software.page.service;

import com.nchu.software.page.entity.FirstMenuEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName IFirstMenuService
 * @Description TODO
 * @Author watermelon
 * @Date 2019/1/6 18:15
 * @Version 1.0
 **/

public interface IFirstMenuService {
    List<FirstMenuEntity> listAll();
}
