package com.d.service;

import com.d.bean.User;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 14:50
 */

public interface UserService {

    User isExist(String name, String password);
}
