package com.behere.platform.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.behere.common.utils.Query;
import com.behere.platform.dao.PlatformUserDao;
import com.behere.platform.domain.User;
import com.behere.platform.domain.UserAuth;

import java.util.List;

/**
 * @author: Behere
 */
public interface PlatformUserService {

    List<User> list(Query query);

    int count(Query query);

    int countUserAuth(Query query);

    /**
     * 用户认证列表
     * @param query
     * @return
     */
    List<UserAuth> listUserAuthInformation(Query query);

    int updateUserAuth(int userAuth, String userId);

    int updateUserAuthInformation(int status, String id);

    int dealSuccessUserAuth(int status, String authId, String userId);

    int updateUserDeleted(int deleted, String userId);

    User queryUserById(String userId);
}
