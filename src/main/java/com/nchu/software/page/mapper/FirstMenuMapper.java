package com.nchu.software.page.mapper;

import com.nchu.software.page.entity.FirstMenuEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
    * @Description:    java类作用描述
    * @Author:         watermelon
    * @CreateDate:     2019/1/8 8:21
    * @UpdateUser:     watermelon
    * @UpdateDate:     2019/1/8 8:21
    * @UpdateRemark:   修改内容
    * @Version:        1.0
*/
@Repository
public interface FirstMenuMapper {
	/**
	 * @Description 查询所有一级菜单信息
	 * @author  watermelon
	 * @param null
	 * @return  List<FirstMenuEntity>
	 * @exception
	 * @date   2019/1/7 22:54
	 */
	List<FirstMenuEntity> listAll();

	/**
	 * @Description 根据一级菜单名称查询一级菜单信息
	 * @author  watermelon
	 * @param name
	 * @param flag
	 * @return  FirstMenuEntity
	 * @exception
	 * @date   2019/1/7 22:54
	 */
	FirstMenuEntity getFirstMenuByName(@Param("name") String name);

	List<FirstMenuEntity> listAllByFlag(int flag);

}
