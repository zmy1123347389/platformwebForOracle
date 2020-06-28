package com.behere.platform.service;

/**
 * @author: Behere
 */
public interface IndexService {

    /**
     * 新增用户
     * @param date
     * @return
     */
    String countUserByCreateDate(String date);

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
    String countPayFlower(String date, int type);

    /**
     * 用户充值
     * @param date
     * @return
     */
    String countRecharge(String date);

    /**
     * 最佳男女友
     * @return
     */
    String countBestFriend();

    /**
     * 提现
     * @return
     */
    String countWithdrawal(String date);

    /**
     * 邀请
     * @return
     */
    String countInvitation();
}
