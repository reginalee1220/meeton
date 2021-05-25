package model;

import java.sql.Timestamp;

public class Favorite {
    private String userid;
	private int channelnum;
	private String type;
    private Timestamp startdate;
    private int purchasednum;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getChannelnum() {
        return channelnum;
    }

    public void setChannelnum(int channelnum) {
        this.channelnum = channelnum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Timestamp getStartdate() {
        return startdate;
    }

    public void setStartdate(Timestamp startdate) {
        this.startdate = startdate;
    }

    public int getPurchasednum() {
        return purchasednum;
    }

    public void setPurchasednum(int purchasednum) {
        this.purchasednum = purchasednum;
    }
}
