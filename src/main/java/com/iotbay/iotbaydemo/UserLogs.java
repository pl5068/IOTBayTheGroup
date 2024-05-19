package com.iotbay.iotbaydemo;

public class UserLogs {

    private int logid;
    private int userid;
    private String logAction;
    private String timeOperation;

    public UserLogs(int logid, int userid, String logAction, String timeOperation) {
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

    public String getTimeOperation() {
        return timeOperation;
    }

    public void setTimeOperation(String timeOperation) {
        this.timeOperation = timeOperation;
    }

}
