package com.pinaka30.pollify.vo;

import org.springframework.stereotype.Component;

@Component
public class ChoiceRequestVO {

	private String postId;
	private int choice;
	
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	
}
