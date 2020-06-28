package com.behere.system.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.behere.system.domain.RoleDO;

@Service
public interface RoleService {

	RoleDO get(String id);

	List<RoleDO> list();

	int save(RoleDO role);

	int update(RoleDO role);

	int remove(String id);

	List<RoleDO> list(String userId);

	int batchremove(String[] ids);
}
