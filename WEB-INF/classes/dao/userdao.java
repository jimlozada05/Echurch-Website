package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.*;
import table.*;

public class userdao {
	static Connection con = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	
	
	public static List<users> getAllRecords() {
		List<users> list=new ArrayList<users>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * from user");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				users u = new users();
				u.setLogin_id(rs.getInt("login_id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setType(rs.getString("type"));
				list.add(u);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static List<users> getARecord(int login_id) {
		List<users> list=new ArrayList<users>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * FROM user where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				users u = new users();
				u.setLogin_id(rs.getInt("login_id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setType(rs.getString("type"));
				list.add(u);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	public static int insertUser(users u){   
		int status=0;
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("INSERT INTO user(login_id,username,password,type)"+ "VALUES(null,?,?,?)");
	        ps.setString(1, u.getUsername());
	        ps.setString(2, u.getPassword());
	        ps.setString(3, u.getType());
	        status=ps.executeUpdate(); 
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return status;     
	} 
	public static users getUserByID(int login_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * FROM user WHERE login_id=?");
				ps.setInt(1, login_id);
				
				rs= ps.executeQuery();
				users u = new users();
				
				if(rs.next()) {
					u.setLogin_id(rs.getInt(1));
					u.setUsername(rs.getString(2));
					u.setPassword(rs.getString(3));
					u.setType(rs.getString(4));
				}
				
				rs.close();
				ps.close();
				con.close();
				return u;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	public static int editUser(users u) {
		int status = 0;
		try {
			con= dbconnect.getConnection();
			ps=con.prepareStatement("UPDATE user SET username=?, password=?, type=? WHERE login_id=?");
			
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getType());
			ps.setInt(4, u.getLogin_id());
			
			
			status = ps.executeUpdate();

			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int deleteUser(users u) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM user WHERE login_id=?");
			
			ps.setInt(1, u.getLogin_id());
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	public static int register(users u) {
		int status=0;
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("INSERT INTO user VALUES(null,?,?,?)");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getType());
			status=ps.executeUpdate();
			ps.close();
			con.close();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public static users getLoginRecord(int login_id) {
		List<users> list=new ArrayList<users>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT `login_id` from user");
			rs=ps.executeQuery();
			
			while(rs.next()) {
				users u = new users();
				u.setLogin_id(rs.getInt("login_id"));
				list.add(u);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		}
	
}
