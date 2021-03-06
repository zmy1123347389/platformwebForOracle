package com.behere.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.common.domain.TaskDO;

/**
 * 
 */
@Mapper
public interface TaskDao {

	TaskDO get(String id);
	
	List<TaskDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(TaskDO task);
	
	int update(TaskDO task);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
}
