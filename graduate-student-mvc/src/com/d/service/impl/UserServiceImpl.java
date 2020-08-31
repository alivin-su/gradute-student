package com.d.service.impl;

import com.d.bean.Student;
import com.d.bean.Thesis;
import com.d.mapper.UserMapper;
import com.d.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public Student isExist(String name, String password) {
        return userMapper.isExist(name, password);
    }

    @Override
    public List<Thesis> selectThesis(String name) {
        return userMapper.selectThesis(name);
    }

}
