package com.awareness.trows.entity;

/**
 * Created by Throws_exception on 2015/8/25.
 */
public class Relation {

    private long id;
    private long masterId;
    private long friendId;
    private int hot;
    private String cntime;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getMasterId() {
        return masterId;
    }

    public void setMasterId(long masterId) {
        this.masterId = masterId;
    }

    public long getFriendId() {
        return friendId;
    }

    public void setFriendId(long friendId) {
        this.friendId = friendId;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getCntime() {
        return cntime;
    }

    public void setCntime(String cntime) {
        this.cntime = cntime;
    }
}

