package com.behere.common.domain;

import java.io.Serializable;

/**
 * 文件上传
 */
public class FileDO implements Serializable {
    private static final Long serialVersionUID = 1L;

    //
    private String id;
    // 文件类型
    private String type;
    // URL地址
    private String url;
    // 创建时间
    private String createString;


    public FileDO() {
        super();
    }


    public FileDO(String type, String url, String createString) {
        super();
        this.type = type;
        this.url = url;
        this.createString = createString;
    }


    /**
     * 设置：
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public String getId() {
        return id;
    }

    /**
     * 设置：文件类型
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取：文件类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置：URL地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取：URL地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置：创建时间
     */
    public void setCreateString(String createString) {
        this.createString = createString;
    }

    /**
     * 获取：创建时间
     */
    public String getCreateString() {
        return createString;
    }

    @Override
    public String toString() {
        return "FileDO{" +
                "id=" + id +
                ", type=" + type +
                ", url='" + url + '\'' +
                ", createString=" + createString +
                '}';
    }
}
