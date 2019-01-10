package com.nchu.software.manager.mapper;

import com.nchu.software.manager.entity.AdministratorEntity;
import org.springframework.stereotype.Repository;

/**
 * @ClassName AdministratorMapper
 * @Description: java类作用描述
 * @Author: Taodada
 * @CreateDate: 2019/1/9 18:03
 * @UpdateUser: Taodada
 * @UpdateDate: 2019/1/9 18:03
 * @UpdateRemark: 修改内容
 * @Version: 1.0
 **/
@Repository
public interface AdministratorMapper {
    /**
     * @Description //TODO 
     * @author  taotao
     * @param username
     * @return  AdministratorEntity
     * @exception 
     * @date   2019/1/10 11:29
    */
    AdministratorEntity findUserByUsername(String username);
}
