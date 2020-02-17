package com.ds.taejun;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ds.daoi.UserDAOImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 */
@RestController
public class ReController {
	
	@Autowired
	private UserDAOImpl userDao;
	
	@PostMapping(value = "/rest_register", produces = "application/json; charset=utf8")
	public @ResponseBody String Login(@RequestBody userBean request,HttpSession httpsession) throws JsonProcessingException {
		System.out.println(request.getEmail());
		userDao.regist_user(request);
		Gson gson = new Gson();
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("result", "200");
		String json = gson.toJson(result);
		return json;
	}
	
	@PostMapping(value = "/email_check", produces = "application/json; charset=utf8")
	public @ResponseBody String id_check(@RequestBody Map<String,Object> map,HttpSession httpsession) throws JsonProcessingException {
		System.out.println(map.get("email"));
		
		int email_check = userDao.email_check(map);
		Map<String,Object> result = new HashMap<String,Object>();
		Gson gson = new Gson();
		System.out.println(email_check);
		if(email_check == 1) {
			result.put("result", false);
			String json = gson.toJson(result);
			return json;
		}else {
			result.put("result", true);
			String json = gson.toJson(result);
			return json;
		}
	}
	
	@PostMapping(value = "/login", produces = "application/json; charset=utf8")
	public @ResponseBody String Login(@RequestBody Map<String,Object> request,HttpSession httpsession) throws JsonProcessingException {

		System.out.println("id : " + request.get("email"));
		System.out.println("pw : " + request.get("password"));
		Map<String,Object> response = new HashMap<String,Object>();
		Gson gson = new Gson();
	
		String password = userDao.login(request);
		
		if(password == null) {
			response.put("result", "300"); // 이메일없음
			String json = gson.toJson(response);
			return json;
		}else {
			if(password.equals(request.get("password"))) {
				String name = userDao.getName(request);
				httpsession.setAttribute("SNAME", name);
				response.put("result", "200"); // 비번일치
				String json = gson.toJson(response);
				return json;	
			}else {
				response.put("result", "400"); // 비번불일치
				String json = gson.toJson(response);
				return json;
			}
		}
	
	}
}
