package com.behere.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.common.domain.DictDO;

/**
 * 字典表
 */
@Mapper
public interface DictDao {

	DictDO get(String id);

	List<DictDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DictDO dict);

	int update(DictDO dict);

	int remove(String id);

	int batchRemove(String[] ids);

	List<DictDO> listType();
}
