package com.example.websocketdemo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    private String userName;
    private String password;
    private boolean isOnline;

    public User() {

    }

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
        this.isOnline = false;
    }

    @Override
    public String toString() {
        return String.format(
                "User[id=%d, userName='%s', password='%s']",
                id, userName, password);
    }

    public String toLogin() {
        return String.format( "%d", id );
    }

// end::sample[]

    public Integer getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public void online() {
        this.isOnline = true;
    }

    public void offline() {
        this.isOnline = false;
    }

    public boolean isOnline() {
        return isOnline;
    }
}
