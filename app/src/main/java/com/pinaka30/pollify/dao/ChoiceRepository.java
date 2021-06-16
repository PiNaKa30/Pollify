package com.pinaka30.pollify.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pinaka30.pollify.model.Choice;

@Repository
public interface ChoiceRepository extends JpaRepository<Choice, Integer>{

	public Choice findByUsernameAndPost_Id(String username, String id);
	public List<Choice> findByUsernameAndPost_Channel_Name(String username, String channelName);
	
}
