package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.*;
import table.*;
public class memberdao {
	
	static Connection con=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	static Blob image = null;
	static byte[] imgData = null;

	public static List<members> getAllRecords(){
		List<members> list=new ArrayList<members>();
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("select * from member");
			rs=ps.executeQuery();
			while(rs.next()) {
				members m=new members();
				m.setMember_id(rs.getInt("member_id"));
				m.setLogin_id(rs.getInt("login_id"));
				m.setOccupation(rs.getString("occupation"));
				m.setM_image(rs.getBytes("m_image"));
				m.setF_name(rs.getString("f_name"));
				m.setM_name(rs.getString("m_name"));
				m.setL_name(rs.getString("l_name"));
				m.setBdate(rs.getString("bdate"));
				m.setContact(rs.getString("contact"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setMaritalstatus(rs.getString("maritalstatus"));
				m.setEmail(rs.getString("email"));
				m.setCityaddress(rs.getString("cityaddress"));
				m.setProvinceaddress(rs.getString("provinceaddress"));
				list.add(m);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<members> getaRecord(int login_id){
		List<members> list=new ArrayList<members>();
		try {
			con=dbconnect.getConnection();
			ps=con.prepareStatement("SELECT * FROM Member where login_id=?");
			ps.setInt(1, login_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				members m=new members();
				m.setMember_id(rs.getInt("member_id"));
				m.setLogin_id(rs.getInt("login_id"));
				m.setOccupation(rs.getString("occupation"));
				m.setM_image(rs.getBytes("m_image"));
				m.setF_name(rs.getString("f_name"));
				m.setM_name(rs.getString("m_name"));
				m.setL_name(rs.getString("l_name"));
				m.setBdate(rs.getString("bdate"));
				m.setContact(rs.getString("contact"));
				m.setAge(rs.getInt("age"));
				m.setGender(rs.getString("gender"));
				m.setMaritalstatus(rs.getString("maritalstatus"));
				m.setEmail(rs.getString("email"));
				m.setCityaddress(rs.getString("cityaddress"));
				m.setProvinceaddress(rs.getString("provinceaddress"));
				list.add(m);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static members getMemberByID(int member_id) {
		try{
				con=dbconnect.getConnection();
				ps=con.prepareStatement("SELECT * FROM member WHERE member_id=?");
				ps.setInt(1, member_id);
				
				rs= ps.executeQuery();
				members m = new members();
				
				if(rs.next()) {
					m.setMember_id(rs.getInt(1));
					m.setLogin_id(rs.getInt(2));
					m.setOccupation(rs.getString(3));
					m.setM_image(rs.getBytes(4));
					m.setF_name(rs.getString(5));
					m.setM_name(rs.getString(6));
					m.setL_name(rs.getString(7));
					m.setBdate(rs.getString(8));
					m.setContact(rs.getString(9));
					m.setAge(rs.getInt(10));
					m.setGender(rs.getString(11));
					m.setMaritalstatus(rs.getString(12));
					m.setEmail(rs.getString(13));
					m.setCityaddress(rs.getString(14));
					m.setProvinceaddress(rs.getString(15));
				}
				
				rs.close();
				ps.close();
				con.close();
				return m;
			}catch(Exception e) {
				e.printStackTrace();
			}
		return null;
	}
	public static int deleteMember(members m) {
		try {
			con=dbconnect.getConnection();
			
			ps=con.prepareStatement("DELETE FROM member WHERE member_id=?");
			
			ps.setInt(1, m.getMember_id());
			
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