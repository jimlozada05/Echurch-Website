package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.*;
import table.*;

public class employeedao {
	
	static Connection con=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static Blob image = null;
	static byte[] imgData = null;

	public static List<employees> getAllRecords(){
		List<employees> list=new ArrayList<employees>();
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("select * from employee");
			rs=ps.executeQuery();
			while(rs.next()) {
				employees ee=new employees();
				ee.setEmployee_id(rs.getInt("employee_id"));
				ee.setLogin_id(rs.getInt("login_id"));
				ee.setPosition(rs.getString("position"));
				ee.setEe_image(rs.getBytes("ee_image"));
				ee.setF_name(rs.getString("f_name"));
				ee.setM_name(rs.getString("m_name"));
				ee.setL_name(rs.getString("l_name"));
				ee.setBdate(rs.getString("bdate"));
				ee.setContact(rs.getString("contact"));
				ee.setAge(rs.getInt("age"));
				ee.setGender(rs.getString("gender"));
				ee.setMaritalstatus(rs.getString("maritalstatus"));
				ee.setEmail(rs.getString("email"));
				ee.setCityaddress(rs.getString("cityaddress"));
				ee.setProvinceaddress(rs.getString("provinceaddress"));
				list.add(ee);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<employees> getaRecord(int login_id){
		List<employees> list=new ArrayList<employees>();
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("SELECT * FROM Employee where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				employees ee=new employees();
				ee.setEmployee_id(rs.getInt("employee_id"));
				ee.setLogin_id(rs.getInt("login_id"));
				ee.setPosition(rs.getString("position"));
				ee.setEe_image(rs.getBytes("ee_image"));
				ee.setF_name(rs.getString("f_name"));
				ee.setM_name(rs.getString("m_name"));
				ee.setL_name(rs.getString("l_name"));
				ee.setBdate(rs.getString("bdate"));
				ee.setContact(rs.getString("contact"));
				ee.setAge(rs.getInt("age"));
				ee.setGender(rs.getString("gender"));
				ee.setMaritalstatus(rs.getString("maritalstatus"));
				ee.setEmail(rs.getString("email"));
				ee.setCityaddress(rs.getString("cityaddress"));
				ee.setProvinceaddress(rs.getString("provinceaddress"));
				list.add(ee);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static employees getEmployeeByID(int employee_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * FROM employee WHERE employee_id=?");
				ps.setInt(1, employee_id);
				
				rs= ps.executeQuery();
				employees ee = new employees();
				
				if(rs.next()) {
					ee.setEmployee_id(rs.getInt(1));
					ee.setLogin_id(rs.getInt(2));
					ee.setPosition(rs.getString(3));
					ee.setEe_image(rs.getBytes(4));
					ee.setF_name(rs.getString(5));
					ee.setM_name(rs.getString(6));
					ee.setL_name(rs.getString(7));
					ee.setBdate(rs.getString(8));
					ee.setContact(rs.getString(9));
					ee.setAge(rs.getInt(10));
					ee.setGender(rs.getString(11));
					ee.setMaritalstatus(rs.getString(12));
					ee.setEmail(rs.getString(13));
					ee.setCityaddress(rs.getString(14));
					ee.setProvinceaddress(rs.getString(15));
				}
				
				rs.close();
				ps.close();
				con.close();
				return ee;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	public static int deleteEmployee(employees ee) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM employee WHERE employee_id=?");
			
			ps.setInt(1, ee.getEmployee_id());
			
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
