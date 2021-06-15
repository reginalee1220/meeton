package model;


public class Purchased {
    private int purchasednum;
	private String paydate;
	private int payment;
	private String method;
	private String userid;
    private String expired;

    public int getPurchasednum() {
        return purchasednum;
    }

    public void setPurchasednum(int purchasednum) {
        this.purchasednum = purchasednum;
    }

    public String getPaydate() {
        return paydate;
    }

    public void setPaydate(String paydate) {
        this.paydate = paydate;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getExpired() {
        return expired;
    }

    public void setExpired(String expired) {
        this.expired = expired;
    }
}
