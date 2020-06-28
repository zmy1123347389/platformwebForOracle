package com.behere.oa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.oa.domain.NotifyDO;
import com.behere.oa.domain.NotifyDTO;

/**
 * 通知通告
 */
@Mapper
public interface NotifyDao {

	NotifyDO get(String id);

	List<NotifyDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(NotifyDO notify);

	int update(NotifyDO notify);

	int remove(String id);

	int batchRemove(String[] ids);

	List<NotifyDO> listByIds(String[] ids);

	int countDTO(Map<String, Object> map);

	List<NotifyDTO> listDTO(Map<String, Object> map);
}
