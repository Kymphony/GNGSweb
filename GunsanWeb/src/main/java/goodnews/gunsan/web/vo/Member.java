package goodnews.gunsan.web.vo;

public class Member {
	
	String id;
	String pw;
	String name;
	String birth;
	String gender;
	String phone_number;
	String district;
	String sign_up_date;
	int num_of_posts;
	int num_of_comments;
	String last_login_date;
	int num_of_fails;
	String lock_flag;
	String mail_address;
	String position;
	
	public Member(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getSign_up_date() {
		return sign_up_date;
	}

	public void setSign_up_date(String sign_up_date) {
		this.sign_up_date = sign_up_date;
	}

	public int getNum_of_posts() {
		return num_of_posts;
	}

	public void setNum_of_posts(int num_of_posts) {
		this.num_of_posts = num_of_posts;
	}

	public int getNum_of_comments() {
		return num_of_comments;
	}

	public void setNum_of_comments(int num_of_comments) {
		this.num_of_comments = num_of_comments;
	}

	public String getLast_login_date() {
		return last_login_date;
	}

	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}

	public int getNum_of_fails() {
		return num_of_fails;
	}

	public void setNum_of_fails(int num_of_fails) {
		this.num_of_fails = num_of_fails;
	}

	public String getLock_flag() {
		return lock_flag;
	}

	public void setLock_flag(String lock_flag) {
		this.lock_flag = lock_flag;
	}

	public String getMail_address() {
		return mail_address;
	}

	public void setMail_address(String mail_address) {
		this.mail_address = mail_address;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", phone_number=" + phone_number + ", district=" + district + ", sign_up_date=" + sign_up_date
				+ ", num_of_posts=" + num_of_posts + ", num_of_comments=" + num_of_comments + ", last_login_date="
				+ last_login_date + ", num_of_fails=" + num_of_fails + ", lock_flag=" + lock_flag + ", mail_address="
				+ mail_address + ", position=" + position + "]";
	}
	
	

}
