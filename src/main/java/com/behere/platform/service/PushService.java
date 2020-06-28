package com.behere.platform.service;

import java.util.List;

import com.behere.common.utils.Query;
import com.behere.platform.domain.*;

/**
 * @author: Behere
 */
public interface PushService {

    /**
     * 推送列表
     * @param query
     * @return
     */
    List<PushDO> queryPushInformations(Query query);

    int count(Query query);

    int savePushInformation(PushDO pushDO);

    void sendPushMessage(PushDO pushDO);

    void savePushUser(String pushId, String[] ids);

    void sendBroadcast(int type, String[] ids, String title, String content);

    PushDO queryPushInformationById(String id);

    String[] queryPushUserByPushInformationId(String pushId);

    void test();
}