package com.example.websocketdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.websocketdemo.entity.User;
import com.example.websocketdemo.repository.UserRepository;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.List;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/login") // This means URL's start with /login (after Application path)
public class LoginController {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private UserRepository userRepository;

    @GetMapping // Map ONLY GET Requests
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView modelAndView = new ModelAndView("/login");
        String clientAddr = request.getLocalAddr();
        String localAddr1 = "127.0.0.1";
        String localAddr2 = "0:0:0:0:0:0:0:1";
        System.out.println(clientAddr);
        if (clientAddr.equals(localAddr1)|| clientAddr.equals(localAddr2)){
            return new ModelAndView("redirect:/admin");
        }
        return modelAndView;
    }

    @PostMapping(path="/a") // Map ONLY GET Requests
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