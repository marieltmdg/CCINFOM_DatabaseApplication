/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;

/**
 *
 * @author nathanaelian
 */
public class CriminalJailHistory {
    public int criminal_code;
    public int jail_code;
    public java.sql.Date start_date;
    public java.sql.Date end_date;
    
    public Connection connect(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/criminaldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678");
            System.out.println("Connection successful");
            return conn;
        } catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public int addRecordWith(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -2;
        }
        
        try {
            end_date = new java.sql.Date(System.currentTimeMillis());
            PreparedStatement pstmt = conn.prepareStatement(
            "SELECT end_date AS endDATE " +
            "FROM criminal_jail_history " +
            "WHERE criminal_code = ? " +
            "ORDER BY endDATE DESC " +
            "LIMIT 1;"
            );
            pstmt.setInt(1, criminal_code);
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                start_date = rst.getDate("endDATE");
            }
            
            pstmt = conn.prepareStatement(
                    "INSERT INTO criminal_jail_history (criminal_code, jail_code, start_date, end_date)" +
                    "VALUES (?, ?, ?, ?)"
                    );
            pstmt.setInt(1, criminal_code);
            pstmt.setInt(2, jail_code);
            pstmt.setDate(3, start_date);
            pstmt.setDate(4, end_date);
            pstmt.executeUpdate();
            
            System.out.println("Success");
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return -1;
    }
    
        public int addRecordWithout(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -2;
        }
        
        try {
            
            end_date = new java.sql.Date(System.currentTimeMillis());
            
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO criminal_jail_history (criminal_code, jail_code, start_date, end_date)" +
                    "VALUES (?, ?, ?, ?)"
                    );
            pstmt.setInt(1, criminal_code);
            pstmt.setInt(2, jail_code);
            pstmt.setDate(3, start_date);
            pstmt.setDate(4, end_date);
            pstmt.executeUpdate();
            
            System.out.println("Success");
            pstmt.close();
            conn.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return -1;
    }
    
    public int checkExists(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM criminal_jail_history "
                            + "WHERE criminal_code = ?");
            pstmt.setInt(1, criminal_code);
            ResultSet rst = pstmt.executeQuery();
            
            // dne
            if (!rst.isBeforeFirst()) {
                rst.close();
                pstmt.close();
                conn.close();
                return 0;
            } 
             
            rst.close();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
    
}
