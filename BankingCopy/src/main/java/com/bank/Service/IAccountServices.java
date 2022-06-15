package com.bank.Service;

import java.util.List;

import com.bank.Exception.AccountNotFoundException;
import com.bank.Exception.CustomerNotFoundException;
import com.bank.Exception.MerchantPaymentUnmatchedException;
import com.bank.Exception.TransactionFailedException;
import com.bank.Entity.accounts.Account;
import com.bank.Entity.accounts.CreditCard;
import com.bank.Entity.users.customers.Customer;
import com.bank.Entity.users.employees.Employee;

public interface IAccountServices {

	boolean MakePayment(int payerAccount, int recipientAccount, double amount) throws AccountNotFoundException, TransactionFailedException;
	boolean MakePaymentToPrimary(int payerAccount, String RecipientEmail, String RecipientPhoneNumber, double amount) throws TransactionFailedException, CustomerNotFoundException, AccountNotFoundException;
	Account CreateAccount(Customer customer, String accountType);
	boolean AccountExists(int accountNumber);
	boolean MakePaymentToMerchant(CreditCard payer, CreditCard payee, double amount);
	boolean TakePayment(int customeraccount, int cvv, CreditCard merchant, double amount) throws AccountNotFoundException, TransactionFailedException, MerchantPaymentUnmatchedException;
	Account GetAccount(int accountNumber);
	boolean DeclineAccount(Employee approver, int accountnum);
	boolean ApproveAccount(Employee approver, int accountnum);
	List<Account> getAllApprovedAccounts();
	List<Account> getAllPendingAccounts();
	List<Account> getAllDeclinedAccounts();
	boolean PayCreditCardAccount(Account sourceAccount, CreditCard ccard, double amount) throws TransactionFailedException;
	boolean SetPrimaryAccount(Account primary, String username);
}
