package com.behere.oa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.behere.common.utils.IdWorker;
import com.behere.oa.dao.NotifyRecordDao;
import com.behere.oa.domain.NotifyRecordDO;
import com.behere.oa.service.NotifyRecordService;



@Service
public class NotifyRecordServiceImpl implements NotifyRecordService {
	@Autowired
	private NotifyRecordDao notifyRecordDao;
	
	@Override
	public NotifyRecordDO get(String id){
		return notifyRecordDao.get(id);
	}
	
	@Override
	public List<NotifyRecordDO> list(Map<String, Object> map){
		return notifyRecordDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return notifyRecordDao.count(map);
	}
	
	@Override
	public int save(NotifyRecordDO notifyRecord){
		notifyRecord.setId(IdWorker.generateSnowFlakeId());
		return notifyRecordDao.save(notifyRecord);
	}
	
	@Override
	public int update(NotifyRecordDO notifyRecord){
		return notifyRecordDao.update(notifyRecord);
	}
	
	@Override
	public int remove(String id){
		return notifyRecordDao.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return notifyRecordDao.batchRemove(ids);
	}

	@Override
	public int changeRead(NotifyRecordDO notifyRecord) {
		return notifyRecordDao.changeRead(notifyRecord);
	}

}
