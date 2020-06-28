package com.behere.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.UserRoleDO;

/**
 * 用户与角色对应关系
 */
@Mapper
public interface UserRoleDao {

	UserRoleDO get(String id);

	List<UserRoleDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserRoleDO userRole);

	int update(UserRoleDO userRole);

	int remove(String id);

	int batchRemove(String[] ids);

	List<String> listRoleId(String userId);

	int removeByUserId(String userId);

	int removeByRoleId(String roleId);

	int batchSave(List<UserRoleDO> list);

	int batchRemoveByUserId(String[] ids);
}
