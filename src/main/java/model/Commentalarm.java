package model;

import java.sql.Timestamp;

public class Commentalarm {
    private int alarmnum;
	private int commentnum;
	private String actuser;
	private Timestamp commentregister;
	private Timestamp likeregister;
	private String state;

    public int getAlarmnum() {
        return alarmnum;
    }

    public void setAlarmnum(int alarmnum) {
        this.alarmnum = alarmnum;
    }

    public int getCommentnum() {
        return commentnum;
    }

    public void setCommentnum(int commentnum) {
        this.commentnum = commentnum;
    }

    public String getActuser() {
        return actuser;
    }

    public void setActuser(String actuser) {
        this.actuser = actuser;
    }

    public Timestamp getCommentregister() {
        return commentregister;
    }

    public void setCommentregister(Timestamp commentregister) {
        this.commentregister = commentregister;
    }

    public Timestamp getLikeregister() {
        return likeregister;
    }

    public void setLikeregister(Timestamp likeregister) {
        this.likeregister = likeregister;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
