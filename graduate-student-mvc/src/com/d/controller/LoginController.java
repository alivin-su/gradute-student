package com.d.controller;

import com.d.bean.User;
import com.d.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 14:49
 */
@Controller
@RequestMapping("/loginController")
public class LoginController {

    @Autowired
    UserService userService;


    @RequestMapping("/isExist")
    public String isExist(String name,String password) {
        User user = userService.isExist(name, password);
        if (user != null) {
            return "index";
        }
        return "register";
    }
}
