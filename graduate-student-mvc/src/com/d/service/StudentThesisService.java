package com.d.service;

import com.d.bean.Page;
import com.d.bean.Thesis;

import java.util.List;

public interface StudentThesisService {

    List<Thesis> selectThesis(String name);

    Thesis selectThesisByID(String thesisID);

    List<Thesis> selectThesisByPage(String name, int index, int count);

}
