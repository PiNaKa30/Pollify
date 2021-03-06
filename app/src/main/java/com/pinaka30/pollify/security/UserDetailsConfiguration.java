package com.pinaka30.pollify.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.pinaka30.pollify.model.User;
import com.pinaka30.pollify.service.BusinessService;

@Service
public class UserDetailsConfiguration implements UserDetailsService{
	
	@Autowired
	private BusinessService commonService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = commonService.findUserByUsername(username);
		return buildUserForAuthentication(user, new ArrayList<GrantedAuthority>());
	}
	
	private UserDetails buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                true, true, true, true, authorities);
    }

}
