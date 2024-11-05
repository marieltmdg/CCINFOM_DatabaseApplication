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
public class Officer {
    public int badge_number;
    public String first_name;  
    public String last_name;
    public int years_of_service;
    public String active;
    public int jail_code;
    
    public ArrayList<Integer> officer_badgeNumber = new ArrayList<>();
    public ArrayList<String> officer_fNameList = new ArrayList<>();
    public ArrayList<String> officer_lNameList = new ArrayList<>();
    public ArrayList<Integer> officer_yearsOfServiceList = new ArrayList<>();
    public ArrayList<String> officer_activeList = new ArrayList<>();
    public ArrayList<Integer> officer_jailCode = new ArrayList<>();
    
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
    
    public int registerNewOfficer(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
             
            // create new in db
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(badge_number) + 1 as newID FROM officers");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                badge_number = rst.getInt("newId");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO officers (badge_number, first_name, last_name, years_of_service, active, jail_code) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1,badge_number);
            pstmt.setString(2, first_name);
            pstmt.setString(3, last_name);
            years_of_service = 0;
            pstmt.setInt(4, years_of_service);
            active = "T";
            pstmt.setString(5, active);
            pstmt.setInt(6, jail_code);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public int assignExistingOfficer(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
            PreparedStatement pstmt = conn.prepareStatement("UPDATE officers SET jail_code = ? WHERE badge_number = ?");
            pstmt.setInt(1,jail_code);
            pstmt.setInt(2, badge_number);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
        return 0;
    }
}