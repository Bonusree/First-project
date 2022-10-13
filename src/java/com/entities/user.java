/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entities;

/**
 *
 * @author user
 */

import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class user {
     private int id;
    private  static String name;
    private static String email;
    private static String password;

    public user(int id, String name, String email,String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password=password;
    }

    public user(String name, String email,String password) {
        this.name = name;
        this.email = email;
        this.password=password;
    }
    public user()
    {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public static String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
  
    
}
