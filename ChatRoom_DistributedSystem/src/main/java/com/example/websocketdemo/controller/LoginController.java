package com.example.websocketdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.websocketdemo.entity.User;
import com.example.websocketdemo.repository.UserRepository;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/login") // This means URL's start with /login (after Application path)
public class LoginController {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private UserRepository userRepository;

//    @GetMapping // Map ONLY GET Requests
//    public String toLogin(){
//        return "login";
//    }

    @GetMapping(path="/a") // Map ONLY GET Requests
    public ModelAndView logIn (@RequestParam String userName
            , @RequestParam String password) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        ModelAndView modelAndView = new ModelAndView("/login");



        List<User> userList = userRepository.findByUserName(userName);
        if(userList.size() == 1){
            if(userList.get(0).getPassword().equals(password))  {
                if(userList.get(0).isOnline() == false){
                modelAndView.setViewName("/chatroom");
                modelAndView.addObject("username", userName);
                userList.get(0).online();
                } else {
                    modelAndView.addObject("message", "User is Online");
                }
            } else {
                modelAndView.addObject("message", "Wrong Password");
            }
        } else {
            modelAndView.addObject("message", "Wrong User");
        }

        System.out.println(modelAndView.getViewName());
        return modelAndView;
    }
}