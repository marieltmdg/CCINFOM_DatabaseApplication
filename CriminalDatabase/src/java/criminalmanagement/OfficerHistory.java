/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author marie
 */
public class OfficerHistory {
    public int badge_number;
    public int jail_code;
    public String start_date;
    public String end_date;
    
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
    
    public int toggleInactive(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
            PreparedStatement pstmt = conn.prepareStatement("UPDATE officer_station_history SET end_Date = Convert(date, getdate()) WHERE badge_number = ? and end_date is null");
            pstmt.setInt(1, badge_number);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return -1;
    }
    
    public int createNewAssignment(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO officer_station_history (badge_number, jail_code, start_date,end_date) VALUES (?, ?, Convert(date, getdate()))");
            pstmt.setInt(1, badge_number);
            pstmt.setInt(2, jail_code);
            pstmt.setString(3, start_date);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return -1;
    }
}
