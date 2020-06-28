package com.behere.platform.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;

/**
 * @author: Behere
 */
@Mapper
public interface IndexDao {

    /**
     * 新增用户
     * @param date
     * @return
     */
    String countUserByCreateDate(@Param("date") String date);

    /**
     * 在线用户
     * @return
     */
    String countOnlineUser();

    /**
     * 视频通话
     * @param date
     * @return
     */
    String countPayFlower(@Param("date") String date, @Param("type") int type);

    /**
     * 用户充值
     * @param date
     * @return
     */
    String countRecharge(@Param("date") String date);

    /**
     * 最佳男女友
     * @return
     */
    String countBestFriend();

    /**
     * 提现
     * @return
     */
    String countWithdrawal(@Param("date") String date);

    /**
     * 邀请
     * @return
     */
    String countInvitation();
}
