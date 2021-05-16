package model;

public class Subscriptions {
    private String userid;
	private int channelnum;
	private int purchasednum;
	private String startdate;

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

    public int getPurchasednum() {
        return purchasednum;
    }

    public void setPurchasednum(int purchasednum) {
        this.purchasednum = purchasednum;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }
}
