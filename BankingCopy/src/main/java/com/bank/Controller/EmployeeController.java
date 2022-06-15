package com.bank.Controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bank.Service.IAccountServices;
import com.bank.Service.ITransactionServices;
import com.bank.Entity.Transaction;
import com.bank.Service.IUserServices;
import com.bank.Service.UserServiesImpl;
import com.bank.Entity.accounts.Account;
import com.bank.Entity.accounts.CheckingAccount;
import com.bank.Entity.accounts.CreditCard;
import com.bank.Entity.accounts.SavingsAccount;
import com.bank.Entity.users.User;
import com.bank.Entity.users.customers.Customer;
import com.bank.Entity.users.employees.Admin;
import com.bank.Entity.users.employees.Employee;
import com.bank.Entity.users.employees.Tier1;
import com.bank.Entity.users.employees.Tier2;
import com.bank.Repository.UserRepository;

@Controller
public class EmployeeController {

	@Autowired
	IUserServices userServices;

	@Autowired
	ITransactionServices transactionServices;


	@Autowired
	IAccountServices accountServices;

	@RequestMapping(value="/AdminHome", method = RequestMethod.GET)
	public ModelAndView AdminHome(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		try {
			Admin Admin_emp = (Admin) session.getAttribute("EmployeeObject");
			if (Admin_emp == null)
			{
				return new ModelAndView("redirect:/login");
			}
			return new ModelAndView(("Tier3Home"), model);
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}
	

	@RequestMapping(value="/signinhistory", method = RequestMethod.GET)
	public ModelAndView signinhistory(HttpServletRequest request, HttpSession session) {
		ModelMap model = new ModelMap();
		try{
			Employee emp = (Employee) session.getAttribute("EmployeeObject");
			if (emp instanceof Admin)
			{
				List<String> logLines = new ArrayList<String>();
				File file = new File("C:\\SS Proj Repo\\softwaresec545\\Banking_System_Project\\src\\main\\resources\\logger.log");//.getFile("classpath:logger.log");
				BufferedReader reader = new BufferedReader(new FileReader(file));
				String line = reader.readLine();
				while (line != null) {
					if(line.contains("TRACE"))
					{
						logLines.add(line);
					}
					line = reader.readLine();
				}
				reader.close();
				model.addAttribute("loglines",logLines);
				return new ModelAndView("ServiceRequests/LogHistory", model);
			}
			else
			{
				ModelAndView mav = new ModelAndView("redirect:/login");	
				mav.addObject("message","not authorized");
				return mav;
			}
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

	
	@RequestMapping(value= "/TierEmployeeDashboard", method = RequestMethod.GET)
	public ModelAndView TierEmployeeDashboard(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		try {
			Admin Tier_emp = (Admin) session.getAttribute("EmployeeObject");
			if (Tier_emp == null)
			{
				return new ModelAndView("redirect:/login");
			}
			return new ModelAndView(("Tier3Home"), model);
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

	@RequestMapping(value= "/Tier2Dash", method = RequestMethod.GET)
	public ModelAndView Tier2EmployeeDash(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		try {
			Tier2 Tier_emp = (Tier2) session.getAttribute("EmployeeObject");
			if (Tier_emp == null)
			{
				return new ModelAndView("redirect:/login");
			}
			return new ModelAndView(("Tier2Dashboard"), model);
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

	@RequestMapping(value= "/Tier1Dash", method = RequestMethod.GET)
	public ModelAndView Tier1EmployeeDash(HttpServletRequest request, HttpSession session){
		ModelMap model = new ModelMap();
		try {
			Tier1 Tier_emp = (Tier1) session.getAttribute("EmployeeObject");
			if (Tier_emp == null)
			{
				return new ModelAndView("redirect:/login");
			}
			return new ModelAndView(("Tier1Dashboard"), model);
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

}
