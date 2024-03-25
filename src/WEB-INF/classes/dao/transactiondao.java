package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import connect.dbconnect;
import table.transactions;
import table.users;

public class transactiondao {
	
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	
	public static List<transactions> getAllRecords() {
		List<transactions> list=new ArrayList<transactions>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from transactions");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				transactions trans = new transactions();
				trans.setTransaction_id(rs.getInt("transaction_id"));
				trans.setLogin_id(rs.getInt("login_id"));
				trans.setForm(rs.getString("form"));
				trans.setName(rs.getString("name"));
				trans.setAmount(rs.getDouble("amount"));
				trans.setStatus(rs.getString("status"));
				trans.setDate(rs.getString("date"));
				list.add(trans);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static transactions getTransactionsByID(int transaction_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * FROM transactions WHERE transaction_id=?");
				ps.setInt(1, transaction_id);
				
				rs= ps.executeQuery();
				transactions trans = new transactions();
				
				if(rs.next()) {
					trans.setTransaction_id(rs.getInt("transaction_id"));
					trans.setLogin_id(rs.getInt("login_id"));
					trans.setForm(rs.getString("form"));
					trans.setName(rs.getString("name"));
					trans.setAmount(rs.getDouble("amount"));
					trans.setStatus(rs.getString("status"));
					trans.setDate(rs.getString("date"));
				}
				
				rs.close();
				ps.close();
				con.close();
				return trans;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public static List<transactions> getARecord(int login_id) {
		List<transactions> list=new ArrayList<transactions>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from transactions where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				transactions trans = new transactions();
				trans.setTransaction_id(rs.getInt("transaction_id"));
				trans.setLogin_id(rs.getInt("login_id"));
				trans.setForm(rs.getString("form"));
				trans.setName(rs.getString("name"));
				trans.setAmount(rs.getDouble("amount"));
				trans.setStatus(rs.getString("status"));
				trans.setDate(rs.getString("date"));
				list.add(trans);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static transactions getTransactionByID(int transaction_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * from transactions where transaction_id=?");
				ps.setInt(1, transaction_id);
				
				rs= ps.executeQuery();
				transactions trans = new transactions();
				
				if(rs.next()) {
					trans.setTransaction_id(rs.getInt(1));
					trans.setLogin_id(rs.getInt(2));
					trans.setForm(rs.getString(3));
					trans.setName(rs.getString(4));
					trans.setAmount(rs.getDouble(5));
					trans.setStatus(rs.getString(6));
					trans.setDate(rs.getString(7));
				}
				
				rs.close();
				ps.close();
				con.close();
				return trans;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	
	public static int insertTransaction(transactions trans){   
		int status=0;
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date = 	df.format(new java.util.Date());
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("INSERT INTO transactions(transaction_id,login_id,form,name,amount,status,date)"+ "VALUES(null,?,?,?,?,?,?)");
	        ps.setInt(1, trans.getLogin_id());
	        ps.setString(2, trans.getForm());
	        ps.setString(3, trans.getName());
	        ps.setDouble(4, trans.getAmount());
	        ps.setString(5, trans.getStatus());
	        ps.setString(6, date);
	        status=ps.executeUpdate(); 
	        
	        ps=con.prepareStatement("SELECT LAST_INSERT_ID()");
	        rs=ps.executeQuery();
	        while(rs.next()) {
	        	con=dbconnect.getConnection(); 
		    	ps=con.prepareStatement("INSERT INTO accounting(accounting_id,transaction_id,login_id,form,name,amount,status,process,date,incharge_id,incharge_name) VALUES(null,?,?,?,?,?,?,'pending',?,'0','none')");
		        ps.setInt(1, rs.getInt(1));
		        ps.setInt(2, trans.getLogin_id());
		        ps.setString(3, trans.getForm());
		        ps.setString(4, trans.getName());
		        ps.setDouble(5, trans.getAmount());
		        ps.setString(6, trans.getStatus());
		        ps.setString(7, date);
		        status=ps.executeUpdate(); 
	        }
	        
	        
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return status;     
	} 
	
	public static int editTransaction(transactions trans) {
		int status=0;
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date = 	df.format(new java.util.Date());
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("UPDATE transactions SET login_id=?, form=?, name=?, amount=? where transaction_id=?");
	    	
	    	ps.setInt(1, trans.getLogin_id());
	    	ps.setString(2, trans.getForm());
	    	ps.setString(3, trans.getName());
	    	ps.setDouble(4, trans.getAmount());
	    	ps.setInt(5, trans.getTransaction_id());
	        status=ps.executeUpdate(); 
	       
	        
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return status;     
	} 
	
	public static int deleteTransaction(transactions trans) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM transactions WHERE transaction_id=?");
			
			ps.setInt(1, trans.getTransaction_id());
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
}
