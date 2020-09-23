package com.d.service.impl;

import com.d.bean.Msg;
import com.d.bean.Page;
import com.d.bean.Thesis;
import com.d.mapper.StudentThesisMapper;
import com.d.service.StudentThesisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<Map<Integer, Object>> selectThesisType() {
        return studentThesisMapper.selectThesisType();
    }

    @Override
    public void insertThesis(String title, Integer thesisTypeId, String author, String year, Integer check, Integer userThesisId) {
        studentThesisMapper.insertThesis(title, thesisTypeId, author, year, check, userThesisId);
    }

    @Override
    public Thesis selectThesisInfo(Integer id) {
        return studentThesisMapper.selectThesisInfo(id);
    }

}
