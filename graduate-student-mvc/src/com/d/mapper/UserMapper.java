package com.d.mapper;

import com.d.bean.Student;
import com.d.bean.Thesis;

import java.util.List;

public interface UserMapper {
    Student isExist(String name, String password);

    List<Thesis> selectThesis(String name);
}
