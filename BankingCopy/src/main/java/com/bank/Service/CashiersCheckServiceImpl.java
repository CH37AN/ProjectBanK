package com.bank.Service;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.Exception.AccountNotFoundException;
import com.bank.Exception.CashierCheckNotFoundException;
import com.bank.Exception.TransactionFailedException;
import com.bank.Entity.CashiersCheck;
import com.bank.Entity.accounts.Account;
import com.bank.Entity.accounts.CreditCard;
import com.bank.Entity.users.User;
import com.bank.Entity.users.customers.Customer;
import com.bank.Entity.users.customers.Individual;
import com.bank.Entity.users.customers.Merchant;
import com.bank.Entity.users.employees.Employee;
import com.bank.Repository.CashiersCheckRepository;
import com.bank.Repository.UserRepository;

@Service
public class CashiersCheckServiceImpl implements ICashiersCheckService {


	@Autowired
	private CashiersCheckRepository cashiersCheckRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private IAccountServices accountServices;
	
	@Override
	public boolean OrderCashiersCheck(String firstName, String middleName, String lastName, Account accountNumber, double amount)
	{
		Iterable<User> customers = userRepository.findAllByFirstNameAndMiddleNameAndLastName(firstName, middleName, lastName);
		
		for( User customer: customers) 
		{
			if(customer instanceof Customer)
			{
				Individual indCustomer = (Individual) customer;
				Account issuingAccount = accountNumber;
				CashiersCheck cashiersCheck = new CashiersCheck(issuingAccount, indCustomer, amount);
				cashiersCheckRepository.save(cashiersCheck);
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean IssueCashiersCheck(String cashiersCheckID, Employee issuer)
	{
		Optional<CashiersCheck> cashiersCheckWrapper = cashiersCheckRepository.findById(cashiersCheckID);
		if(cashiersCheckWrapper.isPresent())
		{
			CashiersCheck cashiersCheck = cashiersCheckWrapper.get();
			if(cashiersCheck.isCashed() || cashiersCheck.isIssued())
				return false;
			
			cashiersCheck.setIssued(true);
			cashiersCheck.setIssueDate(new Date());
			cashiersCheck.setIssuer(issuer);
			cashiersCheckRepository.save(cashiersCheck);
			return true;
		}
		return false;
	}

	@Override
	public boolean DepositCashiersCheck(String cashiersCheckID, Individual customer, Account account) throws AccountNotFoundException, TransactionFailedException, CashierCheckNotFoundException
	{
		Optional<CashiersCheck> cashiersCheckWrapper = cashiersCheckRepository.findById(cashiersCheckID);
		if(cashiersCheckWrapper.isPresent())
		{
			CashiersCheck cashiersCheck = cashiersCheckWrapper.get();
			boolean match = customer.getAccountsList().stream().anyMatch(e -> e.getAccountNumber() == account.getAccountNumber());
			if(cashiersCheck.getRecievingCustomer().getFirstName() == customer.getFirstName() && 
					cashiersCheck.getRecievingCustomer().getMiddleName() == customer.getMiddleName() &&
					cashiersCheck.getRecievingCustomer().getLastName() == customer.getLastName() &&
					!(account instanceof CreditCard) && 
					match && cashiersCheck.isIssued() && !cashiersCheck.isCashed())
			{
				accountServices.MakePayment(cashiersCheck.getIssuingAccount().getAccountNumber(), account.getAccountNumber(), cashiersCheck.getAmount());
				cashiersCheck.setCashed(true);
				cashiersCheck.setCashingDate(new Date());
				cashiersCheckRepository.save(cashiersCheck);
				return true;
			}
			else
			{
				throw new CashierCheckNotFoundException();
			}
		}
		else
		{
			throw new CashierCheckNotFoundException();
		}
	}
	
}




