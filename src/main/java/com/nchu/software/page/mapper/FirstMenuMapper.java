package com.nchu.software.page.mapper;

import java.util.List;

import com.nchu.software.page.entity.FirstMenuEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface FirstMenuMapper {

	List<FirstMenuEntity> listAll();

	FirstMenuEntity getFirstMenuByName(String name);
}
