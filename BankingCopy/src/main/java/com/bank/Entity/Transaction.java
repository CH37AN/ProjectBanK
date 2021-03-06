package com.bank.Entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedDate;

import com.bank.Entity.accounts.Account;
import com.bank.Entity.users.employees.Employee;

@Entity(name = "Transaction")
public class Transaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "transactionID", updatable = false, nullable = false)
	private Integer transactionID;
	@OneToOne(fetch = FetchType.EAGER)
	private Account payer;
	@OneToOne(fetch = FetchType.EAGER)
	private Account payee;
	private Double amount;
	private boolean approvalStatus; 
	@OneToOne(fetch = FetchType.EAGER)
	private Employee approver;
	@Temporal(TemporalType.DATE)
	private Date approvalDate;
	@CreatedDate
	@Temporal(TemporalType.DATE)
	private Date date;
	private double payerBalance;
	private double payeeBalance;

	public Transaction() {
	}
	
	public Transaction(Account payer,
			Account payee,
			Double amount)
	{
		this.date = new Date();
		this.payer = payer;
		this.payee = payee;
		this.amount = amount;
	}
	
	public boolean isApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(boolean approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	public Employee getApprover() {
		return approver;
	}
	public void setApprover(Employee approver) {
		this.approver = approver;
	}
	public Integer getTransactionID() {
		return transactionID;
	}
	public Account getPayer() {
		return payer;
	}
	public Account getPayee() {
		return payee;
	}
	public Double getAmount() {
		return amount;
	}
	public Date getDate() {
		return date;
	}

	public double getPayeeBalance() {
		return payeeBalance;
	}

	public void setPayeeBalance(double payeeBalance) {
		this.payeeBalance = payeeBalance;
	}

	public double getPayerBalance() {
		return payerBalance;
	}

	public void setPayerBalance(double payerBalance) {
		this.payerBalance = payerBalance;
	}
	
}
