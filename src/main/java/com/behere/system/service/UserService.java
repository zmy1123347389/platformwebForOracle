package com.behere.system.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.behere.common.domain.Tree;
import com.behere.system.domain.DeptDO;
import com.behere.system.domain.UserDO;
import com.behere.system.vo.UserVO;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public interface UserService {
	UserDO get(String id);

	List<UserDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserDO user);

	int update(UserDO user);

	int remove(String userId);

	int batchremove(String[] userIds);

	boolean exit(Map<String, Object> params);

	Set<String> listRoles(String userId);

	int resetPwd(UserVO userVO,UserDO userDO) throws Exception;
	int adminResetPwd(UserVO userVO) throws Exception;
	Tree<DeptDO> getTree();

	/**
	 * 更新个人信息
	 * @param userDO
	 * @return
	 */
	int updatePersonal(UserDO userDO);

	/**
	 * 更新个人图片
	 * @param file 图片
	 * @param avatar_data 裁剪信息
	 * @param userId 用户ID
	 * @throws Exception
	 */
    Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, String userId) throws Exception;
}
