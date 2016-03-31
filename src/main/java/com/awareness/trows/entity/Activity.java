package com.awareness.trows.entity;

import java.io.Serializable;


/**
 * Created by Throws_exception on 2015/6/15.
 */
public class Activity implements Serializable {
    private long activityId;
    private String typeName;
    private String activityTitle;
    private String description;
    private long userId;
    private String userName;
    private String startTime;
    private String endTime;
    private String deadLine;
    private String createTime;
    private int personNumber;
    private String location;
    private float privateCost;
    private int shareDepth;
    private int joinNow;
    private int joinCheck;
    private int hot;
    private String remark;



    @Override
    public String toString() {
        return "Activity{" +
                "activityId=" + activityId +
                ", typeName='" + typeName + '\'' +
                ", activityTitle='" + activityTitle + '\'' +
                ", description='" + description + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", deadLine='" + deadLine + '\'' +
                ", createTime='" + createTime + '\'' +
                ", personNumber=" + personNumber +
                ", location='" + location + '\'' +
                ", privateCost=" + privateCost +
                ", shareDepth=" + shareDepth +
                ", joinNow=" + joinNow +
                ", joinCheck=" + joinCheck +
                ", hot=" + hot +
                '}';
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getHot() { return hot; }

    public void setHot(int hot) { this.hot = hot; }

    public int getJoinCheck() {
        return joinCheck;
    }

    public void setJoinCheck(int joinCheck) {
        this.joinCheck = joinCheck;
    }

    public float getPrivateCost() {
        return privateCost;
    }

    public void setPrivateCost(float privateCost) {
        this.privateCost = privateCost;
    }

    public int getJoinNow() {
        return joinNow;
    }

    public void setJoinNow(int joinNow) {
        this.joinNow = joinNow;
    }

    public long getActivityId() {
        return activityId;
    }

    public void setActivityId(long activityId) {
        this.activityId = activityId;
    }

    public String getActivityTitle() {
        return activityTitle;
    }

    public void setActivityTitle(String activityTitle) {
        this.activityTitle = activityTitle;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(String deadLine) {
        this.deadLine = deadLine;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getPersonNumber() {
        return personNumber;
    }

    public void setPersonNumber(int personNumber) {
        this.personNumber = personNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getShareDepth() {
        return shareDepth;
    }

    public void setShareDepth(int shareDepth) {
        this.shareDepth = shareDepth;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
