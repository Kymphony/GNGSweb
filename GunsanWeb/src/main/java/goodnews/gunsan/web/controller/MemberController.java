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
	public String memberjoin(Model model){
		
		logger.info("PAGE CONNECTED : memberjoin[GET]");
		
		
		
		return "member/memberjoin";
	}
	
	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST)
	public String memberjoin_post(Model model){
		
		logger.info("PAGE CONNECTED : memberjoin[POST]");
		
		
		// ȸ������ Ȯ�� �������� ������
		return "member/memberjoin_verify";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model){
		
		logger.info("PAGE CONNECTED : login");
		
		
		
		return "member/login";
	}

}