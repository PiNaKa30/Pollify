package com.pinaka30.pollify.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pinaka30.pollify.model.Channel;
import com.pinaka30.pollify.model.Post;
import com.pinaka30.pollify.model.User;
import com.pinaka30.pollify.service.BusinessService;

@Controller
public class ViewController {
	
	@Autowired
	private BusinessService businessService;
	
	@GetMapping({"/", "/login"})
	public ModelAndView login(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
	
	@GetMapping("/register")
	public ModelAndView registerPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", new User());
        modelAndView.setViewName("register");
        return modelAndView;
    }
	
	@PostMapping("/register")
	public ModelAndView createNewUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        User userExists = businessService.findUserByUsername(user.getUsername());
        if (userExists != null) {
            bindingResult.rejectValue("username", "error.user", "Username taken !");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("register");
        } else {
            businessService.registerUser(user);
            modelAndView.addObject("success", "User has been registered successfully");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
	
	@GetMapping("/user/dashboard")
	public ModelAndView dashboard(){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = businessService.findUserByUsername(auth.getName());
        modelAndView.addObject("user", user);
        modelAndView.addObject("postsCount", businessService.getPostsCountByUser(auth.getName()));
        modelAndView.setViewName("dashboard");
        return modelAndView;
    }
	
	@GetMapping("/user/channel")
	public ModelAndView viewTopic(@RequestParam String name) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = businessService.findUserByUsername(auth.getName());
		Channel channel = businessService.findChannelByName(name);
		modelAndView.addObject("choices", businessService.getUserChoicesByChannel(auth.getName(), name));
		modelAndView.addObject("channel", channel);
		modelAndView.addObject("subscribed", user.getChannelsSubscribed().contains(channel));
		modelAndView.addObject("currentUser", auth.getName());
        modelAndView.addObject("user", user);
		modelAndView.addObject("post", new Post());
		modelAndView.setViewName("posts");
		return modelAndView;
	}
	
	@GetMapping("/user/profile")
	public ModelAndView viewProfile(@RequestParam String username) {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = businessService.findUserByUsername(auth.getName());
		List<Post> postsList = businessService.getPostsByUser(username);
		modelAndView.addObject("currentUser", auth.getName());
		modelAndView.addObject("posts", postsList);
		modelAndView.addObject("choices", businessService.getUserChoicesByPosts(auth.getName(), postsList));
        modelAndView.addObject("user", user);
        modelAndView.addObject("profile", businessService.findUserByUsername(username));
		modelAndView.setViewName("profile");
		return modelAndView;
	}
	
	@GetMapping("/user/createChannel")
	public String createChannel(@RequestParam String name){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Channel channel = businessService.createChannel(auth.getName(), name);
        return "redirect:/user/channel?name=" + channel.getName();
    }
	
	@PostMapping("/user/post")
	public String createPost(@RequestParam String channelName, @Valid @ModelAttribute("post") Post post, BindingResult bindingResult) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        post = businessService.createPost(auth.getName(), channelName, post);
		return "redirect:/user/channel?name=" + channelName;
	}
	
	
	@GetMapping("/user/channels")
	public ModelAndView searchChannels(@RequestParam Optional<String> search) {
		ModelAndView modelAndView = new	ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = businessService.findUserByUsername(auth.getName());
		try {
			modelAndView.addObject("channels", businessService.searchChannels(auth.getName(), search.get()));
			modelAndView.addObject("search", search.get());
		} catch (Exception e) {
			modelAndView.addObject("channels", businessService.getAllChannels(auth.getName()));
			modelAndView.addObject("search", "");
		}
		modelAndView.addObject("currentUser", auth.getName());
        modelAndView.addObject("user", user);
		modelAndView.setViewName("channels");
		return modelAndView;
	}
	
	@GetMapping("/user/users")
	public ModelAndView searchUsers(@RequestParam Optional<String> search) {
		ModelAndView modelAndView = new	ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = businessService.findUserByUsername(auth.getName());
		try {
			modelAndView.addObject("users", businessService.searchUsers(search.get()));
			modelAndView.addObject("search", search.get());
		} catch (Exception e) {
			modelAndView.addObject("users", businessService.getAllUsers());
			modelAndView.addObject("search", "");
		}
		modelAndView.addObject("currentUser", auth.getName());
        modelAndView.addObject("user", user);
		modelAndView.setViewName("users");
		return modelAndView;
	}
	
	@GetMapping("/user/subscribe")
	public String addSubscription(@RequestParam String channel) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		businessService.subscribeChannel(auth.getName(), channel);
		return "redirect:/user/channel?name=" + channel;
	}
	
	@GetMapping("/user/unsubscribe")
	public String removeSubscription(@RequestParam String channel) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		businessService.unSubscribeChannel(auth.getName(), channel);
		return "redirect:/user/channel?name=" + channel;
	}
	
}
