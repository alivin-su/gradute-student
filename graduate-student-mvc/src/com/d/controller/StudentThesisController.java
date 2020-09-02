package com.d.controller;

import com.d.bean.Page;
import com.d.bean.Student;
import com.d.bean.Thesis;
import com.d.service.StudentThesisService;
import com.d.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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

    @Autowired
    UserService userService;

    @RequestMapping("/selectThesis")
    public String selectThesis(Model model, Integer currentPage) {
        Page<Thesis> pageThesis = new Page<>();
        Student student = userService.selectUser();

        pageThesis.setStudent(student);
        String name = pageThesis.getStudent().getName();
        List<Thesis> thesis = studentThesisService.selectThesis(name);

        if (currentPage == null) {
            currentPage = 1;      // 第一次访问，设置当前页为1;
        } else {
            pageThesis.setCurrentPage(currentPage);
        }

        int totalCount = thesis.size();//总条数
        pageThesis.setTotalCount(totalCount);

        //如果当前页<=0，将当前页设为1，若果当前页大于总页数，将当前页设置为最后一页
        if (currentPage <= 0) {
            pageThesis.setCurrentPage(1);
        } else if (currentPage > pageThesis.getTotalCount()) {
            pageThesis.setCurrentPage(pageThesis.getTotalPage());
        }

        Integer index = (currentPage - 1) * pageThesis.getPageCount();
        Integer count = pageThesis.getPageCount();

        List<Thesis> pageThesis1 = studentThesisService.selectThesisByPage(name, index, count);

        pageThesis.setPageData(pageThesis1);

        model.addAttribute("thesis", pageThesis);
        return "studentIndex";
    }

    @RequestMapping("/updateThesis")
    public String updateThesis(String thesisID, Model model) {
        Thesis thesis = studentThesisService.selectThesisByID(thesisID);
        model.addAttribute("thesis", thesis);
        return "stuUpdateThesis";
    }

    @RequestMapping("/deleteThesis")
    public String deleteThesis(String thesisID, Model model) {
        Thesis thesis = studentThesisService.selectThesisByID(thesisID);

        return "stuDeleteThesis";
    }
}
