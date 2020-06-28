package com.behere.platform.service;

import java.util.List;
import java.util.Map;

import com.behere.common.utils.Query;
import com.behere.platform.domain.*;

/**
 * @author: Behere
 */
public interface AccountService {

    /**
     * 获取提现申请列表
     * @return
     */
    List<WithdrawalCash> queryWithdrawalCash(Query query);

    int count(Query query);

    /**
     * 修改提现申请状态
     * @param id
     * @param type
     * @return
     */
    int updateWithdrawalStatus(String id, int type);

    /**
     * 为用户表加锁
     * @param userId
     * @return
     */
    User queryUserByIdForUpdate(String userId);

    /**
     * 修改用户钻石
     * @param flower
     * @param userId
     * @return
     */
    int addFlower(int flower, String userId);

    /**
     * 通过提现申请ID获取申请信息
     * @param id
     * @return
     */
    RechargeRecord queryRechargeRecordById(String id);


    /**
     * 拒绝提现申请
     * @param id
     * @return
     */
    int dealRefuseWithdrawalApply(String id);

    /**
     * 查询提现详情
     * @param id
     * @return
     */
    WithdrawalCash queryWithdrawalById(String id);

    /**
     * 接受提现
     * @param id
     */
    void acceptWithdrawal(String id);

    /**
     * 统计充值数量
     * @param query
     * @return
     */
    int countRecharges(Query query);

    /**
     * 充值列表
     * @param query
     * @return
     */
    List<RechargeDO> queryRechargeList(Query query);

    List<AuthAccount> queryAuthAccount(Query query);

    int countAuthAccount(Query query);
}