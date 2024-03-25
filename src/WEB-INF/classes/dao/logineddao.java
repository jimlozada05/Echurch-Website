package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.*;
import table.*;

public class logineddao {

	static Connection con=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	
	public static List<logined> getAllRecords(){
		List<logined> list=new ArrayList<logined>();
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("select * from logined");
			rs=ps.executeQuery();
			while(rs.next()) {
				logined log = new logined();
				log.setId(rs.getInt("id"));
				log.setUsername(rs.getString("username"));
				log.setPassword(rs.getString("password"));
				log.setType(rs.getString("type"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	public static int deleteLogined(logined log) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM logined");
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
