/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;
import criminalmanagement.ConnectToSQL;
/**
 *
 * @author nathanaelian
 */
public class IncarcerationHistory {
    public int criminal_code;
    public int jail_code;
    public java.sql.Date start_date;
    public java.sql.Date end_date;
    public String status;
    
    public int addRecordWith(){
        Connection conn = ConnectToSQL.connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -2;
        }
        
        try {
            end_date = new java.sql.Date(System.currentTimeMillis());
            PreparedStatement pstmt = conn.prepareStatement(
            "SELECT end_date AS endDATE " +
            "FROM incarceration_history " +
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
                    "INSERT INTO incarceration_history (criminal_code, jail_code, start_date, end_date, status)" +
                    "VALUES (?, ?, ?, ?, ?)"
                    );
            pstmt.setInt(1, criminal_code);
            pstmt.setInt(2, jail_code);
            pstmt.setDate(3, start_date);
            pstmt.setDate(4, end_date);
            pstmt.setString(5, status);
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
        Connection conn = ConnectToSQL.connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -2;
        }
        
        try {
            
            end_date = new java.sql.Date(System.currentTimeMillis());
            
            PreparedStatement pstmt = conn.prepareStatement(
                    "INSERT INTO incarceration_history (criminal_code, jail_code, start_date, end_date, status)" +
                    "VALUES (?, ?, ?, ?, ?)"
                    );
            pstmt.setInt(1, criminal_code);
            pstmt.setInt(2, jail_code);
            pstmt.setDate(3, start_date);
            pstmt.setDate(4, end_date);
            pstmt.setString(5, status);
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
        Connection conn = ConnectToSQL.connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM incarceration_history "
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
    
    public List<String[]> getCrimHistory(){
        Connection conn = ConnectToSQL.connect();
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        String crimCode = null;
        String jailCode = null;
        String startDate = null;
        String endDate = null;
        String status = null;
        List<String[]> jailList = new ArrayList<>();
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM incarceration_history WHERE jail_code = ? ORDER BY criminal_code");
            pstmt.setInt(1, jail_code);
            ResultSet rst = pstmt.executeQuery();
            
            // dne
            if (!rst.isBeforeFirst()) {
                return jailList;
            } 
             
            String[] arr = null;
            while (rst.next()) {
                crimCode = rst.getString("criminal_code");
                jailCode = rst.getString("jail_code");
                startDate = rst.getString("start_date");
                endDate = rst.getString("end_date");
                status = rst.getString("status");
                arr = new String[] {crimCode, jailCode, startDate, endDate, status};
                jailList.add(arr);
            }
            
            rst.close();
       
            System.out.println("Success");
            return jailList;
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
        return jailList;
    }
    
}
