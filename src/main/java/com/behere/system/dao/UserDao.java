package com.behere.system.dao;

import org.apache.ibatis.annotations.Mapper;

import com.behere.system.domain.UserDO;

import java.util.List;
import java.util.Map;

/**
 * 
 */
@Mapper
public interface UserDao {

	UserDO get(String userId);
	
	List<UserDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(UserDO user);
	
	int update(UserDO user);
	
	int remove(String userId);
	
	int batchRemove(String[] userIds);
	
	String[] listAllDept();
}