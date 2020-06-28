package com.behere.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.behere.common.utils.IdWorker;
import com.behere.system.dao.RoleDao;
import com.behere.system.dao.RoleMenuDao;
import com.behere.system.dao.UserDao;
import com.behere.system.dao.UserRoleDao;
import com.behere.system.domain.RoleDO;
import com.behere.system.domain.RoleMenuDO;
import com.behere.system.service.RoleService;


@Service
public class RoleServiceImpl implements RoleService {

    public static final String ROLE_ALL_KEY = "\"role_all\"";

    public static final String DEMO_CACHE_NAME = "role";

    @Autowired
    RoleDao roleMapper;
    @Autowired
    RoleMenuDao roleMenuMapper;
    @Autowired
    UserDao userMapper;
    @Autowired
    UserRoleDao userRoleMapper;

    @Override
    public List<RoleDO> list() {
        List<RoleDO> roles = roleMapper.list(new HashMap<>(16));
        return roles;
    }


    @Override
    public List<RoleDO> list(String userId) {
        List<String> rolesIds = userRoleMapper.listRoleId(userId);
        List<RoleDO> roles = roleMapper.list(new HashMap<>(16));
        for (RoleDO roleDO : roles) {
            roleDO.setRoleSign("false");
            for (String roleId : rolesIds) {
                if (Objects.equals(roleDO.getRoleId(), roleId)) {
                    roleDO.setRoleSign("true");
                    break;
                }
            }
        }
        return roles;
    }
    @Transactional
    @Override
    public int save(RoleDO role) {
    	role.setRoleId(IdWorker.generateSnowFlakeId());
        int count = roleMapper.save(role);
        List<String> menuIds = role.getMenuIds();
        String roleId = role.getRoleId();
        List<RoleMenuDO> rms = new ArrayList<>();
        for (String menuId : menuIds) {
            RoleMenuDO rmDo = new RoleMenuDO();
            rmDo.setId(IdWorker.generateSnowFlakeId());
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
//            rms.add(rmDo);
            roleMenuMapper.save(rmDo);
        }
        roleMenuMapper.removeByRoleId(roleId);
//        if (rms.size() > 0) {
//            roleMenuMapper.batchSave(rms);
//        }
        return count;
    }

    @Transactional
    @Override
    public int remove(String id) {
        int count = roleMapper.remove(id);
        userRoleMapper.removeByRoleId(id);
        roleMenuMapper.removeByRoleId(id);
        return count;
    }

    @Override
    public RoleDO get(String id) {
        RoleDO roleDO = roleMapper.get(id);
        return roleDO;
    }

    @Override
    public int update(RoleDO role) {
        int r = roleMapper.update(role);
        List<String> menuIds = role.getMenuIds();
        String roleId = role.getRoleId();
        roleMenuMapper.removeByRoleId(roleId);
        List<RoleMenuDO> rms = new ArrayList<>();
        for (String menuId : menuIds) {
            RoleMenuDO rmDo = new RoleMenuDO();
            rmDo.setId(IdWorker.generateSnowFlakeId());
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
            rms.add(rmDo);
            roleMenuMapper.save(rmDo);
        }
//        if (rms.size() > 0) {
//            roleMenuMapper.batchSave(rms);
//        }
        return r;
    }

    @Override
    public int batchremove(String[] ids) {
        int r = roleMapper.batchRemove(ids);
        return r;
    }

}
