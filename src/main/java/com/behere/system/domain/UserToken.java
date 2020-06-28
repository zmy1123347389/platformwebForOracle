package com.behere.system.domain;

import java.io.Serializable;

/**
 * @author behere 1992lcg@163.com
 * @version V1.0
 */
public class UserToken implements Serializable {
    private static final Long serialVersionUID = 1L;
    private String userId;
    private String username;
    private String name;
    private String password;
    private String deptId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}
