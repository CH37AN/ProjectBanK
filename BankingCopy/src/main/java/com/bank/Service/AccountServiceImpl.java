package com.bank.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.Exception.AccountNotFoundException;
import com.bank.Exception.CustomerNotFoundException;
import com.bank.Exception.MerchantPaymentUnmatchedException;
import com.bank.Exception.TransactionFailedException;
import com.bank.Entity.Transaction;
import com.bank.Entity.accounts.Account;
import com.bank.Entity.accounts.CheckingAccount;
import com.bank.Entity.accounts.CreditCard;
import com.bank.Entity.accounts.SavingsAccount;
import com.bank.Entity.users.User;
import com.bank.Entity.users.customers.Customer;
import com.bank.Entity.users.employees.Employee;
import com.bank.Repository.AccountRepository;
import com.bank.Repository.TransactionRepository;
import com.bank.Repository.UserRepository;

@Service
public class AccountServiceImpl implements IAccountServices {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private TransactionRepository transactionRepository;
	@Autowired
	private ITransactionServices transactionService;
	
	@Override
	public boolean MakePayment(int payerAccount, int recipientAccount, double amount) throws AccountNotFoundException, TransactionFailedException
	{
		Optional<Account> payerWrapper = accountRepository.findById(payerAccount);
		Optional<Account> payeeWrapper = accountRepository.findById(recipientAccount);
		if(payerWrapper.isPresent() && payeeWrapper.isPresent())
		{
			Account payer = payerWrapper.get();
			Account payee = payeeWrapper.get();
			Transaction transaction = new Transaction(payer, payee, amount);
			return CreatePaymentTransaction(transaction, payer, payee);
		}
		else
		{
			throw new AccountNotFoundException();
		}
	}
	
	@Override
	public boolean MakePaymentToPrimary(int payerAccount, String RecipientEmail, String RecipientPhoneNumber, double amount) throws TransactionFailedException, CustomerNotFoundException, AccountNotFoundException
	{
		Optional<User> user = null;
		if((RecipientEmail != null && !"".equalsIgnoreCase(RecipientEmail)) 
				&& (RecipientEmail != null && !"".equalsIgnoreCase(RecipientEmail)))
		{
			user = userRepository.findByEmailAndPhoneNumber(RecipientEmail, RecipientPhoneNumber);
		}
		else if(RecipientEmail != null && !"".equalsIgnoreCase(RecipientEmail))
		{
			user = userRepository.findByEmail(RecipientEmail);
		}
		else if(RecipientPhoneNumber != null && !"".equalsIgnoreCase(RecipientPhoneNumber))
		{
			user = userRepository.findByPhoneNumber(RecipientPhoneNumber);
		}
		else 
		{
			throw new CustomerNotFoundException();
		}
		
		if(user.isPresent())
		{
			Customer payeeCustomer = (Customer) user.get();
			Optional<Account> payerWrapper = accountRepository.findById(payerAccount);
			Account payee = payeeCustomer.getPrimaryAccount();
			if(payerWrapper.isPresent() && payee != null)
			{
				Account payer = payerWrapper.get();
				Transaction transaction = new Transaction(payer, payee, amount);
				return CreatePaymentTransaction(transaction, payer, payee);
			}
			else
			{
				throw new AccountNotFoundException();
			}
		}
		else
		{
			throw new CustomerNotFoundException();
		}
	}
	
	@Override
	public Account CreateAccount(Customer customer, String accountType) 
	{
		Account account = null;
		if("Savings".equals(accountType))
		{
			account = new SavingsAccount(0.0, 5.0);
		}
		else if("Checking".equals(accountType))
		{
			account = new CheckingAccount(0.0);
		}
		else if("CreditCard".equals(accountType))
		{
			account = new CreditCard(10000.0, -10.0);
		}
		else
		{
			return null;
		}
		
		accountRepository.save(account);
		
		if(customer.getAccountsList().isEmpty())
		{
			customer.setPrimaryAccount(account);
		}
		customer.addAccount(account);
		userRepository.save(customer);
		return account;
	}
	
