package com.ds.taejun;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {

		
		return "register";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		
		return "login";
	}
	
	@RequestMapping(value = "/chat_login", method = RequestMethod.GET)
	public String chat_login() {

		
		return "chat_login";
	}
	
	@RequestMapping(value = "/transactions", method = RequestMethod.GET)
	public String transactions() {

		
		return "transactions";
	}
	
	@RequestMapping(value = "logout", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpSession httpsession) throws JsonProcessingException {
		Map<String,String> map = new HashMap<String,String>();
		httpsession.invalidate();
		
		request.setAttribute("msg", "로그아웃");
		request.setAttribute("url", "login");
		return "alert";
	}
}
