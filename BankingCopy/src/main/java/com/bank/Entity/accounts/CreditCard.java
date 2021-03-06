package com.bank.Entity.accounts;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class CreditCard extends Account {

	@Column(nullable = true)
	private int cvv;
	
	@ElementCollection()
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<String> authorizedMerchants;
	
	public CreditCard() {
	}
	
	public CreditCard(Double balance, Double interest) {
		super(10000.0, interest);
		this.cvv = 0;
		authorizedMerchants = new ArrayList<String>();
	}

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public List<String> getAuthorizedMerchants() {
		return authorizedMerchants;
	}
	
	public void addAuthorizedMerchants(String merchantString) {
		if(authorizedMerchants == null) 
		{
			authorizedMerchants = new ArrayList<String>();
		}
		authorizedMerchants.add(merchantString);
		
	}
	
}