	@Override
	public boolean SetPrimaryAccount(Account primary, String username)
	{
		Optional<User> customerWrapper = userRepository.findById(username);
		if(customerWrapper.isPresent() && customerWrapper.get() instanceof Customer)
		{
			Customer customer = (Customer) customerWrapper.get();
			if(customer.getAccountsList().stream().anyMatch(t -> t.getAccountNumber().equals(primary.getAccountNumber())))
			{
				try {
					customer.setPrimaryAccount(primary);
					userRepository.save(customer);
					return true;
				}
				catch(Exception e)
				{
					return false;
				}
			}
		}
		return false;
	}
	
	
	@Override
	public boolean ApproveAccount(Employee approver, int accountnum)
	{
		Optional<Account> accountWrapper = accountRepository.findById(accountnum);
		if(accountWrapper.isPresent())
		{
			AccountApprover(approver, accountWrapper.get(),true);
			return true;
		}
		return false;
	}
	@Override
	public boolean DeclineAccount(Employee approver, int accountnum)
	{
		Optional<Account> accountWrapper = accountRepository.findById(accountnum);
		if(accountWrapper.isPresent())
		{
			AccountApprover(approver, accountWrapper.get(),false);
			return true;
		}
		return false;
	}
	@Override
	public List<Account> getAllApprovedAccounts()
	{
		Iterable<Account> accounts = accountRepository.findAllByApprovalStatus(true);
		return AccountIterableToListHelper(accounts);
	}
	@Override
	public List<Account> getAllPendingAccounts()
	{
		Iterable<Account> accounts = accountRepository.findAllByApprovalStatusAndApprovalDate(false, null);
		return AccountIterableToListHelper(accounts);
	}
	@Override
	public List<Account> getAllDeclinedAccounts()
	{
		Iterable<Account> accounts = accountRepository.findAllByApprovalStatusAndApprovalDateNotNull(false);
		return AccountIterableToListHelper(accounts);
	}
	
	@Override
	public boolean PayCreditCardAccount(Account sourceAccount, CreditCard ccard, double amount) throws TransactionFailedException
	{
		Transaction transaction = new Transaction(sourceAccount, ccard, amount);
		return CreatePaymentTransaction(transaction, sourceAccount, ccard);
	}
	
	@Override
	public Account GetAccount(int accountNumber)
	{
		try {
			return accountRepository.findById(accountNumber).get();
		}
		catch(Exception e)
		{
			return null;
		}
	}

	@Override
	public boolean AccountExists(int accountNumber) {
		
		return accountRepository.existsById(accountNumber);
	}
	
	@Override
	public boolean MakePaymentToMerchant(CreditCard payer, CreditCard payee, double amount)
	{
		try {
			String valueString = payer.getAccountNumber().toString() + "~" + String.valueOf(amount);
			payee.addAuthorizedMerchants(valueString);
			accountRepository.save(payee);
		}
		catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean TakePayment(int customeraccount, int cvv, CreditCard merchant, double amount) throws AccountNotFoundException, TransactionFailedException, MerchantPaymentUnmatchedException
	{
		Optional<Account> payerWrapper = accountRepository.findById(customeraccount);
		if(payerWrapper.isPresent())
		{
			CreditCard payer = (CreditCard) payerWrapper.get();
			Optional<String> entry = merchant.getAuthorizedMerchants().stream().filter(t -> {
				String[] strings = t.split("~");
				if(strings!=null && strings.length == 2 && strings[0].equals(String.valueOf(customeraccount)) && strings[1].equals(String.valueOf(amount)))
				{
					return true;
				}
				return false;
			}
			).findFirst();
			if(entry.isPresent())
			{
				if(payer.getCvv() == cvv)
				{
					MakePayment(customeraccount, merchant.getAccountNumber(), amount);
					merchant.getAuthorizedMerchants().remove(entry.get());
					accountRepository.save(merchant);
					return true;
				}
			}
			else {
				throw new MerchantPaymentUnmatchedException();
			}
		}
		return false;
	}
	
	private List<Account> AccountIterableToListHelper(Iterable<Account> accounts)
	{
		List<Account> accountsList = new ArrayList<Account>();
		for ( Account account : accounts) 
		{
			accountsList.add(account);
		}
		return accountsList;
	}
	
	private void AccountApprover(Employee approver, Account account, boolean action)
	{
		account.setApprovalDate(new Date());
		account.setApprovalStatus(action);
		account.setApprover(approver);
		accountRepository.save(account);
	}

	private boolean CreatePaymentTransaction(Transaction transaction, Account payer, Account payee) throws TransactionFailedException
	{
		if(transaction != null && transaction.getAmount() > 0)
		{
			try
			{
			transactionRepository.save(transaction);
			payer.addTransaction(transaction);
			payee.addTransaction(transaction);
			accountRepository.save(payer);
			accountRepository.save(payee);
			return true;
			}
			catch (Exception e) {
				throw new TransactionFailedException();
			}
		}
		return false;
	}
	
}










