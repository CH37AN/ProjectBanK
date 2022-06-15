package com.bank.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bank.Entity.CashiersCheck;
import com.bank.Entity.accounts.Account;

@Repository
public interface CashiersCheckRepository extends CrudRepository<CashiersCheck, String> {

	
	
}
