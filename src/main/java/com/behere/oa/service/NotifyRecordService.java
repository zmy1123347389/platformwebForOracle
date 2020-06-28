package com.behere.oa.service;

import java.util.List;
import java.util.Map;

import com.behere.oa.domain.NotifyRecordDO;

/**
 * 通知通告发送记录
 */
public interface NotifyRecordService {
	
	NotifyRecordDO get(String id);
	
	List<NotifyRecordDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(NotifyRecordDO notifyRecord);
	
	int update(NotifyRecordDO notifyRecord);
	
	int remove(String id);
	
	int batchRemove(String[] ids);

	/**
	 * 更改阅读状态
	 * @return
	 */
	int changeRead(NotifyRecordDO notifyRecord);
}
