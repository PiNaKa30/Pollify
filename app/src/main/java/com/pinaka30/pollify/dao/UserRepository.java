package com.pinaka30.pollify.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pinaka30.pollify.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String>{
	
	public User findByUsername(String username);
	public List<User> findByUsernameContainingOrNameContaining(String search1, String search2);
}
