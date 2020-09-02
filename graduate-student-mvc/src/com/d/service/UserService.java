package com.d.service;

import com.d.bean.Student;
import com.d.bean.Thesis;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 14:50
 */

public interface UserService {

    Student isExist(String name, String password);

    Student selectUser(String name);

}
