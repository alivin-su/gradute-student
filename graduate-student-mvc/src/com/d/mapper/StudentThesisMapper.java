package com.d.mapper;

import com.d.bean.Msg;
import com.d.bean.Page;
import com.d.bean.Thesis;

import java.util.List;
import java.util.Map;

public interface StudentThesisMapper {
    List<Thesis> selectThesis(String name);

    Thesis selectThesisById(String thesisID);

    List<Thesis> selectThesisByPage(String name, int index, int count);

    List<Map<Integer, Object>> selectThesisType();


    void insertThesis(String title, Integer thesisTypeId, String author, String year, Integer check, Integer userThesisId);

    Thesis selectThesisInfo(Integer id);


    void updateThesisInfo(Integer id, String title, Integer thesisTypeId, String author, String year, Integer check);

    void deleteThesisInfo(Integer id);
}
