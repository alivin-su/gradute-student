package com.d.controller;

import com.d.bean.Student;
import com.d.bean.Thesis;
import com.d.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
        Student student = userService.isExist(name, password);
        if (student != null) {
            return "forward:/thesis/selectThesis";
        }
        return "register";
    }


    @RequestMapping("/test")
    public String test() {
        return "test";
    }
}
