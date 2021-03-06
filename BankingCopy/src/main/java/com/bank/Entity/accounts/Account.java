package com.bank.Entity.accounts;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.data.annotation.CreatedDate;
import com.bank.Entity.Transaction;
import com.bank.Entity.users.employees.Employee;

@Entity(name = "Account")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name="AccountType",
        discriminatorType = DiscriminatorType.STRING
    )
public abstract class Account {

	@CreatedDate
	@Temporal(TemporalType.DATE)
	private Date creationDate;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AccountNumber", updatable = false, nullable = false)
	private Integer accountNumber;
	private Double balance;
	private Double interest;
	@OneToOne(fetch = FetchType.EAGER)
	private Employee approver;
	@Temporal(TemporalType.DATE)
	private Date approvalDate;
	private boolean approvalStatus; 
	@ManyToMany(fetch=FetchType.EAGER)
	private List<Transaction> Transactions;
	
	public Account() {
	}
	
	public Account(Double balance,
			Double interest)
	{
		this.creationDate = new Date();
		this.balance = balance;
		this.interest = interest;
		this.approvalStatus = false;
	}
	
	public Employee getApprover() {
		return approver;
	}

	public void setApprover(Employee approver) {
		this.approver = approver;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public boolean isApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(boolean approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	
	public Integer getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(Integer accountNumber) {
		this.accountNumber = accountNumber;
	}
	public Double getInterest() {
		return interest;
	}
	public void setInterest(Double interest) {
		this.interest = interest;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public Double getBalance() {
		return balance;
	}
	
	public double debitAmount(double amount)
	{
		balance -= amount;
		return balance;
	}
	
	public double creditAmount(double amount)
	{
		balance += amount;
		return balance;
	}
	
	public List<Transaction> getTransactions() {
		return Transactions;
	}
	
	public void addTransaction(Transaction transaction) {
		if(Transactions == null)
		{
			Transactions = new ArrayList<Transaction>();
		}
		Transactions.add(transaction);
	}
	
	
}