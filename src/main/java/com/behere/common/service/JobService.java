package com.behere.common.service;

import java.util.List;
import java.util.Map;

import org.quartz.SchedulerException;

import com.behere.common.domain.TaskDO;

/**
 * 
 */
public interface JobService {

	TaskDO get(String id);
	
	List<TaskDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(TaskDO taskScheduleJob);
	
	int update(TaskDO taskScheduleJob);
	
	int remove(String id);
	
	int batchRemove(String[] ids);

	void initSchedule() throws SchedulerException;

	void changeStatus(String jobId, String cmd) throws SchedulerException;

	void updateCron(String jobId) throws SchedulerException;
}
