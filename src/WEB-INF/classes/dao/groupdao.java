package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import connect.dbconnect;
import table.group;
public class groupdao {
		public static ArrayList<group> getgrouplist(){
			try {
				Connection con=dbconnect.getConnection();
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("Select * from grouptb");
				ArrayList<group> groups= new ArrayList<group>();
				while(rs.next()) {
					group groupss=new group();
					groupss.setgroup_id(rs.getInt(1));
					groupss.setgname(rs.getString(2));
					groupss.setsched(rs.getString(3));
					groupss.setvenue(rs.getString(4));
					groupss.setorganizer(rs.getString(5));
					groupss.setcontact(rs.getString(6));
					groupss.setcreator_id(rs.getInt(7));
					groups.add(groupss);
				}
				con.close();
				stmt.close();
				rs.close();
				return groups;
			}catch(Exception e) {e.printStackTrace();}
			return null;
		}
		public static ArrayList<group> getaRecord(int login_id){
			ArrayList<group> gr=new ArrayList<group>();
				try {
					Connection con=dbconnect.getConnection();
					PreparedStatement ps=con.prepareStatement("Select * from grouptb where group_id=?");
					ps.setInt(1, login_id);
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						group groups=new group();
						groups.setgroup_id(rs.getInt(1));
						groups.setgname(rs.getString(2));
						groups.setsched(rs.getString(3));
						groups.setvenue(rs.getString(4));
						groups.setorganizer(rs.getString(5));
						groups.setcontact(rs.getString(6));
						groups.setcreator_id(rs.getInt(7));
						gr.add(groups);
					}
					ps.close();
					rs.close();
					con.close();
				}catch (Exception e) {e.printStackTrace();}
			return gr;
		}
		public static int addgroup(group u) {
			int status=0;
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Insert into grouptb value(null,?,?,?,?,?,?)");
				ps.setString(1, u.getgname());
				ps.setString(2, u.getsched());
				ps.setString(3, u.getvenue());
				ps.setString(4, u.getorganizer());
				ps.setString(5, u.getcontact());
				ps.setInt(6, u.getcreator_id());
				status=ps.executeUpdate();
				ps.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
			return status;
		}
		public static group getgroupbyid(int group_id) {
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from grouptb where group_id=?");
				ps.setInt(1, group_id);
				ResultSet rs=ps.executeQuery();
				group groups=new group();
				while(rs.next()) {
					groups.setgroup_id(rs.getInt(1));
					groups.setgname(rs.getString(2));
					groups.setsched(rs.getString(3));
					groups.setvenue(rs.getString(4));
					groups.setorganizer(rs.getString(5));
					groups.setcontact(rs.getString(6));
					groups.setcreator_id(rs.getInt(7));
					return groups;
				}
				con.close();
				ps.close();
				rs.close();
			}catch(Exception e ) {e.printStackTrace();}
			return null;
		}
		public static int editgroup(group u) {
			int status=0;
			try {
				Connection con =dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Update grouptb set gname=?,sched=?,venue=?,organizer=?,contact=?,creator_id=? where group_id=?");
				ps.setString(1, u.getgname());
				ps.setString(2, u.getsched());
				ps.setString(3, u.getvenue());
				ps.setString(4, u.getorganizer());
				ps.setString(5, u.getcontact());
				ps.setInt(6, u.getcreator_id());
				ps.setInt(7, u.getgroup_id());
				status=ps.executeUpdate();
				ps.close();
				con.close();
			}catch(Exception e) {e.printStackTrace();}
			return status;
		}
		public static int deletegroup(group u) {
			
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Delete from grouptb where group_id=?");
				ps.setInt(1, u.getgroup_id());
				ps.executeUpdate();
				
				ps.close();
				con.close();
				return 0;
			}catch(Exception e) {e.printStackTrace();}
			return 1;
		}
		
	}


