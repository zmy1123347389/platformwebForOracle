package com.behere.oa.service;

import java.util.List;
import java.util.Map;

import com.behere.common.utils.PageUtils;
import com.behere.oa.domain.NotifyDO;

/**
 * 通知通告
 */
public interface NotifyService {

	NotifyDO get(String id);

	List<NotifyDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(NotifyDO notify);

	int update(NotifyDO notify);

	int remove(String id);

	int batchRemove(String[] ids);

//	Map<String, Object> message(String userId);

	PageUtils selfList(Map<String, Object> map);
}
