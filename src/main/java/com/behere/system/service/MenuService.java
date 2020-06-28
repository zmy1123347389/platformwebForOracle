package com.behere.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.behere.common.domain.Tree;
import com.behere.system.domain.MenuDO;

@Service
public interface MenuService {
	Tree<MenuDO> getSysMenuTree(String id);

	List<Tree<MenuDO>> listMenuTree(String id);

	Tree<MenuDO> getTree();

	Tree<MenuDO> getTree(String id);

	List<MenuDO> list(Map<String, Object> params);

	int remove(String id);

	int save(MenuDO menu);

	int update(MenuDO menu);

	MenuDO get(String id);

	Set<String> listPerms(String userId);
}
