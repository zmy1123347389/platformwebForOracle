package com.behere.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.behere.platform.dao.IndexDao;
import com.behere.platform.service.IndexService;

/**
 * @author: Behere
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexDao indexDao;

    @Override
    public String countUserByCreateDate(String date) {
        return indexDao.countUserByCreateDate(date);
    }

    @Override
    public String countOnlineUser() {
        return indexDao.countOnlineUser();
    }


    @Override
    public String countPayFlower(String date, int type) {
        return indexDao.countPayFlower(date, type);
    }

    @Override
    public String countRecharge(String date) {
        return indexDao.countRecharge(date);
    }

    @Override
    public String countBestFriend() {
        return indexDao.countBestFriend();
    }

    @Override
    public String countWithdrawal(String date) {
        return indexDao.countWithdrawal(date);
    }

    @Override
    public String countInvitation() {
        return indexDao.countInvitation();
    }
}