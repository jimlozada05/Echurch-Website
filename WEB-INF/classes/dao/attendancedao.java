package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.*;
import table.*;

public class attendancedao {
	
	static Connection con=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	
	public static List<attendances> getAllRecords(){
		List<attendances> list=new ArrayList<attendances>();
		try{
			con=dbconnect.getConnection();
			ps=con.prepareStatement("SELECT * FROM attendance");
			
			rs=ps.executeQuery();
			while(rs.next()) {
				attendances at=new attendances();
				at.setAttendance_id(rs.getInt("attendance_id"));
				at.setLogin_id(rs.getInt("login_id"));
				at.setDate(rs.getString("date"));
				at.setStatus(rs.getString("status"));
				list.add(at);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<attendances> getARecord(int login_id) {
		List<attendances> list=new ArrayList<attendances>();
		try {
			con=dbconnect.getConnection();
			ps =con.prepareStatement("SELECT * FROM attendance  where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				attendances at = new attendances();
				at.setAttendance_id(rs.getInt("attendance_id"));
				at.setLogin_id(rs.getInt("login_id"));
				at.setDate(rs.getString("date"));
				at.setStatus(rs.getString("status"));
				list.add(at);
				}
			}
			 catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	public static attendances getAttendanceByID(int attendance_id) {
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("SELECT * FROM attendance WHERE attendance_id=?");
			ps.setInt(1, attendance_id);
			
			rs= ps.executeQuery();
			attendances at=new attendances();
			if(rs.next()) {
				at.setAttendance_id(rs.getInt(1));
				at.setDate(rs.getString(2));
				at.setLogin_id(rs.getInt(3));
				at.setStatus(rs.getString(4));
				
			}
			return at;
		}
		catch(Exception e) {
			e.printStackTrace();
		}return null;
	}
	
	public static int deleteAttendance(attendances at) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM attendance WHERE attendance_id=?");
			
			ps.setInt(1, at.getAttendance_id());
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			
			return 0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	public static int insertAttendance(attendances at){   
		int state=0;
	    try{  
	    	con=dbconnect.getConnection(); 
	    	ps=con.prepareStatement("INSERT INTO attendance(attendance_id,date,login_id,status)"+ "VALUES(null,?,?,?)");
	        ps.setString(1, at.getDate());
	        ps.setInt(2, at.getLogin_id());
	        ps.setString(3, at.getStatus());
	        state=ps.executeUpdate(); 
	        ps.close();
	        con.close();
	    }catch(Exception e){e.printStackTrace();}  
	    return state;     
	} 
	public static int editAttendance(attendances at) {
		int state = 0;
		try {
			con= dbconnect.getConnection();
			ps=con.prepareStatement("UPDATE attendance SET login_id=?,date=?, status=? WHERE attendance_id=?");
			
			ps.setInt(1, at.getLogin_id());
			ps.setString(2, at.getDate());
			ps.setString(3, at.getStatus());
			ps.setInt(4, at.getAttendance_id());
			
			
			state = ps.executeUpdate();

			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return state;
	}
}

