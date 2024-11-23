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
 * @author marie
 */
public class OfficerHistory {
    public int badge_number;
    public int jail_code;
    public java.sql.Date start_date;
    public java.sql.Date end_date;
    
    public int recordCurrentAssignment(){
        Connection conn = ConnectToSQL.connect();

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
        Connection conn = ConnectToSQL.connect();
        
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
    
    public List<String[]> getOfficerHistory() {
        Connection conn = ConnectToSQL.connect();
        List<String[]> historyRecords = new ArrayList<>();

        if (conn == null) {
            System.out.println("Failed to connect to server");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement(
                "SELECT badge_number, jail_code, start_date, end_date " +
                "FROM officer_station_history " +
                "WHERE badge_number = ? "
                        + "ORDER BY end_date DESC, start_date DESC;"
            );
            pstmt.setInt(1, badge_number);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                String[] record = new String[4];
                record[0] = String.valueOf(rst.getInt("badge_number"));
                record[1] = String.valueOf(rst.getInt("jail_code"));
                record[2] = rst.getDate("start_date").toString();
                record[3] = rst.getDate("end_date").toString();
                historyRecords.add(record);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return historyRecords;
    }

}
