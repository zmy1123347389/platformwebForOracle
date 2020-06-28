package com.behere.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.RoleDO;

/**
 * 角色
 */
@Mapper
public interface RoleDao {

	RoleDO get(String roleId);
	
	List<RoleDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(RoleDO role);
	
	int update(RoleDO role);
	
	int remove(String roleId);
	
	int batchRemove(String[] roleIds);
}
