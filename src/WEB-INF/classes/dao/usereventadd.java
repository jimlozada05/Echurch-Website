package dao;

import java.util.*;
import java.sql.*;

import connect.*; import table.*;
public class usereventadd {
	public static ArrayList<eventadd> getEventlist(){
		try {
			Connection con=dbconnect.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("Select * from eventtb");
			ArrayList<eventadd> event= new ArrayList<eventadd>();
			while(rs.next()) {
				eventadd events=new eventadd();
				events.setevent_Id(rs.getInt(1));
				events.setEvent(rs.getString(2));
				events.setSched(rs.getString(3));
				events.setVenue(rs.getString(4));
				events.setOrganizer(rs.getString(5));
				events.setContact(rs.getString(6));
				events.setevent_details(rs.getString(7));
				events.setcreator_id(rs.getInt(8));
				event.add(events);
			}
			con.close();
			stmt.close();
			rs.close();
			return event;
		}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	public static ArrayList<eventadd> getaRecord(int login_id){
		ArrayList<eventadd> eve=new ArrayList<eventadd>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from eventtb where event_id=?");
				ps.setInt(1, login_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					eventadd event=new eventadd();
					event.setevent_Id(rs.getInt(1));
					event.setEvent(rs.getString(2));
					event.setSched(rs.getString(3));
					event.setVenue(rs.getString(4));
					event.setOrganizer(rs.getString(5));
					event.setContact(rs.getString(6));
					event.setevent_details(rs.getString(7));
					event.setcreator_id(rs.getInt(8));
					eve.add(event);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return eve;
	}
	public static ArrayList<eventadd> getsomeRecord(int event_id){
		ArrayList<eventadd> eve=new ArrayList<eventadd>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from eventtb where event_id=?");
				ps.setInt(1, event_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					eventadd event=new eventadd();
					event.setevent_Id(rs.getInt(1));
					event.setEvent(rs.getString(2));
					event.setSched(rs.getString(3));
					event.setVenue(rs.getString(4));
					event.setOrganizer(rs.getString(5));
					event.setContact(rs.getString(6));
					event.setevent_details(rs.getString(7));
					event.setcreator_id(rs.getInt(8));
					
					eve.add(event);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return eve;
	}
	public static ArrayList<eventadd> getRecord(int login_id){
		ArrayList<eventadd> eve=new ArrayList<eventadd>();
			try {
				Connection con=dbconnect.getConnection();
				PreparedStatement ps=con.prepareStatement("Select * from eventtb where loginne_id=?");
				ps.setInt(1, login_id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					eventadd event=new eventadd();
					event.setevent_Id(rs.getInt(1));
					event.setEvent(rs.getString(2));
					event.setSched(rs.getString(3));
					event.setVenue(rs.getString(4));
					event.setOrganizer(rs.getString(5));
					event.setContact(rs.getString(6));
					event.setevent_details(rs.getString(7));
					event.setcreator_id(rs.getInt(8));
					
					eve.add(event);
				}
				ps.close();
				rs.close();
				con.close();
			}catch (Exception e) {e.printStackTrace();}
		return eve;
	}
	public static int addevent(eventadd u) {
		int status=0;
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Insert into eventtb value(null,?,?,?,?,?,?,?)");
			ps.setString(1, u.getEvent());
			ps.setString(2, u.getSched());
			ps.setString(3, u.getVenue());
			ps.setString(4, u.getOrganizer());
			ps.setString(5, u.getContact());
			ps.setString(6, u.getevent_details());
			ps.setInt(7, u.getcreator_id());
			status=ps.executeUpdate();
			ps.close();
			con.close();
		}catch (Exception e) {e.printStackTrace();}
		return status;
	}
	public static eventadd getEventbyid(int event_id) {
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Select * from eventtb where event_id=?");
			ps.setInt(1, event_id);
			ResultSet rs=ps.executeQuery();
			eventadd event=new eventadd();
			while(rs.next()) {
				event.setevent_Id(rs.getInt(1));
				event.setEvent(rs.getString(2));
				event.setSched(rs.getString(3));
				event.setVenue(rs.getString(4));
				event.setOrganizer(rs.getString(5));
				event.setContact(rs.getString(6));
				event.setevent_details(rs.getString(7));
				event.setcreator_id(rs.getInt(8));
				return event;
			}
			con.close();
			ps.close();
			rs.close();
		}catch(Exception e ) {e.printStackTrace();}
		return null;
	}
	public static int editevent(eventadd u) {
		int status=0;
		try {
			Connection con =dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Update eventtb set event=?,sched=?,venue=?,organizer=?,contact=?,event_details=?,creator_id=? where event_id=?");
			ps.setString(1, u.getEvent());
			ps.setString(2, u.getSched());
			ps.setString(3, u.getVenue());
			ps.setString(4, u.getOrganizer());
			ps.setString(5, u.getContact());
			ps.setString(6, u.getevent_details());
			ps.setInt(7, u.getcreator_id());	
			ps.setInt(8, u.getevent_Id());
			status=ps.executeUpdate();
			ps.close();
			con.close();
		}catch(Exception e) {e.printStackTrace();}
		return status;
	}
	public static int deleteevent(eventadd u) {
		
		try {
			Connection con=dbconnect.getConnection();
			PreparedStatement ps=con.prepareStatement("Delete from eventtb where event_id=?");
			ps.setInt(1, u.getevent_Id());
			ps.executeUpdate();
			
			ps.close();
			con.close();
			return 0;
		}catch(Exception e) {e.printStackTrace();}
		return 1;
	}
	
}
