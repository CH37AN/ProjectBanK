package com.bank.Repository;

import java.util.Date;

import org.springframework.data.repository.CrudRepository;

import com.bank.Entity.Appointments;
import com.bank.Entity.users.customers.Customer;

public interface AppointmentRepository extends CrudRepository<Appointments, Integer> {

	public Iterable<Appointments> findAllByDate(Date date);
	public Iterable<Appointments> findAllByCustomer(Customer username);
	
}
