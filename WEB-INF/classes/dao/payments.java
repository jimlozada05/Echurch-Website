package dao;

public class payments {
	public int payment_id,accounting_id,transaction_id,login_id,card_number,expire_month,expire_year,pin;
	public double amount;
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getAccounting_id() {
		return accounting_id;
	}
	public void setAccounting_id(int accounting_id) {
		this.accounting_id = accounting_id;
	}
	public int getCard_number() {
		return card_number;
	}
	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}
	public int getExpire_month() {
		return expire_month;
	}
	public void setExpire_month(int expire_month) {
		this.expire_month = expire_month;
	}
	public int getExpire_year() {
		return expire_year;
	}
	public void setExpire_year(int expire_year) {
		this.expire_year = expire_year;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public int getLogin_id() {
		return login_id;
	}
	public void setLogin_id(int login_id) {
		this.login_id = login_id;
	}
}
