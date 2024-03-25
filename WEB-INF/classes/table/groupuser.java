package table;

public class groupuser {
	private int groupuser_id,group_id_fk,loginn_id; private String participants_name,contact,address;

	public int getgroupuser_id(){
		return groupuser_id;
	}
	public void setgroupuser_id(int groupuser_id ) {
		this.groupuser_id=groupuser_id;
	}
	public int getgroup_id_fk() {
		return group_id_fk;
	}
	public void setgroup_id_fk(int group_id_fk) {
		this.group_id_fk=group_id_fk;
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


