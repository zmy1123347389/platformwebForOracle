package com.behere.platform.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import com.behere.common.utils.Query;
import com.behere.platform.domain.User;
import com.behere.platform.domain.UserAuth;

import java.util.List;

/**
 * @author: Behere
 */
@Mapper
public interface PlatformUserDao {

    /**
     * 用户列表
     * @return
     */
    List<User> list(Query query);

    int count(Query query);

    int countUserAuth(Query query);

    /**
     * 用户认证列表
     * @param query
     * @return
     */
    List<UserAuth> listUserAuthInformation(Query query);

    int updateUserAuth(@Param("userAuth") int userAuth, @Param("userId") String userId);

    int updateUserAuthInformation(@Param("status") int status, @Param("id") String id);

    UserAuth queryUserAuthInformationById(@Param("id") String id);

    int updateUserDeleted(@Param("deleted") int deleted, @Param("userId") String userId);

    User queryUserById(@Param("userId") String userId);
}
