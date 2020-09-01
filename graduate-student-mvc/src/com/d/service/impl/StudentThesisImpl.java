package com.d.service.impl;

import com.d.bean.Page;
import com.d.bean.Thesis;
import com.d.mapper.StudentThesisMapper;
import com.d.service.StudentThesisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/9/1
 * TIME: 13:40
 */
@Service
public class StudentThesisImpl implements StudentThesisService {
    @Autowired
    StudentThesisMapper studentThesisMapper;

    @Override
    public List<Thesis> selectThesis(String name) {
        return studentThesisMapper.selectThesis(name);
    }

    @Override
    public Thesis selectThesisByID(String thesisID) {
        return studentThesisMapper.selectThesisById(thesisID);
    }

    @Override
    public List<Thesis> selectThesisByPage(String name, int index, int count) {
        return studentThesisMapper.selectThesisByPage(name, index, count);
    }


}
