package com.pinaka30.pollify.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pinaka30.pollify.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, String>{
	
	public Optional<Post> findById(String id);
	public List<Post> findByAuthor_Username(String name);
	public long countByAuthor_Username(String name);
	
}
