package com.bank.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bank.util.EmailTemplate;
import com.bank.Service.EmailService;
import com.bank.Service.IUserServices;
import com.bank.Service.OtpService;
import com.bank.Entity.users.User;


@Controller
public class OtpController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	public OtpService otpService;
	@Autowired
	public EmailService myEmailService;
	@Autowired
	public IUserServices userServices;

	@RequestMapping(value ="/generateAccountOtp", method = RequestMethod.GET)
	public ModelAndView generateLoginOtp(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		
		User user = (User) session.getAttribute("CustomerObject");
		if(user == null)
		{
			return new ModelAndView("Login");
		}
		String username = user.getUsername();
		int otp = otpService.generateOTP(username);
		logger.info("OTP : "+otp);
		//Generate The Template to send OTP 
		EmailTemplate template = new EmailTemplate("emailTemplate.html");
		Map<String,String> replacements = new HashMap<String,String>();
		replacements.put("user", username);
		replacements.put("otpnum", String.valueOf(otp));
		String message = "Your Otp is : " + String.valueOf(otp) + " . Please enter it exactly";
		myEmailService.sendOtpMessage(user.getEmail(), "OTP for Login", message);

		return new ModelAndView("OtpPage",model);
	}

	@RequestMapping(value ="/forgetpassotp", method = RequestMethod.GET)
	public ModelAndView generateforgetOtp(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
				
		User user = (User) session.getAttribute("CustomerObject");
		if(user == null)
		{
			return new ModelAndView("Login");
		}
		String username = user.getUsername();
		int otp = otpService.generateOTP(username);
		EmailTemplate template = new EmailTemplate("emailTemplate.html");
		Map<String,String> replacements = new HashMap<String,String>();
		replacements.put("user", username);
		replacements.put("otpnum", String.valueOf(otp));
		String message = "Your Otp is : " + String.valueOf(otp) + " . Please enter it exactly";
		myEmailService.sendOtpMessage(user.getEmail(), "OTP for Login", message);
		
			return new ModelAndView("ForgetPasswordOTP",model);
	}

	


	@RequestMapping(value ="/generateAppointmentOtp", method = RequestMethod.GET)
	public ModelAndView generateAppointmentOtp(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		
		User user = (User) session.getAttribute("CustomerObject");
		if(user == null)
		{
			return new ModelAndView("Login");
		}
		String username = user.getUsername();
		int otp = otpService.generateOTP(username);
		logger.info("OTP : "+otp);
		//Generate The Template to send OTP 
		EmailTemplate template = new EmailTemplate("emailTemplate.html");
		Map<String,String> replacements = new HashMap<String,String>();
		replacements.put("user", username);
		replacements.put("otpnum", String.valueOf(otp));
		String message = "Your Otp is : " + String.valueOf(otp) + " . Please enter it exactly";
		myEmailService.sendOtpMessage(user.getEmail(), "OTP for Login", message);

		return new ModelAndView("OtpPageAppointment",model);
	}
	
	@RequestMapping(value ="/validateOtp", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<String> validateOtp(@RequestParam("otpnum") int otpnum, HttpSession session){
		
		
		final ResponseEntity<String> SUCCESS = ResponseEntity.status(200).body("Entered Otp is valid");
		final ResponseEntity<String> FAIL = ResponseEntity.status(405).body("Entered Otp is NOT valid. Please Retry!");
		User user = (User) session.getAttribute("CustomerObject");
		if(user == null)
		{
			return FAIL;
		}
		String username = user.getUsername();
		logger.info(" Otp Number : "+otpnum); 
		//Validate the Otp 
		if(otpnum >= 0){
			int serverOtp = otpService.getOtp(username);
			if(serverOtp > 0){
				if(otpnum == serverOtp){
					session.setAttribute("OtpValid", serverOtp);
					otpService.clearOTP(username);
					return SUCCESS;
				}else{
					return FAIL;
				}
			}else {
				return FAIL;
			}
		}else {
			return FAIL;
		}

	}
}
