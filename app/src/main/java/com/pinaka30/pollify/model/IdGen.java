package com.pinaka30.pollify.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "IdGen")
public class IdGen {

	@Id
	@Column(name = "Id", length = 15)
	private String id;
	
	@Column(name = "Value")
	private int val;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getVal() {
		return val;
	}

	public void setVal(int val) {
		this.val = val;
	}
	
}
