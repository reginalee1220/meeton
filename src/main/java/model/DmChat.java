package model;

public class DmChat {
    private int dmnum;
	private String dmfile;
	private String sender;
	private String recipient;

    public int getDmnum() {
        return dmnum;
    }

    public void setDmnum(int dmnum) {
        this.dmnum = dmnum;
    }

    public String getDmfile() {
        return dmfile;
    }

    public void setDmfile(String dmfile) {
        this.dmfile = dmfile;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }
}
