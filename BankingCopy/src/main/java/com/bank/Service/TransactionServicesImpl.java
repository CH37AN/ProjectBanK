package com.bank.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bank.Entity.Transaction;
import com.bank.Entity.users.employees.Employee;
import com.bank.Repository.AccountRepository;
import com.bank.Repository.TransactionRepository;

@Service
public class TransactionServicesImpl implements ITransactionServices{

	@Autowired
	private TransactionRepository transactionRepository;
	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public Transaction GetTransaction(int transactionid)
	{
		Optional<Transaction> transaction = transactionRepository.findById(transactionid);
		if(transaction.isPresent())
		{
			return transaction.get();
		}
		return null;
	}
	
	@Override
	public Transaction ApproveTransaction(Employee approver, Transaction transaction)
	{
		if(!(transaction.getPayee().isApprovalStatus() && transaction.getPayer().isApprovalStatus()))
		{
			return null;
		}
		
		transaction.setApprovalDate(new Date());
		transaction.setApprovalStatus(true);
		transaction.setApprover(approver);
		try
		{
			if(transaction.getAmount() > 0 && transaction.getAmount() > transaction.getPayer().getBalance())
			{
				return null;
			}
			transaction.getPayee().creditAmount(transaction.getAmount());
			transaction.getPayer().debitAmount(transaction.getAmount());
			transaction.setPayeeBalance(transaction.getPayee().getBalance());
			transaction.setPayerBalance(transaction.getPayer().getBalance());
			transactionRepository.save(transaction);
			accountRepository.save(transaction.getPayee());
			accountRepository.save(transaction.getPayer());
			return transaction;
		}
		catch (Exception exception)
		{
			
		}
		return null;
	}
	
	@Override
	public Transaction DeclineTransaction(Employee approver, Transaction transaction) 
	{
		try 
		{
			transaction.setApprovalDate(new Date());
			transaction.setApprovalStatus(false);
			transaction.setApprover(approver);
			if(transactionRepository.save(transaction) != null)
			{
				return transaction;
			}
		} 
		catch (Exception e) {
			
		}
		return null;
	}

	@Override
	public List<Boolean> DeclineTransactions(Employee approver, List<Transaction> transactions) 
	{
		List<Boolean> results = new ArrayList<Boolean>();
		for( Transaction transaction : transactions)
		{
			boolean status = false;
			if(this.DeclineTransaction(approver, transaction) != null)
			{
				status = true;
			}
			results.add(status);
		}
		return results;
	}

	@Override
	public List<Boolean> ApproveTransactions(Employee approver, List<Transaction> transactions) 
	{
		List<Boolean> results = new ArrayList<Boolean>();
		for( Transaction transaction : transactions)
		{
			boolean status = false;
			if(this.ApproveTransaction(approver, transaction) != null)
			{
				status = true;
			}
			results.add(status);
		}
		return results;
	}

	@Override
	public List<Transaction> GetAllPendingTransactions() {
		
		List<Transaction> transactionList = new ArrayList<Transaction>();
		Iterable<Transaction> transactions = transactionRepository.findAllByApprovalStatusAndApprovalDate(false, null);
		for ( Transaction item : transactions) 
		{
			if(item.getPayee().isApprovalStatus() && item.getPayer().isApprovalStatus())
				transactionList.add(item);
		}
		return transactionList;
	}
	
}
