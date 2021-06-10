package model;

import java.sql.Time;
import java.sql.Timestamp;

public class Video {
    private int videonum;
    private int channelnum;
    private String userid;
    private String title;
    private String description;
    private String thumbnail;
    private String visibility;
    private String register;
    private int views;
    private int comments;
    private int likes;
    private int report;
    private String videofile;
    private Time videotime;

    // paging
    private int page;
    private int start;
    private int end;

    // search
    private String keyword;

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

    public String getVisibility() {
        return visibility;
    }

    public void setVisibility(String visibility) {
        this.visibility = visibility;
    }

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
