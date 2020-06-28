package com.behere.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.MenuDO;

/**
 * 菜单管理
 */
@Mapper
public interface MenuDao {

	MenuDO get(String menuId);
	
	List<MenuDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(MenuDO menu);
	
	int update(MenuDO menu);
	
	int remove(String menuId);
	
	int batchRemove(String[] menuIds);
	
	List<MenuDO> listMenuByUserId(String id);
	
	List<String> listUserPerms(String id);
}
