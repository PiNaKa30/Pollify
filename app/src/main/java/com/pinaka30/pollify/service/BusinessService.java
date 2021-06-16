package com.pinaka30.pollify.service;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pinaka30.pollify.dao.ChannelRepository;
import com.pinaka30.pollify.dao.ChoiceRepository;
import com.pinaka30.pollify.dao.PostRepository;
import com.pinaka30.pollify.dao.UserRepository;
import com.pinaka30.pollify.model.Channel;
import com.pinaka30.pollify.model.Choice;
import com.pinaka30.pollify.model.Post;
import com.pinaka30.pollify.model.User;
import com.pinaka30.pollify.vo.ApiResponseVO;
import com.pinaka30.pollify.vo.ChoiceRequestVO;

@Service
public class BusinessService {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ChannelRepository channelRepository;
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private ChoiceRepository choiceRepository;
	
	public User findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

	public Channel findChannelByName(String name) {
		return channelRepository.findByName(name);
	}
	
    public User registerUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

	public Channel createChannel(String username, String channelName){
		User user = userRepository.findByUsername(username);
		Channel channel = new Channel();
		channel.setName(channelName);
		channel.setOwner(user);
		user.getChannelsOwned().add(channel);
		user.getChannelsSubscribed().add(channel);
		userRepository.save(user);
		return channel;
	}
	
	public Post createPost(String username, String channelName, @Valid Post post) {
		User user = userRepository.findByUsername(username);
		Channel channel = channelRepository.findByName(channelName);
		post.setAuthor(user);
		post.setChannel(channel);
		post.setDateTime(Instant.now());
		postRepository.save(post);
		return post;
	}
	
	public List<Map<String, Object>> getAllChannels(String username){
		List<Map<String, Object>> subscribersList = new ArrayList<>();
		List<Channel> list = channelRepository.findAll();
		User user = userRepository.findByUsername(username);
		for(Channel channel: list) {
			Map<String, Object> map = new HashMap<>();
			map.put("name", channel.getName());
			map.put("owner", channel.getOwner().getUsername());
			map.put("subscribed", channel.getSubscribers().contains(user));
			subscribersList.add(map);
		}
		return subscribersList;
	}
	
	public List<Map<String, Object>> getAllUsers(){
		List<Map<String, Object>> usersList = new ArrayList<>();
		List<User> list = userRepository.findAll();
		for(User user: list) {
			Map<String, Object> map = new HashMap<>();
			map.put("name", user.getName());
			map.put("username", user.getUsername());
			usersList.add(map);
		}
		return usersList;
	}
	
	public List<Map<String, Object>> searchChannels(String username, String search){
		List<Map<String, Object>> subscribersList = new ArrayList<>();
		List<Channel> list = channelRepository.findByNameIgnoreCaseContaining(search);
		User user = userRepository.findByUsername(username);
		for(Channel channel: list) {
			Map<String, Object> map = new HashMap<>();
			map.put("name", channel.getName());
			map.put("owner", channel.getOwner().getUsername());
			map.put("subscribed", channel.getSubscribers().contains(user));
			subscribersList.add(map);
		}
		return subscribersList;
	}
	
	public List<Map<String, Object>> searchUsers(String search) {
		List<Map<String, Object>> usersList = new ArrayList<>();
		List<User> list = userRepository.findByUsernameContainingOrNameContaining(search, search);
		for(User user: list) {
			Map<String, Object> map = new HashMap<>();
			map.put("name", user.getName());
			map.put("username", user.getUsername());
			usersList.add(map);
		}
		return usersList;
	}
	
	public List<Post> getPostsByUser(String username){
		return postRepository.findByAuthor_Username(username);
	}

	public ApiResponseVO applyChoice(String username, ChoiceRequestVO choiceRequest) {
		ApiResponseVO responseVO = new ApiResponseVO();
		Map<String, Object> map = new HashMap<>();
		User user = userRepository.findByUsername(username);
		Post post = postRepository.findById(choiceRequest.getPostId()).orElse(null);
		if(post.getAuthor().getUsername().equals(user.getUsername())) {
			responseVO.setSuccess(false);
			map.put("message", "You cannot vote on your own post !");
		} else if(!user.getChannelsSubscribed().contains(post.getChannel())) {
			responseVO.setSuccess(false);
			map.put("message", "You are not subscribed to this channel !");
		} else {
			Choice choice = choiceRepository.findByUsernameAndPost_Id(username, choiceRequest.getPostId());
			if(choice == null) {
				choice = new Choice();
				choice.setUsername(username);
				handleChoices(0, choiceRequest.getChoice(), post, choice);
			}
			if(choice.getOption() != choiceRequest.getChoice()) {
				handleChoices(choice.getOption(), choiceRequest.getChoice(), post, choice);
			}
			responseVO.setSuccess(true);
			map.put("message", "Your response was recorded successfully !");
		}
		responseVO.setData(map);
		return responseVO;
	}
	
	public Map<String, Integer> getUserChoicesByChannel(String username, String channelName){
		Map<String, Integer> map = new HashMap<>();
		List<Choice> allChoices = choiceRepository.findByUsernameAndPost_Channel_Name(username, channelName);
		for(Choice choice: allChoices) {
			map.put(choice.getPost().getId(), choice.getOption());
		}
		return map;
	}
	
	public Map<String, Integer> getUserChoicesByPosts(String username, List<Post> postsList){
		Map<String, Integer> map = new HashMap<>();
		for(Post post: postsList) {
			Choice choice = choiceRepository.findByUsernameAndPost_Id(username, post.getId());
			if(choice != null) {				
				map.put(post.getId(), choice.getOption());
			}
		}
		return map;
	}
	
	private void handleChoices(int oldC, int newC, Post post, Choice choice) {
		if(oldC == 1) {
			post.setCount1(post.getCount1() - 1);
		} else if(oldC == 2) {
			post.setCount2(post.getCount2() - 1);
		} else if(oldC == 3) {
			post.setCount3(post.getCount3() - 1);
		} else if(oldC == 4) {
			post.setCount4(post.getCount4() - 1);
		}
		if(newC == 1) {
			post.setCount1(post.getCount1() + 1);
		} else if(newC == 2) {
			post.setCount2(post.getCount2() + 1);
		} else if(newC == 3) {
			post.setCount3(post.getCount3() + 1);
		} else if(newC == 4) {
			post.setCount4(post.getCount4() + 1);
		}
		
		choice.setOption(newC);
		choice.setPost(post);
		choiceRepository.save(choice);
	}

	public void subscribeChannel(String name, String channelName) {
		User user = userRepository.findByUsername(name);
		Channel channel = channelRepository.findByName(channelName);
		user.getChannelsSubscribed().add(channel);
		userRepository.save(user);
	}

	public void unSubscribeChannel(String name, String channelName) {
		User user = userRepository.findByUsername(name);
		Channel channel = channelRepository.findByName(channelName);
		user.getChannelsSubscribed().remove(channel);
		userRepository.save(user);
	}

	public long getPostsCountByUser(String username) {
		return postRepository.countByAuthor_Username(username);
	}
	
}
