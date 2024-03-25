package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import connect.dbconnect;
import table.accountings;
import table.transactions;

public class accountingdao {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	
	public static List<accountings> getAllRecords() {
		List<accountings> list=new ArrayList<accountings>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from accounting");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				accountings acc = new accountings();
				acc.setAccounting_id(rs.getInt("accounting_id"));
				acc.setTransaction_id(rs.getInt("transaction_id"));
				acc.setLogin_id(rs.getInt("login_id"));
				acc.setForm(rs.getString("form"));
				acc.setName(rs.getString("name"));
				acc.setAmount(rs.getDouble("amount"));
				acc.setStatus(rs.getString("status"));
				acc.setProcess(rs.getString("process"));
				acc.setDate(rs.getString("date"));
				acc.setIncharge_id(rs.getInt("incharge_id"));
				acc.setIncharge_name(rs.getString("incharge_name"));
				list.add(acc);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static List<accountings> getAllRecordsPaid() {
		List<accountings> list=new ArrayList<accountings>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from accounting where status='paid'");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				accountings acc = new accountings();
				acc.setAccounting_id(rs.getInt("accounting_id"));
				acc.setTransaction_id(rs.getInt("transaction_id"));
				acc.setLogin_id(rs.getInt("login_id"));
				acc.setForm(rs.getString("form"));
				acc.setName(rs.getString("name"));
				acc.setAmount(rs.getDouble("amount"));
				acc.setStatus(rs.getString("status"));
				acc.setProcess(rs.getString("process"));
				acc.setDate(rs.getString("date"));
				acc.setIncharge_id(rs.getInt("incharge_id"));
				acc.setIncharge_name(rs.getString("incharge_name"));
				list.add(acc);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static accountings getaccountingByID(int accounting_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * FROM accounting WHERE accounting_id=?");
				ps.setInt(1, accounting_id);
				
				rs= ps.executeQuery();
				accountings acc = new accountings();
				
				if(rs.next()) {
					acc.setAccounting_id(rs.getInt("accounting_id"));
					acc.setTransaction_id(rs.getInt("transaction_id"));
					acc.setLogin_id(rs.getInt("login_id"));
					acc.setForm(rs.getString("form"));
					acc.setName(rs.getString("name"));
					acc.setAmount(rs.getDouble("amount"));
					acc.setStatus(rs.getString("status"));
					acc.setProcess(rs.getString("process"));
					acc.setDate(rs.getString("date"));
					acc.setIncharge_id(rs.getInt("incharge_id"));
					acc.setIncharge_name(rs.getString("incharge_name"));
				}
				
				rs.close();
				ps.close();
				con.close();
				return acc;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public static List<accountings> getARecord(int login_id) {
		List<accountings> list=new ArrayList<accountings>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from accounting where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				accountings acc = new accountings();
				acc.setAccounting_id(rs.getInt("accounting_id"));
				acc.setTransaction_id(rs.getInt("transaction_id"));
				acc.setLogin_id(rs.getInt("login_id"));
				acc.setForm(rs.getString("form"));
				acc.setName(rs.getString("name"));
				acc.setAmount(rs.getDouble("amount"));
				acc.setStatus(rs.getString("status"));
				acc.setProcess(rs.getString("process"));
				acc.setDate(rs.getString("date"));
				acc.setIncharge_id(rs.getInt("incharge_id"));
				acc.setIncharge_name(rs.getString("incharge_name"));
				list.add(acc);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static accountings getAccountingByID(int accounting_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * from accactions where accounting_id=?");
				ps.setInt(1, accounting_id);
				
				rs= ps.executeQuery();
				accountings acc = new accountings();
				
				if(rs.next()) {
					acc.setAccounting_id(rs.getInt("accounting_id"));
					acc.setTransaction_id(rs.getInt("transaction_id"));
					acc.setLogin_id(rs.getInt("login_id"));
					acc.setForm(rs.getString("form"));
					acc.setName(rs.getString("name"));
					acc.setAmount(rs.getDouble("amount"));
					acc.setStatus(rs.getString("status"));
					acc.setProcess(rs.getString("process"));
					acc.setDate(rs.getString("date"));
					acc.setIncharge_id(rs.getInt("incharge_id"));
					acc.setIncharge_name(rs.getString("incharge_name"));
				}
				
				rs.close();
				ps.close();
				con.close();
				return acc;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public static int insertAccounting(accountings acc){   
		int status=0;
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date = 	df.format(new java.util.Date());
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("INSERT INTO accactions(accounting_id,transaction_id,login_id,form,name,amount,status,date,incharge_id,incharge_name)"+ "VALUES(null,?,?,?,?,?,?,?,?,?)");
	    	ps.setInt(1, acc.getAccounting_id());
	    	ps.setInt(2, acc.getTransaction_id());
	    	ps.setInt(3, acc.getLogin_id());
	        ps.setString(4, acc.getForm());
	        ps.setString(5, acc.getName());
	        ps.setDouble(6, acc.getAmount());
	        ps.setString(7, acc.getStatus());
	        ps.setString(8, acc.getProcess());
	        ps.setString(9, date);
	        ps.setInt(10, acc.getIncharge_id());
	        ps.setString(11, acc.getIncharge_name());
	        status=ps.executeUpdate(); 
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return status;     
	} 
	
	public static int editAccounting(accountings acc) {
		int status = 0;
		try {
			con= dbconnect.getConnection();
			ps=con.prepareStatement("UPDATE accounting SET transaction_id=?,login_id=?, form=?, name=?, amount=?, status=?, process=?, incharge_id=?, incharge_name=? WHERE accaction_id=?");
			
			 ps.setInt(10, acc.getAccounting_id());
			 	ps.setInt(1, acc.getTransaction_id());
		        ps.setInt(2, acc.getLogin_id());
		        ps.setString(3, acc.getForm());
		        ps.setString(4, acc.getName());
		        ps.setDouble(5, acc.getAmount());
		        ps.setString(6, acc.getStatus());
		        ps.setString(7, acc.getProcess());
		        ps.setInt(8, acc.getIncharge_id());
		        ps.setString(9, acc.getIncharge_name());
			
			status = ps.executeUpdate();

			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int deleteAccounting(accountings acc) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM accounting WHERE accounting_id=?");
			
			ps.setInt(1, acc.getAccounting_id());
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public static int payAccounting(payments pay) {
		int status=0;
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date = 	df.format(new java.util.Date());
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("INSERT INTO payment(payment_id,accounting_id,transaction_id,login_id,card_number,amount,expire_month,expire_year,pin) VALUES(null,?,?,?,?,?,?,?,?)");
	    	ps.setInt(1, pay.getAccounting_id());
	    	ps.setInt(2, pay.getTransaction_id());
	    	ps.setInt(3, pay.getLogin_id());
	    	ps.setInt(4, pay.getCard_number());
	        ps.setDouble(5, pay.getAmount());
	        ps.setInt(6, pay.getExpire_month());
	        ps.setInt(7, pay.getExpire_year());
	        ps.setInt(8, pay.getPin());
	        status=ps.executeUpdate(); 
	        
	        
	        con=dbconnect.getConnection();
	        ps=con.prepareStatement("UPDATE transactions SET status='paid' where transaction_id=?");
	        ps.setInt(1, pay.getTransaction_id());
	        status=ps.executeUpdate();
	    	
	        con=dbconnect.getConnection();
	        ps=con.prepareStatement("UPDATE accounting SET status='paid' where transaction_id=?");
	        ps.setInt(1, pay.getTransaction_id());
	        status=ps.executeUpdate();
	    	
	        
	        
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return status;     
	} 
}
