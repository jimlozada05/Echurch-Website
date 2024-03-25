package table;

public class eventadd {
private int event_id,loginne_id,creator_id; private String event,sched,venue,organizer,contact,event_details;
public int getevent_Id() {
	return event_id;
}
public void setevent_Id(int event_id) {
	this.event_id=event_id;
}
public int getloginne_id() {
	return loginne_id;
}
public void setloginne_id(int loginne_id) {
	this.loginne_id=loginne_id;
}
public int getcreator_id() {
	return creator_id;
}
public void setcreator_id(int creator_id) {
	this.creator_id=creator_id;
}

public String getEvent() {
	return event;
}
public void setEvent(String event) {
	this.event=event;
}
public String getSched() {
	return sched;
}
public void setSched(String sched) {
	this.sched=sched;
}
public String getVenue() {
	return venue;
}
public void setVenue(String venue) {
	this.venue=venue;
}
public String getOrganizer() {
	return organizer;
}
public void setOrganizer(String organizer) {
	this.organizer=organizer;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact=contact;
}
public String getevent_details() {
	return event_details;
}
public void setevent_details(String event_details) {
	this.event_details=event_details;
}
}
