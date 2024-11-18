/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;
/**
 *
 * @author nathanaelIan
 */
public class Jails {
    public int jail_code;
    public String area_of_jurisdiction;
    public java.sql.Date start_date;
    
    
    public Jails() {
        
    }
    
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
    
    public String[] retrieveJail(){
        Connection conn = connect();
        String jailCode = null;
        String areaOfJurisdiction = null;
        String yearsActive = null;
        String criminalCount = null;
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM jails WHERE jail_code = ?");
            pstmt.setInt(1, jail_code);
            ResultSet rst = pstmt.executeQuery();
            
            // dne
            if (!rst.isBeforeFirst()) {
                return null;
            } 
             
            String[] arr = null;
            if (rst.next()) {
                jailCode = rst.getString("jail_code");
                areaOfJurisdiction = rst.getString("area_of_jurisdiction");
                yearsActive = rst.getString("start_date");
            }
            
            rst.close();
            
            pstmt = conn.prepareStatement("SELECT COUNT(jail_code) AS criminal_count FROM criminals WHERE jail_code = ?;");
            pstmt.setInt(1, jail_code);
            rst = pstmt.executeQuery();
            
            if (!rst.isBeforeFirst()) {
                return null;
            } 
            
            if (rst.next()){
                criminalCount = rst.getString("criminal_count");
            }     
            
            arr = new String[] {jailCode, areaOfJurisdiction, yearsActive, criminalCount};
       
            System.out.println("Success");
            return arr;
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
        return null;
    }
    
    public boolean addJail(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        
        try {
            pstmt = conn.prepareStatement("SELECT MAX(jail_code) + 1 AS MaxJailCode FROM Jails");
            rst = pstmt.executeQuery();
            while(rst.next()) {
                jail_code = rst.getInt("MaxJailCode");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO Jails (jail_code, area_of_jurisdiction, start_date) VALUE (?, ?, ?)");
            pstmt.setInt(1, jail_code);
            pstmt.setString(2, area_of_jurisdiction);
            pstmt.setDate(3, start_date);
            pstmt.executeUpdate();
            System.out.println("Jail Added Successfully.");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    
    public boolean deleteJail(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        
        try {
            pstmt = conn.prepareStatement("DELETE FROM jails WHERE jail_code = ?");
            pstmt.setInt(1, jail_code);
            pstmt.executeUpdate();
            pstmt.close();
            System.out.println("Jail Deleted Successfully.");
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public List<String[]> getJails() {
        Connection conn = connect();
        List<String[]> jails = new ArrayList<>();

        if (conn == null) {
            System.out.println("Failed to connect to database.");
            return jails;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            String sql = "SELECT jail_code, area_of_jurisdiction FROM jails";
            pstmt = conn.prepareStatement(sql);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                String[] jail = new String[2];
                jail[0] = String.valueOf(rst.getInt("jail_code"));
                jail[1] = rst.getString("area_of_jurisdiction");
                jails.add(jail);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching jails: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return jails;
    }
}
