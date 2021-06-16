package com.pinaka30.pollify.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name = "users")
public class User {

	@Id
	@GenericGenerator(name = "sequence_id", strategy = "com.pinaka30.pollify.service.IdGeneratorService",
    parameters = @Parameter(name = "KEY", value = "USER_" ))
	@GeneratedValue(generator = "sequence_id")
	@Column(name = "User_Id", length = 15)
	private String id;
	
	@Column(name = "Username", unique = true, length = 20)
	@NotBlank(message = "Username cannot be empty!")
	@NotNull(message = "Username cannot be empty!")
	@Pattern(regexp = "[a-zA-Z0-9]+", message = "Only alphanumeric characters allowed !")
	private String username;
	
	@Column(name = "Password", length = 70)
	@NotBlank(message = "Password cannot be empty!")
	@NotNull(message = "Password cannot be empty!")
	@Pattern(regexp = "[a-zA-Z0-9 _!@#&.]+", message = "Password pattern mismatch !")
	private String password;
	
	@Column(name = "Name", length = 30)
	@NotBlank(message = "Name cannot be empty!")
	@NotNull(message = "Name cannot be empty!")
	private String name;
	
	@OneToMany(mappedBy = "owner", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private Set<Channel> channelsOwned;
	
	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	@JoinTable( name = "subscriptions", 
	        joinColumns = { @JoinColumn(name = "User_Id") }, 
	        inverseJoinColumns = { @JoinColumn(name = "Channel_Id") })
	private Set<Channel> channelsSubscribed;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Channel> getChannelsOwned() {
		return channelsOwned;
	}

	public void setChannelsOwned(Set<Channel> channelsOwned) {
		this.channelsOwned = channelsOwned;
	}

	public Set<Channel> getChannelsSubscribed() {
		return channelsSubscribed;
	}

	public void setChannelsSubscribed(Set<Channel> channelsSubscribed) {
		this.channelsSubscribed = channelsSubscribed;
	}

	@Override
	public String toString() {
		return "User {id=" + id + ", username=" + username + ", name=" + name + ", channelsOwned=" + channelsOwned
				+ ", channelsSubscribed=" + channelsSubscribed + "}";
	}
	
}
