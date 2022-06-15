package com.bank.Controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bank.Service.ITransactionServices;
import com.bank.Entity.Transaction;
import com.bank.Entity.users.employees.Employee;
import com.bank.Entity.users.employees.Tier1;
import com.bank.Entity.users.employees.Tier1;
@Controller
public class AuthorizeTransaction {

	@Autowired
	ITransactionServices transactionServices;

	//Authorize transaction changes--->
	@RequestMapping(value="/checker", method = RequestMethod.GET)
	public ModelAndView transactions(HttpServletRequest request, HttpSession session) {
		ModelMap model = new ModelMap();
		try {
			Employee emp = (Employee)session.getAttribute("EmployeeObject");
			if(emp==null)
			{
				return new ModelAndView("redirect:/login");
			}
			else if(emp instanceof Tier1 || emp instanceof Tier1)
			{
				String role = (String)session.getAttribute("role");
				List<Transaction> transactions=transactionServices.GetAllPendingTransactions();
				if(emp instanceof Tier1)
				{
					transactions = transactions.stream()
							.filter(t -> t.getAmount() < 1000)
							.collect(Collectors.toList());
				}
				else
				{
					transactions = transactions.stream()
							.filter(t -> t.getAmount() >= 1000)
							.collect(Collectors.toList());
				}
				session.setAttribute("pendingTransaction", transactions);
				model.addAttribute("transactions", transactions);
				model.addAttribute("role", role);
				return new ModelAndView(("pendingTransaction"), model);
			}
			else
			{
				ModelAndView mav = new ModelAndView("Login");
				mav.addObject("message","not authorized for this task");
				return mav;
			}
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

	@RequestMapping(value="/authorize", method = RequestMethod.POST)
	public ModelAndView authorize(HttpServletRequest request, HttpSession session) {
		ModelMap model = new ModelMap();
		try {
			Employee approver =(Employee)session.getAttribute("EmployeeObject");
			if(approver==null)
			{
				return new ModelAndView("redirect:/login");
			}
			else if(approver instanceof Tier1 || approver instanceof Tier1)
			{
				List<Transaction> transactions=(List<Transaction>) session.getAttribute("pendingTransaction");//transactionServices.GetAllPendingTransactions();
				for(Transaction transaction:transactions ) {
					if(transaction.getTransactionID()==Integer.parseInt(request.getParameter("transactionID"))) {
						if(transactionServices.ApproveTransaction(approver, transaction) !=null) {
							List<Transaction> freshtransactions=transactionServices.GetAllPendingTransactions();
							model.addAttribute("transactions", freshtransactions);
							model.addAttribute("message", "Transaction approved");
							
						}
						else {
							List<Transaction> freshtransactions=transactionServices.GetAllPendingTransactions();
							model.addAttribute("transactions", freshtransactions);
							model.addAttribute("message", "Transaction couldnt be processed");
							
						}
					}
				}
				return new ModelAndView("pendingTransaction",model);
			}
			else {
				ModelAndView mav = new ModelAndView("Login");
				mav.addObject("message","not authorized for this task");
				return mav;
			}
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}
	//<-----

	///copied from the above one for declining transaction
	@RequestMapping(value="/declinetransaction", method = RequestMethod.POST)
	public ModelAndView declinetransaction(HttpServletRequest request, HttpSession session) {
		ModelMap model = new ModelMap();
		try {
			Employee approver =(Employee)session.getAttribute("EmployeeObject");
			if(approver==null)
			{
				return new ModelAndView("redirect:/login");
			}
			else if(approver instanceof Tier1 || approver instanceof Tier1)
			{
				List<Transaction> transactions=(List<Transaction>) session.getAttribute("pendingTransaction");//transactionServices.GetAllPendingTransactions();
				for(Transaction transaction:transactions ) {
					if(transaction.getTransactionID()==Integer.parseInt(request.getParameter("transactionID"))) {
						transactionServices.DeclineTransaction(approver, transaction);
					}
				}
				List<Transaction> freshtransactions=transactionServices.GetAllPendingTransactions();
				model.addAttribute("transactions", freshtransactions);
				model.addAttribute("message", "Transaction declined");
				return new ModelAndView("pendingTransaction",model);
			}
			else {
				ModelAndView mav = new ModelAndView("Login");
				mav.addObject("message","not authorized for this task");
				return mav;
			}
		}
		catch(Exception ex)
		{
			return new ModelAndView("Login");
		}
	}

}
