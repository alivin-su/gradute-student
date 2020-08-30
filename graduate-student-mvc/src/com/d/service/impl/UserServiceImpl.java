package com.d.service.impl;

import com.d.bean.User;
import com.d.mapper.UserMapper;
import com.d.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 17:33
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User isExist(String name, String password) {
        return userMapper.isExist(name, password);
    }
}
