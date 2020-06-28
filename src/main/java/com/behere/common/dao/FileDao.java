package com.behere.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.common.domain.FileDO;

/**
 * 文件上传
 */
@Mapper
public interface FileDao {

	FileDO get(String id);
	
	List<FileDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(FileDO file);
	
	int update(FileDO file);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
}
