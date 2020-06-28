package com.behere.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.DeptDO;

/**
 * 部门管理
 */
@Mapper
public interface DeptDao {

	DeptDO get(String deptId);
	
	List<DeptDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(DeptDO dept);
	
	int update(DeptDO dept);
	
	int remove(String deptId);
	
	int batchRemove(String[] deptIds);
	
	String[] listParentDept();
	
	int getDeptUserNumber(String deptId);
}
