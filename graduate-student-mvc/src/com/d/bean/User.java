package com.d.bean;

/**
 * Created with IntelliJ IDEA
 * Description:
 * Author: sudi
 * Date: 2020/8/30
 * TIME: 12:44
 */
public class User {
    int id;
    String name;
    System password;

    public User() {
    }

    public User(int id, String name, System password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public System getPassword() {
        return password;
    }

    public void setPassword(System password) {
        this.password = password;
    }
}
