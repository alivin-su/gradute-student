package com.d.bean;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 12:44
 */
public class Student {
    private Integer id;
    private String name;
    private String password;
    private Integer number;
    private String teacher;
    private String subject;
    private String college;
    private Integer education;
    private Integer age;

    public Student() {
    }

    public Student(Integer id, String name, String password, Integer number, String teacher, String subject, String college, Integer education, Integer age) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.number = number;
        this.teacher = teacher;
        this.subject = subject;
        this.college = college;
        this.education = education;
        this.age = age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public Integer getEducation() {
        return education;
    }

    public void setEducation(Integer education) {
        this.education = education;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
