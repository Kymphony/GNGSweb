package goodnews.gunsan.web.dao;

import java.util.ArrayList;

import goodnews.gunsan.web.vo.Member;

public interface MemberMapper {
	// regist member
	public int insert(Member member);
	
	// id existence check
	public Member idCheck(String id);
	
	// phone number existence check
	public Member pbCheck(String pb);
	
	
	public ArrayList<Member> select();
	
	public Member selectOne(String id);
	public int delete(String id);
}
