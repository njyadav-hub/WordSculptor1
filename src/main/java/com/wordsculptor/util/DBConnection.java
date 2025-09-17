package com.wordsculptor.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static final String URL = 
		    "jdbc:mysql://localhost:3306/wordsculptor";

//    private static final String URL = "jdbc:mysql://localhost:3306/wordsculptor";
    private static final String USER = "root";   // apna MySQL username daalein
    private static final String PASSWORD = "root"; // apna MySQL password daalein

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("done");
        return DriverManager.getConnection(URL, USER, PASSWORD);
        
    }
}