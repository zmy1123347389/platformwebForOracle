package com.behere.common.service;

import java.util.List;
import java.util.Map;

import com.behere.common.domain.FileDO;

/**
 * 文件上传
 */
public interface FileService {
	
	FileDO get(String id);
	
	List<FileDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(FileDO sysFile);
	
	int update(FileDO sysFile);
	
	int remove(String id);
	
	int batchRemove(String[] ids);

	/**
	 * 判断一个文件是否存在
	 * @param url FileDO中存的路径
	 * @return
	 */
    Boolean isExist(String url);
}
