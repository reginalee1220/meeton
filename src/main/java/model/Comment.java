package model;

import java.sql.Timestamp;

public class Comment {
    private int commentnum;
	private int videonum;
	private String userid;
	private String content;
	private int likes;
	private Timestamp register;
	private String pinned;
	private int ref;
	private int lev;
	private int seq;
	private int report;

    public int getCommentnum() {
        return commentnum;
    }

    public void setCommentnum(int commentnum) {
        this.commentnum = commentnum;
    }

    public int getVideonum() {
        return videonum;
    }

    public void setVideonum(int videonum) {
        this.videonum = videonum;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public Timestamp getRegister() {
        return register;
    }

    public void setRegister(Timestamp register) {
        this.register = register;
    }

    public String getPinned() {
        return pinned;
    }

    public void setPinned(String pinned) {
        this.pinned = pinned;
    }

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public int getLev() {
        return lev;
    }

    public void setLev(int lev) {
        this.lev = lev;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getReport() {
        return report;
    }

    public void setReport(int report) {
        this.report = report;
    }
}
