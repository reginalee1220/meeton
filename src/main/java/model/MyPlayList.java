package model;

import java.sql.Timestamp;

public class MyPlayList {
   private int myplaylistnum;
   private String userid;
   private int videonum;
   private String type;
   private Timestamp typedate;

    public int getMyplaylistnum() {
        return myplaylistnum;
    }

    public void setMyplaylistnum(int myplaylistnum) {
        this.myplaylistnum = myplaylistnum;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getVideonum() {
        return videonum;
    }

    public void setVideonum(int videonum) {
        this.videonum = videonum;
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
