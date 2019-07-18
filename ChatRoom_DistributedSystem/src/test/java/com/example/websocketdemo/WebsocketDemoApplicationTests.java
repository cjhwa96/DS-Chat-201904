package com.example.websocketdemo;

import com.example.websocketdemo.entity.User;
import com.example.websocketdemo.repository.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WebsocketDemoApplicationTests {

	@Test
	public void contextLoads() {
	}

//	@Autowired
//	public UserRepository userRepository;
//
//	@Test
//	public void testUserRepository() {
//		User user1 = new User("username1", "pwd1");
//		User user2 = new User("username1", "pwd2");
//		userRepository.save(user1);
//		userRepository.save(user2);
//
//		List<User> userList = userRepository.findByUserName("username1");
//		assertEquals(userList.size(), 1);
//		assertEquals(userList.get(0).getUserName(), "username1");
//		assertEquals(userList.get(0).getPassword(), "pwd1");
//
//	}
}
