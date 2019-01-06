package com.nchu.software.page.mapper;


import com.nchu.software.page.entity.PageContextEntity;
import org.springframework.stereotype.Repository;

/**
 * @author TyCoding
 * @date 18-4-30上午9:50
 */
@Repository
public interface PageContextMapper {
    PageContextEntity getContextBySecondId(int secondId);

}
