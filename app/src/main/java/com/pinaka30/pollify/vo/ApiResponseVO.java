package com.pinaka30.pollify.vo;

import org.springframework.stereotype.Component;

@Component
public class ApiResponseVO {

	private boolean success;
	private Object data;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
