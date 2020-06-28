package com.behere.oa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.behere.oa.domain.NotifyRecordDO;

/**
 * 通知通告发送记录
 */
@Mapper
public interface NotifyRecordDao {

	NotifyRecordDO get(String id);

	List<NotifyRecordDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(NotifyRecordDO notifyRecord);

	int update(NotifyRecordDO notifyRecord);

	int remove(String id);

	int batchRemove(String[] ids);

	int batchSave(List<NotifyRecordDO> records);

	String[] listNotifyIds(Map<String, Object> map);

	int removeByNotifbyId(String notifyId);

	int batchRemoveByNotifbyId(String[] notifyIds);

	int changeRead(NotifyRecordDO notifyRecord);
}
