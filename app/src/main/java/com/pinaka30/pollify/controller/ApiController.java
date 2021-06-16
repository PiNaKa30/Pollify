package com.pinaka30.pollify.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.pinaka30.pollify.service.BusinessService;
import com.pinaka30.pollify.vo.ApiResponseVO;
import com.pinaka30.pollify.vo.ChoiceRequestVO;

@RestController
public class ApiController {

	@Autowired
	private BusinessService businessService;
	
	@PostMapping("/user/choose")
	public ApiResponseVO chooseOption(@RequestBody ChoiceRequestVO choiceRequest) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return businessService.applyChoice(auth.getName(), choiceRequest);
	}
	
	
}
