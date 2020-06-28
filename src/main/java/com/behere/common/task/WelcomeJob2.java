package com.behere.common.task;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

import com.behere.oa.domain.Response;
import com.behere.system.domain.UserDO;
import com.behere.system.service.UserService;

@Component
public class WelcomeJob2 implements Job{
	@Autowired
	SimpMessagingTemplate template;
	
	@Autowired
	UserService uerService;

    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
    	List<UserDO> list = uerService.list(null);
    	for (UserDO userDO : list) {
			System.out.println(userDO.getName());
		}

    }

}