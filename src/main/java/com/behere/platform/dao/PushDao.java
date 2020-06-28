package com.behere.platform.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.behere.common.utils.Query;
import com.behere.platform.domain.*;

import java.util.List;

/**
 * @author: Behere
 */
@Mapper
public interface PushDao {

    /**
     * 推送列表
     * @param query
     * @return
     */
    List<PushDO> queryPushInformations(Query query);

    int count(Query query);

    int savePushInformation(PushDO pushDO);

    void savePushUser(@Param("pushId") String pushId, @Param("list") String[] ids);

    PushDO queryPushInformationById(@Param("id") String id);

    String[] queryPushUserByPushInformationId(@Param("pushId") String pushId);
}
