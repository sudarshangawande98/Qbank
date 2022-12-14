package com.qbank.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.qbank.entity.UserMaster;
import com.qbank.service.QuestionService;
import com.qbank.service.SubjectService;
import com.qbank.service.TestMetaDataService;
import com.qbank.service.TopicService;
import com.qbank.serviceimpl.UserServiceImpl;

@RestController
public class UserController {

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	TestMetaDataService testMetaDataService;
	
	Random random = new Random(1000);
	
	@RequestMapping(value = "/")
	public ModelAndView viewLogin(ModelAndView mv, Model m) {
		mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping(value = "/index")
	public ModelAndView viewDashboard(ModelAndView mv, Model m) {
		int subjectCount = subjectService.countSubjectReport();
		m.addAttribute("subjectCount", subjectCount);
		int questionCount = questionService.countQuestionReport();
		m.addAttribute("questionCount", questionCount);
		int topicCount = topicService.countTopicReport();
		m.addAttribute("topicCount", topicCount);
		
		int testCount = testMetaDataService.countTestReport();
		m.addAttribute("testCount", testCount);
		
		mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping(value = "/indexUser")
	public ModelAndView viewDashboard1(ModelAndView mv, Model m) {
		int subjectCount = subjectService.countSubjectReport();
		m.addAttribute("subjectCount", subjectCount);
		int questionCount = questionService.countQuestionReport();
		m.addAttribute("questionCount", questionCount);
		int topicCount = topicService.countTopicReport();
		m.addAttribute("topicCount", topicCount);
		
		int testCount = testMetaDataService.countTestReport();
		m.addAttribute("testCount", testCount);
		
		mv = new ModelAndView("indexUser");
		return mv;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView userForm(ModelAndView mv, Model m) {
		return mv;
	}
	
	//Faculty Register
	@RequestMapping(value = "/UserRegister")
	public ModelAndView userForm1(ModelAndView mv, Model m) {
		return mv;
	}
	
	@RequestMapping(value = "/testGenrate")
	public ModelAndView testGenrate(ModelAndView mv, Model m) {
		return mv;
	}
	
	//Admin registration
	@RequestMapping(value = "/saveUser")
	public ModelAndView registerStudent1(ModelAndView mv,Model m, @ModelAttribute("user") UserMaster user) {
		String wrongmessage = "";
		try {
			wrongmessage = "Successfully Register as Institute";
			m.addAttribute("wrongmessage", wrongmessage);
			userServiceImpl.createAdmin(user);
			viewLogin(mv, m);
			mv = new ModelAndView("login");
		}catch(Exception e) {
			wrongmessage = "Username allready exist";
			
			m.addAttribute("wrongmessage", wrongmessage);
			viewLogin(mv, m);
			mv = new ModelAndView("register");
		}
		return mv;
	}

	//Admin register a user
	@RequestMapping(value = "/saveUser1")
	public ModelAndView registerStudent(ModelAndView mv,Model m, @ModelAttribute("user") UserMaster user) {
		String wrongmessage = "";
		try {
			userServiceImpl.createUser(user);
			mv = new ModelAndView("redirect:/manageUser");
		}catch(Exception e) {
			wrongmessage = "Username allready exist";
			
			m.addAttribute("wrongmessage", wrongmessage);
			viewLogin(mv, m);
			mv = new ModelAndView("UserRegister");
		}
		return mv;
	}
	
	// Display Faculty Info in Institute Section
	@RequestMapping(value = "/manageUser" ,method = RequestMethod.GET)
	public ModelAndView manageUser(ModelAndView mv , Model model) {
		String role = "Faculty";
		List<UserMaster> user = userServiceImpl.getAllFaculty(role);
		model.addAttribute("user", user);
		return mv;
	}
	
//	API to Show User By Id Details
	@GetMapping("/getUserById/{userId}")
	public ResponseEntity<UserMaster> getUserById(@PathVariable(value = "userId") int userId) {
		UserMaster userMaster = userServiceImpl.getUserbyId(userId);
		return new ResponseEntity<>(userMaster, HttpStatus.OK);
	}
	
//	API to Update Details	
	@PutMapping("/updateUserById/{userId}")
	public ResponseEntity<UserMaster> updateUserById(@PathVariable(value = "userId") int userId,
			@RequestBody UserMaster userMaster) {
		
		userServiceImpl.updateUser(userId, userMaster);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deleteUser/{userId}")
	public ModelAndView deleteUser(ModelAndView mv,@PathVariable("userId") int userId,Model m) {
		userServiceImpl.deleteUser(userId);
		manageUser(mv, m);
		mv = new ModelAndView("redirect:/manageUser");
		return mv;
	}
	
	//User and Admin login request
	@PostMapping("/loginUser")
	public ModelAndView loginUser1(@RequestParam(name="userName") String userName,@RequestParam(name="password") String password, @RequestParam(name="role") String role,
			ModelAndView mv,Model m,HttpServletRequest request){
		String wrongmessage = "";
		HttpSession session=request.getSession();
		UserMaster usermaster =userServiceImpl.findByUserNameAndPassword(userName, password);
		System.out.print("user is :-"+usermaster);
		if (usermaster == null) {
			wrongmessage = "User Not Found";
			
			m.addAttribute("wrongmessage", wrongmessage);
			viewLogin(mv, m);
			mv = new ModelAndView("login");
		}else if ((usermaster.getUserName().equals(userName)) && (usermaster.getPassword().equals(password)) && ((usermaster.getRole().equals(role)) && usermaster.getRole().equals("Faculty"))) {
			
			session.setAttribute("userId",usermaster.getUserId());
			session.setAttribute("userName",usermaster.getUserName());
			viewLogin(mv, m);
			mv = new ModelAndView("indexUser");
		}else if ((usermaster.getUserName().equals(userName)) && (usermaster.getPassword().equals(password)) && ((usermaster.getRole().equals(role)) && usermaster.getRole().equals("Institute"))) {
			
			session.setAttribute("userId",usermaster.getUserId());
			session.setAttribute("userName",usermaster.getUserName());
			viewLogin(mv, m);
			mv = new ModelAndView("index");
		}else if ((usermaster.getUserName().equals(userName)) && (usermaster.getPassword().equals(password)) && usermaster.getRole().equals("Pending")) {
			
			wrongmessage = "Please wait....!! Your Institute request not approved by superuser";
			m.addAttribute("wrongmessage", wrongmessage);
			viewLogin(mv, m);
			mv = new ModelAndView("login");	
		}else {
			wrongmessage = "Credential Failed!";
			m.addAttribute("wrongmessage", wrongmessage);
			viewLogin(mv, m);
			mv = new ModelAndView("login");	
		}	
		return mv;
	}
	
	@Autowired
	JdbcTemplate template;
	public int updateStatus(String userName,String password) {
		int no=1;
		String sql = "update userMaster set status=(status+'"+no+"') where userName='" + userName+ "' and password='" +password+ "' ";
		System.out.println(sql);
		System.out.println(template);
		return template.update(sql);
	}
	
	@RequestMapping(value = "/aboutUs")
	public ModelAndView aboutUs(ModelAndView mv, Model m) {
		mv = new ModelAndView("aboutUs");
		return mv;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(ModelAndView mv, Model m, HttpServletRequest request) {
		request.getSession().invalidate();
		mv = new ModelAndView("redirect:/");
		return mv;
	}
}
