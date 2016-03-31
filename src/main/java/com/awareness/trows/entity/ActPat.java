package com.awareness.trows.entity;

import java.io.Serializable;

/**
 * Created by Throws_exception on 2015/6/15.
 */
public class ActPat implements Serializable {
    private int id;
    private long activityId;
    private long participator;
    private String message;
    private int state;
    private int praise;
    private String joinTime;
    private String patName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getActivityId() {
        return activityId;
    }

    public void setActivityId(long activityId) {
        this.activityId = activityId;
    }

    public long getParticipator() {
        return participator;
    }

    public void setParticipator(long participator) {
        this.participator = participator;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getPraise() {
        return praise;
    }

    public void setPraise(int praise) {
        this.praise = praise;
    }

    public String getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(String joinTime) {
        this.joinTime = joinTime;
    }

    public String getPatName() {
        return patName;
    }

    public void setPatName(String patName) {
        this.patName = patName;
    }
}
