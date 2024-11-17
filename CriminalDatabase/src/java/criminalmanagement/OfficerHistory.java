/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;

/**
 *
 * @author marie
 */
public class OfficerHistory {
    public int badge_number;
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
    
    public int recordCurrentAssignment(){
        Connection conn = connect();

        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }

        PreparedStatement pstmt = null;
        try {
            String sql = "INSERT INTO officer_station_history (badge_number, jail_code, start_date, end_date) " +
                         "VALUES (?, ?, ?, CURDATE())";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, badge_number);
            pstmt.setInt(2, jail_code);
            pstmt.setDate(3, start_date); 

            int rowsAffected = pstmt.executeUpdate(); 

            if (rowsAffected > 0) {
                System.out.println("Record History Success");
                return 1;
            } else {
                System.out.println("Failed to insert record");
            }
        } catch(Exception e){
            System.out.println("Error: " + e.getMessage());
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
                            + "WHERE badge_number = ?");
            pstmt.setInt(1, badge_number);
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
