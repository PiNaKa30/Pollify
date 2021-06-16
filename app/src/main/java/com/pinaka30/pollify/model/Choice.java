package com.pinaka30.pollify.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "choices")
public class Choice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Choice_Id")
	private int id;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Post")
	private Post post;
	
	@Column(name = "Option_Num")
	private int option;

	@Column(name = "Username")
	private String username;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
