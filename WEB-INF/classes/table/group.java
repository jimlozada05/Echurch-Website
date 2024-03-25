package table;

public class group {
private int group_id,creator_id; private String gname,sched,venue,organizer,contact;
public int getgroup_id(){
	return group_id;
}
public void setgroup_id(int group_id ) {
	this.group_id=group_id;
}
public String getgname() {
	return gname;
}
public void setgname(String gname) {
	this.gname=gname;
}
public String getsched() {
	return sched;
}
public void setsched(String sched) {
	this.sched=sched;
}
public String getvenue() {
	return venue;
}
public void setvenue(String venue) {
	this.venue=venue;
}
public String getorganizer() {
	return organizer;
}
public void setorganizer(String organizer) {
	this.organizer=organizer;
}
public String getcontact() {
	return contact;
}
public void setcontact(String contact) {
	this.contact=contact;
}
public int getcreator_id() {
	return creator_id;
}
public void setcreator_id(int creator_id) {
	this.creator_id = creator_id;
}
}
