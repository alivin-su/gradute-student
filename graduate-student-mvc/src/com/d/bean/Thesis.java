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
    private String title;
    private String type;
    private String author;
    private String year;
    private Integer check;

    public Thesis() {
    }

    public Thesis(int id, String title, String type, String author, String year, int check) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.author = author;
        this.year = year;
        this.check = check;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }
}
