package com.bank.Service;

import java.util.List;

import com.bank.Entity.Transaction;
import com.bank.Entity.users.employees.Employee;

public interface ITransactionServices {

	Transaction ApproveTransaction(Employee approver, Transaction transaction);
	Transaction DeclineTransaction(Employee approver, Transaction transaction);
	List<Boolean> DeclineTransactions(Employee approver, List<Transaction> transactions);
	List<Boolean> ApproveTransactions(Employee approver, List<Transaction> transactions);
	List<Transaction> GetAllPendingTransactions();
	Transaction GetTransaction(int transactionid);

}
