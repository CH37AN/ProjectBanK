package com.bank.Repository;

import java.util.Date;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bank.Entity.Transaction;
import com.bank.Entity.accounts.Account;

@Repository
public interface AccountRepository extends CrudRepository<Account, Integer> {

	public Iterable<Account> findAllByApprovalStatus(boolean approvalStatus);
	public Iterable<Account> findAllByApprovalStatusAndApprovalDate(boolean approvalStatus, Date approvalDate);
	public Iterable<Account> findAllByApprovalStatusAndApprovalDateNotNull(boolean approvalStatus);
	
}
