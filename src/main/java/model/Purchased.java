package model;

import java.sql.Timestamp;

public class Purchased {
    private int purchasednum;
	private Timestamp paydate;
	private int payment;
	private String method;

    public int getPurchasednum() {
        return purchasednum;
    }

    public void setPurchasednum(int purchasednum) {
        this.purchasednum = purchasednum;
    }

    public Timestamp getPaydate() {
        return paydate;
    }

    public void setPaydate(Timestamp paydate) {
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
}
