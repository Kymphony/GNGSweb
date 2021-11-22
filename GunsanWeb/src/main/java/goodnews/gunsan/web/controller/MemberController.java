package goodnews.gunsan.web.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import goodnews.gunsan.web.vo.Member;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping(value = "/memberjoin", method = RequestMethod.GET)
	public String memberjoin(){
		
		logger.info("PAGE CONNECTED : memberjoin[GET]");
		
		
		
		return "member/memberjoin";
	}
	
	@RequestMapping(value = "/memberjoinverify", method = RequestMethod.POST)
	public String memberjoinverify(Model model
								   , String join_name
								   , String join_id
								   , String join_pw
								   , String join_birth
								   , String join_sex
								   , String join_phone){
		
		
		logger.info("PAGE CONNECTED : memberjoin[POST]");
		logger.info("---------------------------------------------------------");
		logger.info("NAME FROM memberjoin.jsp : {}",join_name);
		logger.info("ID FROM memberjoin.jsp : {}",join_id);
		logger.info("PASSWORD FROM memberjoin.jsp : {}",join_pw);
		logger.info("BIRTH FROM memberjoin.jsp : {}",join_birth);
		logger.info("SEX FROM memberjoin.jsp : {}",join_sex);
		logger.info("PHONE NUM FROM memberjoin.jsp : {}",join_phone);
		logger.info("---------------------------------------------------------");
		
		
		// �𵨿� ����? ���ǿ� ����?
		// member Ŭ������ ��������
		// view������  EL�±׷� Ŭ�������� ��������
		
		model.addAttribute("name", join_name);
		model.addAttribute("id", join_id);
		model.addAttribute("birth", join_birth);
		model.addAttribute("sex", join_sex);
		model.addAttribute("phone", join_phone);
		
		Member member = new Member();
		
		member.setName(join_name);
		member.setId(join_id);
		member.setBirth(join_birth);
		member.setSex(join_sex);
		member.setPhone_number(join_phone);
		
		
		logger.info("(1)�̸� : {}",member.getName());
		logger.info("(1)�ƾƵ�: {}",member.getId());
		logger.info("(1)����: {}",member.getBirth());
		logger.info("(1)����: {}",member.getSex());
		logger.info("(1)�ڵ���: {}",member.getPhone_number());
		
		
		
		// ȸ������ Ȯ�� �������� ������
		return "member/memberjoin_verify";
	}
	
	@RequestMapping(value = "/memberjoinfinal")
	public String memberjoinfinal(Member member){
		
		logger.info("PAGE CONNECTED : memeberjoinfinal");
		//DB���� ó��
		
		logger.info("(2)�̸� : {}",member.getName());
		logger.info("(2)�ƾƵ�: {}",member.getId());
		logger.info("(2)����: {}",member.getBirth());
		logger.info("(2)����: {}",member.getSex());
		logger.info("(2)�ڵ���: {}",member.getPhone_number());
		
		
		return "member/memberjoin_final";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model){
		
		logger.info("PAGE CONNECTED : login");
		
		
		
		return "member/login";
	}

}
