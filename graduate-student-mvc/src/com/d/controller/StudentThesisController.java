package com.d.controller;

import com.d.bean.Msg;
import com.d.bean.Page;
import com.d.bean.Student;
import com.d.bean.Thesis;
import com.d.service.StudentThesisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/9/1
 * TIME: 13:38
 */
@RequestMapping("/thesis")
@Controller
public class StudentThesisController {
    @Autowired
    StudentThesisService studentThesisService;


    @ResponseBody
    @RequestMapping("/selectThesis")
    public Msg selectThesis(String name, Integer currentPage) {
        Page<Thesis> pageThesis = new Page<>();
        Student student = new Student();
        student.setName(name);
        pageThesis.setStudent(student);
        List<Thesis> thesis = studentThesisService.selectThesis(name);

        if (currentPage == null) {
            pageThesis.setCurrentPage(1);      // 第一次访问，设置当前页为1;
        } else {
            pageThesis.setCurrentPage(currentPage);
        }

        int totalCount = thesis.size();//总条数
        pageThesis.setTotalCount(totalCount);

        //如果当前页<=0，将当前页设为1，若果当前页大于总页数，将当前页设置为最后一页
        if (pageThesis.getCurrentPage() <= 0) {
            pageThesis.setCurrentPage(1);
        } else if (pageThesis.getCurrentPage() > pageThesis.getTotalPage()) {
            pageThesis.setCurrentPage(pageThesis.getTotalPage());
        }

        Integer index = (pageThesis.getCurrentPage() - 1) * pageThesis.getPageCount();
        Integer count = pageThesis.getPageCount();

        List<Thesis> pageThesis1 = studentThesisService.selectThesisByPage(name, index, count);

        pageThesis.setPageData(pageThesis1);

        return Msg.success().add("thesis", pageThesis);
    }

    @ResponseBody
    @RequestMapping("/selectThesisType")
    public Msg selectThesisType() {
        List<Map<Integer, Object>> list = studentThesisService.selectThesisType();
        return Msg.success().add("thesisType", list);
    }


    @ResponseBody
    @RequestMapping(value = "/saveThesis", method = RequestMethod.POST)
    public Msg saveThesis(Thesis thesis) {
        String title = thesis.getTitle();
        Integer thesisTypeId = thesis.getThesisTypeId();
        String author = thesis.getAuthor();
        String year = thesis.getYear();
        Integer check = thesis.getCheck();
        Integer userThesisId = thesis.getUserThesisId();
        studentThesisService.insertThesis(title, thesisTypeId, author, year, check, userThesisId);
        return Msg.success();
    }

    @RequestMapping("/deleteThesis")
    public String deleteThesis(String thesisID, Model model) {
        Thesis thesis = studentThesisService.selectThesisByID(thesisID);

        return "stuDeleteThesis";
    }

    @ResponseBody
    @RequestMapping(value = "/getThesisInfo/{id}", method = RequestMethod.GET)
    public Msg getThesisInfo(@PathVariable("id") Integer id) {
        Thesis thesis = studentThesisService.selectThesisInfo(id);
        return Msg.success().add("thesisInfo", thesis);
    }
}
