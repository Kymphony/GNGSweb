package goodnews.gunsan.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
								   , String join_pw_check
								   , String join_birth
								   , String join_sex
								   , String join_phone){
		
		logger.info("PAGE CONNECTED : memberjoin[POST]");
		logger.info("---------------------------------------------------------");
		logger.info("NAME FROM memberjoin.jsp : {}",join_name);
		logger.info("ID FROM memberjoin.jsp : {}",join_id);
		logger.info("PASSWORD FROM memberjoin.jsp : {}",join_pw);
		logger.info("PASSWORD_CHECK FROM memberjoin.jsp : {}",join_pw_check);
		logger.info("BIRTH FROM memberjoin.jsp : {}",join_birth);
		logger.info("SEX FROM memberjoin.jsp : {}",join_sex);
		logger.info("PHONE NUM FROM memberjoin.jsp : {}",join_phone);
		logger.info("---------------------------------------------------------");
		
		// 회원정보 확인 페이지로 포워딩
		return "member/memberjoin_verify";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model){
		
		logger.info("PAGE CONNECTED : login");
		
		
		
		return "member/login";
	}

}
