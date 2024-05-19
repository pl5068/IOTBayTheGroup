package com.iotbay.iotbaydemo;

import java.sql.Timestamp;

public class UserLogs {

    private int logid;
    private int userid;
    private String logAction;
    private Timestamp timeOperation;

    public UserLogs(int logid, int userid, String logAction, Timestamp timeOperation) {
        this.logid = logid;
        this.userid = userid;
        this.logAction = logAction;
        this.timeOperation = timeOperation;
    }

    public int getLogid() {
        return logid;
    }

    public void setLogid(int logid) {
        this.logid = logid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getLogAction() {
        return logAction;
    }

    public void setLogAction(String logAction) {
        this.logAction = logAction;
    }

    public Timestamp getTimeOperation() {
        return timeOperation;
    }

    public void setTimeOperation(Timestamp timeOperation) {
        this.timeOperation = timeOperation;
    }

}
