package dao;
import java.util.*;
import java.sql.*;
import connect.*; import table.*;

public class userevent {
	public static ArrayList<events> eventList(){
		ArrayList<events> event=new ArrayList<events>();
			try {
					Connection con=dbconnect.getConnection();
					Statement stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery("Select * from userparticipants ");
					while(rs.next()) {
						events eve=new events();
						eve.setuserevent_Id(rs.getInt(1));
						eve.setparticipants_name(rs.getString(2));
						eve.setContact(rs.getString(3));
						eve.setAddress(rs.getString(4));
						eve.setevent_id_fk(rs.getInt(5));
						eve.setloginn_id(rs.getInt(6));
						event.add(eve);
					}
					con.close();
					stmt.close();
					rs.close();
					return event;
			}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	public static ArrayList<events> getaRecord(int login_id){
		ArrayList<events> eve=new ArrayList<events>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from userparticipants where userevent_id=?");
				ps.setInt(1, login_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					events event=new events();
					event.setuserevent_Id(rs.getInt(1));
					event.setparticipants_name(rs.getString(2));
					event.setContact(rs.getString(3));
					event.setAddress(rs.getString(4));
					event.setevent_id_fk(rs.getInt(5));
					event.setloginn_id(rs.getInt(6));
					eve.add(event);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return eve;
	}
	public static ArrayList<events> getsomeRecord(int event_id){
		ArrayList<events> eve=new ArrayList<events>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from userparticipants where event_id_fk=?");
				ps.setInt(1, event_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					events event=new events();
					event.setuserevent_Id(rs.getInt(1));
					event.setparticipants_name(rs.getString(2));
					event.setContact(rs.getString(3));
					event.setAddress(rs.getString(4));
					event.setevent_id_fk(rs.getInt(5));
					event.setloginn_id(rs.getInt(6));
					
					eve.add(event);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return eve;
	}
	public static ArrayList<events>getRecord(int login_id){
		ArrayList<events> eve=new ArrayList<events>();
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Select * from userparticipants where loginn_id=?");
			ps.setInt(1, login_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				events event=new events();
				event.setuserevent_Id(rs.getInt(1));
				event.setparticipants_name(rs.getString(2));
				event.setContact(rs.getString(3));
				event.setAddress(rs.getString(4));
				event.setevent_id_fk(rs.getInt(5));
				event.setloginn_id(rs.getInt(6));
				
				eve.add(event);
			}
			ps.close();
			rs.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
	return eve;
}
	public static int insert(events u) {
		int status=0;
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Insert into userparticipants values (null,?,?,?,?,?)");
				ps.setString(1, u.getparticipants_name());
				ps.setString(2, u.getContact());
				ps.setString(3, u.getAddress());
				ps.setInt(4,	u.getevent_id_fk());
				ps.setInt(5,	u.getloginn_id());
				status=ps.executeUpdate();
				
				ps.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public static events getEventbyid(int userevent_id) {
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Select * from userparticipants where userevent_id=? ");
			ps.setInt(1, userevent_id);
			ResultSet rs=ps.executeQuery();
			events eve=new events();
			while(rs.next()) {
				eve.setuserevent_Id(rs.getInt(1));
				eve.setparticipants_name(rs.getString(2));
				eve.setContact(rs.getString(3));
				eve.setAddress(rs.getString(4));
				eve.setevent_id_fk(rs.getInt(5));
				eve.setloginn_id(rs.getInt(6));
				return eve;
			}
			con.close();
			ps.close();
			rs.close();
		}catch(Exception e) {e.printStackTrace();}
		return null;	
	}
	public static int edit(events u) {
		int status=0;
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Update userparticipants set participants_name=?,contact=?,address=?,event_id_fk=?,loginn_id=? where userevent_id=?");
				ps.setString(1, u.getparticipants_name());
				ps.setString(2, u.getContact());
				ps.setString(3, u.getAddress());
				ps.setInt(4, u.getevent_id_fk());
				ps.setInt(5, u.getloginn_id());
				ps.setInt(6, u.getuserevent_Id());
				status=ps.executeUpdate();
				con.close();
				ps.close();
			}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public static int delete(events u) {
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Delete from userparticipants where userevent_id=?");
			ps.setInt(1, u.getuserevent_Id());
			ps.executeUpdate();
			
			con.close();
			ps.close();
			
		}catch(Exception e) {e.printStackTrace();}
		return 1;
	}
}
