package com.human.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.project.entity.User;
import com.human.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired private UserService userService;

	@ResponseBody
	@GetMapping(value = {"/update/{custid}", "update"})
	public String updateForm(@PathVariable(required = false) String custid) {
		if (custid == null)
			return "redirect:/user/home";
		User user = userService.getUser(custid);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("custid", user.getCustid());
		jsonObject.put("uname", user.getUname());
		jsonObject.put("nickname", user.getNickname());
		jsonObject.put("email", user.getEmail());
		return jsonObject.toJSONString();
	}
	
	@PostMapping("/update")
	public String updateProc(String pwd, String pwd2, String uname, String nickname,
							 String email, HttpSession session, Model model) {
		String sesscustid = (String) session.getAttribute("sesscustid");
		if (sesscustid == null)
			return "redirect:/user/home";
		
		User user = userService.getUser(sesscustid);
		// System.out.println("pwd=" + pwd + ", pwd2=" + pwd2);
		if (pwd.length() >= 4 && pwd.equals(pwd2)) {
			String hashedPwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
			user.setPwd(hashedPwd);
		} else if (pwd.equals("") && pwd2.equals("")) {
			;				// 아무일도 하지 않는다
		} else {
			model.addAttribute("msg", "패스워드를 다시 입력하고 수정하세요.");
			model.addAttribute("url", "/project/user/list/" + session.getAttribute("currentUserPage"));
			return "common/alertMsg";
		}
		user.setUname(uname);
		user.setNickname(nickname);
		user.setEmail(email);
		userService.updateUser(user);
		
		return "redirect:/user/list/" + session.getAttribute("currentUserPage");
	}
	
	@GetMapping("/delete/{custid}")
	public String delete(@PathVariable String custid, HttpSession session) {
		String sesscustid = (String) session.getAttribute("sesscustid");
		if (sesscustid == null)
			return "redirect:/user/home";
		userService.deleteUser(custid);
		return "redirect:/user/list/" + session.getAttribute("currentUserPage");
	}
	
	@GetMapping("/list/{page}")
	public String list(@PathVariable int page, HttpSession session, Model model) {
		List<User> list = userService.getUserList(page);
		model.addAttribute("userList", list);
		
		int totalUsers = userService.getUserCount();
		int totalPages = (int) Math.ceil((double)totalUsers / userService.RECORDS_PER_PAGE);
		List<String> pageList = new ArrayList<>();
		for (int i=1; i<=totalPages; i++)
			pageList.add(String.valueOf(i));
		model.addAttribute("pageList", pageList);
		session.setAttribute("currentUserPage", page);
		model.addAttribute("menu", "user");
		
		return "user/list";
	}
	
	
	@GetMapping("/home")
	public String homeForm() {
		return "user/home";
	}
	
	@PostMapping("/home")
	public String homeProc(String custid, String pwd, HttpSession session, Model model) {
		int result = userService.login(custid, pwd);
		if (result == userService.CORRECT_LOGIN) {
			session.setAttribute("sesscustid", custid);
			User user = userService.getUser(custid);
			session.setAttribute("sessUname", user.getUname());
			session.setAttribute("sessEmail", user.getEmail());
			
			// 환영 메세지
			model.addAttribute("msg", user.getUname() + "님 환영합니다.");
			model.addAttribute("url", "/project/home");
		} else if (result == userService.WRONG_PASSWORD) {
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/project/user/home");
		} else {		// custid_NOT_EXIST
			model.addAttribute("msg", "ID 입력이 잘못되었습니다.");
			model.addAttribute("url", "/project/user/home");
		}
		return "common/alertMsg";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/home";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "user/register";
	}
	
	@PostMapping("/register")
	public String registerProc(String custid, String pwd, String pwd2, String uname, 
								 String nickname, String email, Model model) {
		System.out.println(custid);
		if (userService.getUser(custid) != null) {
			model.addAttribute("msg", "사용자 ID가 중복되었습니다.");
			model.addAttribute("url", "/project/user/register");
		}
		if (pwd.equals(pwd2) && pwd.length() >= 4) {	// pwd와 pwd2가 같고, 길이가 4이상이면
			String hashedPwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
			User user = new User(custid, hashedPwd, uname, nickname, email);
			userService.insertUser(user);
			model.addAttribute("msg", "등록을 마쳤습니다. 로그인 하세요.");
			model.addAttribute("url", "/project/user/home");
		} else {
			model.addAttribute("msg", "패스워드 입력이 잘못되었습니다.");
			model.addAttribute("url", "/project/user/register");
		}
		return "common/alertMsg";
	}
	
}
