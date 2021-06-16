package com.pinaka30.pollify.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "channels")
public class Channel {

	@Id
	@GenericGenerator(name = "sequence_id", strategy = "com.pinaka30.pollify.service.IdGeneratorService",
    parameters = @Parameter(name = "KEY", value = "CHANNEL_" ))
	@GeneratedValue(generator = "sequence_id")
	@Column(name = "Channel_Id", length = 15)
	private String id;
	
	@Column(name = "Channel_Name", unique = true, length = 20)
	private String name;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Owner")
	private User owner;
	
	@ManyToMany(mappedBy = "channelsSubscribed", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private Set<User> subscribers;
	
	@OneToMany(mappedBy = "channel", cascade = { CascadeType.ALL }, fetch = FetchType.LAZY)
	private Set<Post> posts;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Set<User> getSubscribers() {
		return subscribers;
	}

	public void setSubscribers(Set<User> subscribers) {
		this.subscribers = subscribers;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	@Override
	public String toString() {
		return "Channel [id=" + id + ", name=" + name + ", posts=" + posts + "]";
	}
}
