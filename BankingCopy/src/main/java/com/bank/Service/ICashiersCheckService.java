package com.bank.Service;

import com.bank.Exception.AccountNotFoundException;
import com.bank.Exception.CashierCheckNotFoundException;
import com.bank.Exception.TransactionFailedException;
import com.bank.Entity.accounts.Account;
import com.bank.Entity.users.customers.Individual;
import com.bank.Entity.users.employees.Employee;

public interface ICashiersCheckService {

	boolean OrderCashiersCheck(String firstName, String middleName, String lastName, Account account, double amount);

	boolean DepositCashiersCheck(String cashiersCheckID, Individual customer, Account account) throws AccountNotFoundException, TransactionFailedException, CashierCheckNotFoundException;

	boolean IssueCashiersCheck(String cashiersCheckID, Employee issuer);

}
