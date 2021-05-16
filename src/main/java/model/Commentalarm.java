package model;

public class Commentalarm {
    private int alarmnum;
	private int commentnum;
	private String actuser;
	private String commentregister;
	private String likeregister;
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

    public String getCommentregister() {
        return commentregister;
    }

    public void setCommentregister(String commentregister) {
        this.commentregister = commentregister;
    }

    public String getLikeregister() {
        return likeregister;
    }

    public void setLikeregister(String likeregister) {
        this.likeregister = likeregister;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
