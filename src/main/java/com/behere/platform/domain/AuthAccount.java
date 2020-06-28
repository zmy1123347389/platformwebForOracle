package com.behere.platform.domain;

/**
 * @author: Behere
 */
public class AuthAccount {

    private String userId;

    private String nickName;

    private double flower;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public double getFlower() {
        return flower;
    }

    public void setFlower(double flower) {
        this.flower = flower;
    }
}