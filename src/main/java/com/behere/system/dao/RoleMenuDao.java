package com.behere.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.RoleMenuDO;

/**
 * 角色与菜单对应关系
 */
@Mapper
public interface RoleMenuDao {

	RoleMenuDO get(String id);
	
	List<RoleMenuDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(RoleMenuDO roleMenu);
	
	int update(RoleMenuDO roleMenu);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
	
	List<String> listMenuIdByRoleId(String roleId);
	
	int removeByRoleId(String roleId);

	int removeByMenuId(String menuId);
	
	int batchSave(List<RoleMenuDO> list);
}
