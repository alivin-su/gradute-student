package com.d.bean;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/31
 * TIME: 14:09
 */
public class Thesis {
    private Integer id;
    private Integer userThesisId;
    private String title;
    private Integer thesisTypeId;
    private String author;
    private String year;
    private Integer check;

    public Thesis() {
    }

    public Thesis(Integer id, Integer userThesisId, String title, Integer thesisTypeId, String author, String year, Integer check) {
        this.id = id;
        this.userThesisId = userThesisId;
        this.title = title;
        this.thesisTypeId = thesisTypeId;
        this.author = author;
        this.year = year;
        this.check = check;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserThesisId() {
        return userThesisId;
    }

    public void setUserThesisId(Integer userThesisId) {
        this.userThesisId = userThesisId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getThesisTypeId() {
        return thesisTypeId;
    }

    public void setThesisTypeId(Integer thesisTypeId) {
        this.thesisTypeId = thesisTypeId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Integer getCheck() {
        return check;
    }

    public void setCheck(Integer check) {
        this.check = check;
    }
}
