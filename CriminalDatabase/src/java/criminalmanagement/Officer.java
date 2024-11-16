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
    public java.sql.Date start_date_current;
    public String active;
    public int jail_code;
    
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
    
    public int checkExists(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM officers "
                            + "WHERE badge_number = ?");
            pstmt.setInt(1, badge_number);
            rst = pstmt.executeQuery();
            
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
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
    
    public String[] retrieveOfficer(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM officers WHERE badge_number = ?");
            pstmt.setInt(1, badge_number);
            rst = pstmt.executeQuery();
            
            if (!rst.isBeforeFirst()){
                return null;
            }

            
            String[] arr = null;
            if (rst.next()) {
                String badgeNumber = rst.getString("badge_number");
                String firstName = rst.getString("first_name");
                String lastName = rst.getString("last_name");
                String active = rst.getString("active");
                String jailCode = rst.getString("jail_code");
                String startDate = rst.getString("start_date_current");
                
                arr = new String[] { badgeNumber, firstName, lastName, active,
                                        jailCode, startDate};
            }
            
     
            System.out.println("Success");
   
            return arr;
        } catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    
    public int registerNewOfficer(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement("SELECT 1 FROM jails WHERE jail_code = ?");
            pstmt.setInt(1, jail_code); 

            rst = pstmt.executeQuery();

            if (!rst.next()) {
                return -2; 
            }
            // create new in db
            pstmt = conn.prepareStatement("SELECT MAX(badge_number) + 1 as newID FROM officers");
            rst = pstmt.executeQuery();
            while (rst.next()){
                badge_number = rst.getInt("newId");
            }
            
            pstmt = conn.prepareStatement(
                "INSERT INTO officers (badge_number, first_name, last_name, start_date_current, active, jail_code) "
                + "VALUES (?, ?, ?, CURDATE(), \"T\", ?)");
            pstmt.setInt(1,badge_number);
            pstmt.setString(2, first_name);
            pstmt.setString(3, last_name);
            pstmt.setInt(4, jail_code);
            pstmt.executeUpdate();
            
            
            System.out.println("Success");
            return badge_number;
        } catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
    
    public int assignExistingOfficer(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                "UPDATE officers SET jail_code = ?, start_date_current = CURDATE() "
                + "WHERE badge_number = ?"
            );
            pstmt.setInt(1,jail_code);
            pstmt.setInt(2, badge_number);
            pstmt.executeUpdate();
            
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
        return 0;
    }
    
    public int changeOfficerActive(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
            "UPDATE officers SET active = ?, jail_code = ?, start_date_current = CURDATE() "
            + "WHERE badge_number = ?"
            );
            pstmt.setString(1, active);

            if (jail_code == -1){ 
                pstmt.setNull(2, java.sql.Types.VARCHAR);
            } else {
                pstmt.setInt(2, jail_code);
            }
            pstmt.setInt(3, badge_number);
               
            pstmt.executeUpdate();
            
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
        return 0;
    }
    
    public int changeOfficerJailCode(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement("SELECT 1 FROM jails WHERE jail_code = ?");
            pstmt.setInt(1, jail_code); 

            rst = pstmt.executeQuery();

            if (!rst.next()) {
                return -2; 
            }
            
            pstmt = conn.prepareStatement(
                "UPDATE officers SET jail_code = ?, start_date_current = CURDATE()"
                + "WHERE badge_number = ?"
            );
            pstmt.setInt(1, jail_code);
            pstmt.setInt(2, badge_number);
            pstmt.executeUpdate();
            
            System.out.println("Success");
            return 1;
        } catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
