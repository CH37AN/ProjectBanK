package com.bank.Repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.bank.Entity.users.User;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
	public Optional<User> findByUsernameAndPassword(String username, String password);
	public boolean existsByLastNameOrFirstName(String lastname, String firstname);
	public Optional<User> findByEmail(String email);
	public Optional<User> findByPhoneNumber(String phoneNumber);
	public Optional<User> findByEmailAndPhoneNumber(String email, String phoneNumber);
	public Iterable<User> findAllByLastName(String lastName);
	public Iterable<User> findAllByFirstNameAndMiddleNameAndLastName(String firstName, String middleName, String lastName);
	public Optional<User> findByUsername(String username);
}
