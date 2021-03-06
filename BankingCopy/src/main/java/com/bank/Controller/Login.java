package com.bank.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bank.Service.IUserServices;
import com.bank.Service.LoggingService;
import com.bank.Service.LoginUserService;
import com.bank.Entity.users.User;
import com.bank.Entity.users.customers.Customer;
import com.bank.Entity.users.customers.Individual;
import com.bank.Entity.users.employees.Admin;
import com.bank.Entity.users.employees.Employee;
import com.bank.Entity.users.employees.Tier1;
import com.bank.Entity.users.employees.Tier2;

@Controller
public class Login {

	@Autowired
	IUserServices userServices;
	@Autowired
	LoginUserService loginUserService;
	@Autowired
	LoggingService loggingService;

	@RequestMapping(value= {"/"}, method = RequestMethod.GET)
    public String welcomehome(ModelMap model, HttpServletRequest request){
        return "HomePage";
    }
	
	@RequestMapping(value= {"/login"}, method = RequestMethod.GET)
    public String welcome(ModelMap model, HttpServletRequest request, HttpSession session){
        String name = (String) model.get("name");
        model.put("Login", name);
        loggingService.log("Login Attempt from IP: " + request.getRemoteAddr() + " recieved.");
        return "Login";
    }
	
	@RequestMapping(value= {"/logout"}, method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, ModelMap model, HttpSession session){
		try {

	        loggingService.log("Logout Request from IP: " + request.getRemoteAddr() + " recieved.");
			if(session.getAttribute("CustomerObject") !=null  && (session.getAttribute("CustomerObject") instanceof Customer))
			{
				if(loginUserService.removeUserLoggedIn(((Customer)session.getAttribute("CustomerObject")).getUsername()))
				{
					String username = ((Customer)session.getAttribute("CustomerObject")).getUsername();
					loggingService.log("Customer with username: " + username + " was logged out.");
				}
				session.setAttribute("CustomerObject", null);
				session.invalidate();
			}
			if(session.getAttribute("EmployeeObject") !=null  && (session.getAttribute("EmployeeObject") instanceof Employee))
			{
				if(loginUserService.removeUserLoggedIn(((Employee)session.getAttribute("EmployeeObject")).getUsername()))
				{
					String username = ((Employee)session.getAttribute("EmployeeObject")).getUsername();
					loggingService.log("Employee with username: " + username + " was logged out.");
				}
				session.setAttribute("EmployeeObject", null);
				session.invalidate();
			}
		}
		catch(Exception e)
		{
			
		}
        return new ModelAndView("redirect:/login");
    }
	
	@RequestMapping(value="/redirectuser", method = RequestMethod.POST)
    public ModelAndView sortUser(HttpServletRequest request, HttpSession session){
    	try {
		String userName = (String) request.getParameter("uname");
		String password = (String) request.getParameter("psw");
        if(userServices.isNewUser(userName))
        {
        	session.setAttribute("EmployeeUsername", userName);
        	return new ModelAndView("redirect:/SetPassword");
        }
        else
        {
        	
        	User user = userServices.ValidateUser(userName, password);
        	if (user == null)
        	{
        		ModelAndView mav = new ModelAndView("Login");
        		
        		if(userServices.isUserEnabled(userName))
        		{
        			if(userServices.incrementFailedAttempts(userName))
            		{
            			mav.addObject("message", "Wrong Password entered!!");
            		}
        		}
        		else
        		{
        			mav.addObject("message", "Account is locked.Please contact the bank");
        		}
        		loggingService.log("Login Attempt from IP: " + request.getRemoteAddr() + " failed.");
        		return mav;
        	}
        	else 
        	{
        		Object oldUser = session.getAttribute("CustomerObject");
        		if(oldUser != null && oldUser instanceof Customer)
        		{
        			loginUserService.removeUserLoggedIn(((Customer)oldUser).getUsername());
        		}
        		else
        		{
        			oldUser = session.getAttribute("EmployeeObject");
        			if(oldUser != null && oldUser instanceof Employee)
            		{
            			loginUserService.removeUserLoggedIn(((Employee)oldUser).getUsername());
            		}
        		}
        		if(!loginUserService.addUserLoggedIn(user.getUsername()))
        		{
        			ModelAndView mav = new ModelAndView("Login");
        			mav.addObject("message", "User is already logged In");
        			return mav;
        		}
        		if(userServices.isUserEnabled(userName) && userServices.resetFailedAttempts(userName))
        		{
        		if(user instanceof Customer)
        		{
        			if(user instanceof Individual)
        			{
        				session.setAttribute("role", "Individual");
                		loggingService.log("Customer of type Individual with username: " + user.getUsername() + " logged In.");
        			}
        			else
        			{
        				session.setAttribute("role", "Merchant");
                		loggingService.log("Customer of type Merchant with username: " + user.getUsername() + " logged In.");
        			}
        			session.setAttribute("CustomerObject", (Customer)user);
        			return new ModelAndView("redirect:/accinfo");
        		}
        		else if(user instanceof Admin)
        		{
        			session.setAttribute("EmployeeObject", (Admin)user);
        			session.setAttribute("role", "Admin");
            		loggingService.log("Employee of privilege Admin with username: " + user.getUsername() + " logged In.");
        			return new ModelAndView("redirect:/AdminHome");
        		}
        		else if(user instanceof Tier1)
        		{
        			session.setAttribute("EmployeeObject", (Tier1)user);
        			session.setAttribute("role", "Tier1");
            		loggingService.log("Employee of privilege Tier1 with username: " + user.getUsername() + " logged In.");
        			return new ModelAndView("redirect:/Tier1Dash");
        		}
        		else
        		{
        			session.setAttribute("EmployeeObject", (Tier2)user);
        			session.setAttribute("role", "Tier2");
            		loggingService.log("Employee of privilege Tier2 with username: " + user.getUsername() + " logged In.");
        			return new ModelAndView("redirect:/Tier2Dash");
        		}
        		}
        		else
        		{
        			ModelAndView mav=new ModelAndView("Login");
        			mav.addObject("message", "Account is locked.Please contact the bank");
        			return mav;
        		}
        	}
        }
    	}
    	catch(Exception ex)
        {
        	return new ModelAndView("Login");
        }//return null;
    }
	
}
