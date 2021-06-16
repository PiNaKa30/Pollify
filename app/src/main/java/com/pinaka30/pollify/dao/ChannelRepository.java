package com.pinaka30.pollify.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pinaka30.pollify.model.Channel;

@Repository
public interface ChannelRepository extends JpaRepository<Channel, String>{

	public Channel findByName(String name);
	public List<Channel> findByNameIgnoreCaseContaining(String name);
	
}
