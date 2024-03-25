package table;

public class accountings {
	public	int accounting_id,transaction_id,login_id,incharge_id;
	public double amount;
	public String form,name,status,process,date,incharge_name;
	public int getAccounting_id() {
		return accounting_id;
	}
	public void setAccounting_id(int accounting_id) {
		this.accounting_id = accounting_id;
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
	public int getIncharge_id() {
		return incharge_id;
	}
	public void setIncharge_id(int incharge_id) {
		this.incharge_id = incharge_id;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIncharge_name() {
		return incharge_name;
	}
	public void setIncharge_name(String incharge_name) {
		this.incharge_name = incharge_name;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}

}
