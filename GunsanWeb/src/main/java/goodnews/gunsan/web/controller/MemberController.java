package goodnews.gunsan.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import goodnews.gunsan.web.dao.MemberMapper;
import goodnews.gunsan.web.vo.Member;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	//������ ��ϵ� ���� �����´�
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/memberjoin", method = RequestMethod.GET)
	public String memberjoin(){
		
		logger.info("PAGE CONNECTED : memberjoin[GET]");
		
		
		
		return "member/memberjoin";
	}
	
	@RequestMapping(value = "/memberjoinverify", method = RequestMethod.POST)
	public String memberjoinverify(String join_name
								   , String join_id
								   , String join_pw
								   , String join_birth
								   , String join_gender
								   , String join_phone
								   , HttpSession session){
		
		
		logger.info("PAGE CONNECTED : memberjoin[POST]");
		logger.info("---------------------------------------------------------");
		logger.info("NAME FROM memberjoin.jsp : {}",join_name);
		logger.info("ID FROM memberjoin.jsp : {}",join_id);
		logger.info("PASSWORD FROM memberjoin.jsp : {}",join_pw);
		logger.info("BIRTH FROM memberjoin.jsp : {}",join_birth);
		logger.info("gender FROM memberjoin.jsp : {}",join_gender);
		logger.info("PHONE NUM FROM memberjoin.jsp : {}",join_phone);
		logger.info("---------------------------------------------------------");
		
		
		session.setAttribute("name", join_name);
		session.setAttribute("id", join_id);
		session.setAttribute("pw", join_pw);
		session.setAttribute("birth", join_birth);
		session.setAttribute("gender", join_gender);
		session.setAttribute("phone", join_phone);
		
		return "member/memberjoin_verify";
	}
	
	@RequestMapping(value = "/memberjoinfinal", method = RequestMethod.POST)
	public String memberjoinfinal(Member member){
		
		logger.info("PAGE CONNECTED : memeberjoinfinal");
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		
		try{
			
			result = mapper.insert(member);
			
		} catch(Exception e){
			e.printStackTrace();
			return "member/memberjoin_verify";
		}
		
		if(result != 1){
			
			return "member/memberjoin_verify"; 
		}
		
		
		return "member/memberjoin_final";
	}
	
	@RequestMapping(value = "/thankyouforjoin", method = RequestMethod.GET)
	public String thankyouforjoin(){
		
		logger.info("PAGE CONNECTED: thankyouforjoin");
		
		return "member/memberjoin_final";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		
		logger.info("PAGE CONNECTED : login");
		
		
		
		return "member/login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		
		logger.info("PAGE CONNECTED : logout");
		
		//�����ʱ�ȭ
		session.invalidate();
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idDbCheck", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String idcheck(String id){
	
		logger.info("PAGE CONNECTED : idDbCheck");
		logger.info("ID: {}", id);
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member member = new Member();
		
		try{
			
			member = mapper.idCheck(id);
			
			if(member != null && member.getId() != null){
				
				logger.info("DB���� ������ member Ŭ������ ID: {}",member.getId());
				
				// �����ϴ� ���̵�(��� �Ұ�)
				return "1";
				
			} else{
				
				logger.info("DB���� null���� ������. memberŬ������ ����: {}",member);
				
				// �������� �ʴ� ���̵�(��� ����)
				return "2";
				
			}
			
		} catch(Exception e){
			logger.info("���ܹ߻�");
			e.printStackTrace();
		}
		
		return "1";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/pbDbCheck", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String pbcheck(String pb){
	
		logger.info("PAGE CONNECTED : pbDbCheck");
		logger.info("PB: {}", pb);
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		Member member = new Member();
		
		try{
			
			member = mapper.pbCheck(pb);
			
			if(member != null && member.getId() != null){
				
				logger.info("DB���� ������ member Ŭ������ ��ȭ��ȣ: {}",member.getPhone_number());
				
				// �����ϴ� ��ȭ��ȣ(��� �Ұ�)
				return "1";
				
			} else{
				
				logger.info("DB���� null���� ������. memberŬ������ ����: {}",member);
				
				// �������� �ʴ� ��ȭ��ȣ(��� ����)
				return "2";
				
			}
			
		} catch(Exception e){
			logger.info("���ܹ߻�");
			e.printStackTrace();
		}
		
		return "1";
		
	}
	
}