package member;

import java.sql.Date;

public class memBerDTO {

	//변수 선언
	private String id;
	private String pass;
	private String name;
	private String email;
	private String hp;
	private String address;
	private Date regidate;
	
	//기본 생성자
	public memBerDTO() {}

	
	//회원가입 정보 저장 생성자
	public memBerDTO(String id, String pass, String name, String email, String hp, String address,Date regidate) {

		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.address = address;
		this.regidate = regidate;
	}


	//setter getter 선언
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
	}



	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getRegdate() {
		return regidate;
	}


	public void setRegdate(Date regidate) {
		this.regidate = regidate;
	}
	
	
	
	
	
}
