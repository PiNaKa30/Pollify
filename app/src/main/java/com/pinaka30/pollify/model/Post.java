package com.pinaka30.pollify.model;

import java.time.Instant;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "posts")
public class Post {

	@Id
	@GenericGenerator(name = "sequence_id", strategy = "com.pinaka30.pollify.service.IdGeneratorService",
    parameters = @Parameter(name = "KEY", value = "POST_" ))
	@GeneratedValue(generator = "sequence_id")
	@Column(name = "Post_Id", length = 15)
	private String id;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Channel")
	private Channel channel;
	
	@ManyToOne(cascade = { CascadeType.ALL })
	@JoinColumn(name = "Author")
	private User author;
	
	@Column(name = "Date_Time")
	private Instant dateTime;
	
	@Column(name = "Question")
	private String question;

	@Column(name = "Option1", length = 50)
	private String option1;
	
	@Column(name = "Count1")
	private int count1;

	@Column(name = "Option2", length = 50)
	private String option2;
	
	@Column(name = "Count2")
	private int count2;

	@Column(name = "Option3", length = 50)
	private String option3;
	
	@Column(name = "Count3")
	private int count3;

	@Column(name = "Option4", length = 50)
	private String option4;
	
	@Column(name = "Count4")
	private int count4;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Instant getDateTime() {
		return dateTime;
	}

	public void setDateTime(Instant dateTime) {
		this.dateTime = dateTime;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	@Override
	public String toString() {
		return "Post {id=" + id + ", question=" + question + ", option1=" + option1 + ", option2=" + option2
				+ ", option3=" + option3 + ", option4=" + option4 + "}";
	}

	public int getCount1() {
		return count1;
	}

	public void setCount1(int count1) {
		this.count1 = count1;
	}

	public int getCount2() {
		return count2;
	}

	public void setCount2(int count2) {
		this.count2 = count2;
	}

	public int getCount3() {
		return count3;
	}

	public void setCount3(int count3) {
		this.count3 = count3;
	}

	public int getCount4() {
		return count4;
	}

	public void setCount4(int count4) {
		this.count4 = count4;
	}
	
	
}
