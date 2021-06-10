package model;

public class Channel {
    private int channelnum;
    private String userid;
    private String aka;
    private int subscribers;
    private int bookmarkers;

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

    public String getAka() {
        return aka;
    }

    public void setAka(String aka) {
        this.aka = aka;
    }

    public int getSubscribers() {
        return subscribers;
    }

    public void setSubscribers(int subscribers) {
        this.subscribers = subscribers;
    }

    public int getBookmarkers() {
        return bookmarkers;
    }

    public void setBookmarkers(int bookmarkers) {
        this.bookmarkers = bookmarkers;
    }
}
