package table;

public class events {
private int userevent_id,event_id_fk,loginn_id; private String participants_name,contact,address;

public int getuserevent_Id(){
	return userevent_id;
}
public void setuserevent_Id(int userevent_id ) {
	this.userevent_id=userevent_id;
}
public int getevent_id_fk() {
	return event_id_fk;
}
public void setevent_id_fk(int event_id_fk) {
	this.event_id_fk=event_id_fk;
}
public int getloginn_id() {
	return loginn_id;
}
public void setloginn_id(int loginn_id) {
	this.loginn_id=loginn_id;
}

public String getparticipants_name() {
	return participants_name;
}
public void setparticipants_name(String participants_name) {
	this.participants_name=participants_name;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact=contact;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address=address;
}
}
