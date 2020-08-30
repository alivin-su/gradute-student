package com.d.mapper;

import com.d.bean.User;

public interface UserMapper {
    User isExist(String name, String password);
}
