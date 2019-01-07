package com.nchu.software.page.mapper;


import com.nchu.software.page.entity.PageContentEntity;
import org.springframework.stereotype.Repository;

/**
 * @author TyCoding
 * @date 18-4-30上午9:50
 */
@Repository
public interface PageContentMapper {
    PageContentEntity getContextBySecondId(int secondId);

}
