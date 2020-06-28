package com.behere.system.service;

import java.util.List;
import java.util.Map;

import com.behere.common.domain.Tree;
import com.behere.system.domain.DeptDO;

/**
 * 部门管理
 */
public interface DeptService {
	
	DeptDO get(String deptId);
	
	List<DeptDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DeptDO sysDept);
	
	int update(DeptDO sysDept);
	
	int remove(String deptId);
	
	int batchRemove(String[] deptIds);

	Tree<DeptDO> getTree();
	
	boolean checkDeptHasUser(String deptId);
}
