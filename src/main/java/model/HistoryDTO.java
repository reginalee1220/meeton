package model;

import java.sql.Time;
import java.sql.Timestamp;

public class HistoryDTO {
    private int videonum;
    private int channelnum;
    private String userid;
    private String title;
    private String description;
    private String thumbnail;
    private String visivility;
    private Timestamp register;
    private int views;
    private int comments;
    private int likes;
    private int report;
    private String videofile;
    private Time videotime;
    private int myplaylistnum;
    private String type;
    private Timestamp typedate;

    public int getVideonum() {
        return videonum;
    }

    public void setVideonum(int videonum) {
        this.videonum = videonum;
    }

    public int getChannelnum() {
        return channelnum;
    }

    public void setChannelnum(int channelnum) {
        this.channelnum = channelnum;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getVisivility() {
        return visivility;
    }

    public void setVisivility(String visivility) {
        this.visivility = visivility;
    }

    public Timestamp getRegister() {
        return register;
    }

    public void setRegister(Timestamp register) {
        this.register = register;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getReport() {
        return report;
    }

    public void setReport(int report) {
        this.report = report;
    }

    public String getVideofile() {
        return videofile;
    }

    public void setVideofile(String videofile) {
        this.videofile = videofile;
    }

    public Time getVideotime() {
        return videotime;
    }

    public void setVideotime(Time videotime) {
        this.videotime = videotime;
    }

    public int getMyplaylistnum() {
        return myplaylistnum;
    }

    public void setMyplaylistnum(int myplaylistnum) {
        this.myplaylistnum = myplaylistnum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getTypedate() {
        return typedate;
    }

    public void setTypedate(Timestamp typedate) {
        this.typedate = typedate;
    }
}
