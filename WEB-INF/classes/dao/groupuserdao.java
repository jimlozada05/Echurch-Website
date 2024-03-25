package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import connect.dbconnect;
import table.groupuser;

public class groupuserdao {
	public static ArrayList<groupuser> groupuserList(){
		ArrayList<groupuser> group=new ArrayList<groupuser>();
			try {
					Connection con=dbconnect.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("Select * from groupusertb ");
					while(rs.next()) {
						groupuser gr=new groupuser();
						gr.setgroupuser_id(rs.getInt(1));
						gr.setparticipants_name(rs.getString(2));
						gr.setContact(rs.getString(3));
						gr.setAddress(rs.getString(4));
						group.add(gr);
					}
					con.close();
					stmt.close();
					rs.close();
					return group;
			}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	public static ArrayList<groupuser> getaRecord(int login_id){
		ArrayList<groupuser> group=new ArrayList<groupuser>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from groupusertb where groupuser_id=?");
				ps.setInt(1, login_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					groupuser gr=new groupuser();
					gr.setgroupuser_id(rs.getInt(1));
					gr.setparticipants_name(rs.getString(2));
					gr.setContact(rs.getString(3));
					gr.setAddress(rs.getString(4));
					gr.setgroup_id_fk(rs.getInt(5));
					gr.setloginn_id(rs.getInt(6));
					group.add(gr);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return group;
	}
	public static ArrayList<groupuser> getsomeRecord(int group_id){
		ArrayList<groupuser> gr=new ArrayList<groupuser>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from groupusertb where group_id_fk=?");
				ps.setInt(1, group_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					groupuser group=new groupuser();
					group.setgroupuser_id(rs.getInt(1));
					group.setparticipants_name(rs.getString(2));
					group.setContact(rs.getString(3));
					group.setAddress(rs.getString(4));
					group.setgroup_id_fk(rs.getInt(5));
					group.setloginn_id(rs.getInt(6));
					
					gr.add(group);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return gr;
	}
	public static int insert(groupuser u) {
		int status=0;
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Insert into groupusertb values (null,?,?,?,?,?)");
				ps.setString(1, u.getparticipants_name());
				ps.setString(2, u.getContact());
				ps.setString(3, u.getAddress());
				ps.setInt(4,	u.getgroup_id_fk());
				ps.setInt(5,	u.getloginn_id());
				status=ps.executeUpdate();
				
				ps.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public static groupuser getgroupbyid(int groupuser_id) {
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Select * from groupusertb where groupuser_id=? ");
			ps.setInt(1, groupuser_id);
			ResultSet rs=ps.executeQuery();
			groupuser gr=new groupuser();
			while(rs.next()) {
				gr.setgroupuser_id(rs.getInt(1));
				gr.setparticipants_name(rs.getString(2));
				gr.setContact(rs.getString(3));
				gr.setAddress(rs.getString(4));
				gr.setgroup_id_fk(rs.getInt(5));
				gr.setloginn_id(rs.getInt(6));
				return gr;
			}
			con.close();
			ps.close();
			rs.close();
		}catch(Exception e) {e.printStackTrace();}
		return null;	
	}
	public static int edit(groupuser u) {
		int status=0;
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Update groupusertb set participants_name=?,contact=?,address=?,group_id_fk=?,loginn_id=? where groupuser_id=?");
				ps.setString(1, u.getparticipants_name());
				ps.setString(2, u.getContact());
				ps.setString(3, u.getAddress());
				ps.setInt(4, u.getgroup_id_fk());
				ps.setInt(5, u.getloginn_id());
				ps.setInt(6, u.getgroupuser_id());
				status=ps.executeUpdate();
				con.close();
				ps.close();
			}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public static int delete(groupuser u) {
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Delete from groupusertb where groupuser_id=?");
			ps.setInt(1, u.getgroupuser_id());
			ps.executeUpdate();
			
			con.close();
			ps.close();
			
		}catch(Exception e) {e.printStackTrace();}
		return 1;
	}
}


