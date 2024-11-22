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
 * @author nathanaelIan
 */
public class Jails {
    public int jail_code;
    public String area_of_jurisdiction;
    public java.sql.Date start_date;
    
    
    public Jails() {
        
    }
    
    public int checkExistsAndNotDeleted(){
        Connection conn = ConnectToSQL.connect();
        if(conn == null){
            System.out.println("Failed to connect to server");
            return 0;
        }
        
        PreparedStatement pstmt = null;
       
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM jails "
                            + "WHERE jail_code = ? AND deleted = 0;");
            pstmt.setInt(1, jail_code);
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
    
    public String[] retrieveJail(){
        Connection conn = ConnectToSQL.connect();
        String jailCode = null;
        String areaOfJurisdiction = null;
        String startDate = null;
        String criminalCount = null;
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM jails WHERE jail_code = ? AND deleted = 0");
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
                startDate = rst.getString("start_date");
            }
            
            rst.close();
            
            pstmt = conn.prepareStatement("SELECT COUNT(jail_code) AS criminal_count FROM criminals WHERE jail_code = ?");
            pstmt.setInt(1, jail_code);
            rst = pstmt.executeQuery();
            
            if (!rst.isBeforeFirst()) {
                return null;
            } 
            
            if (rst.next()){
                criminalCount = rst.getString("criminal_count");
            }     
            
            arr = new String[] {jailCode, areaOfJurisdiction, startDate, criminalCount};
       
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
    
    public int addJail(){
        Connection conn = ConnectToSQL.connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -2;
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
            return jail_code;
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
        return -2;
    }
    
    public boolean deleteJail(){
        Connection conn = ConnectToSQL.connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        
        try {
            pstmt = conn.prepareStatement("UPDATE jails SET deleted = 1 WHERE jail_code = ?");
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
        Connection conn = ConnectToSQL.connect();
        List<String[]> jails = new ArrayList<>();

        if (conn == null) {
            System.out.println("Failed to connect to database.");
            return jails;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            String sql = "SELECT jail_code, area_of_jurisdiction FROM jails WHERE deleted = 0";
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
    
    public boolean updateJail(){
        Connection conn = ConnectToSQL.connect();

        if (conn == null) {
            return false;
        }
        
        PreparedStatement pstmt = null;
        try {
            StringBuilder query = new StringBuilder("UPDATE jails SET ");
            boolean first = true;

            if (area_of_jurisdiction  != null && !area_of_jurisdiction.trim().isEmpty()) {
                query.append("area_of_jurisdiction = ?");
                first = false;
            }

            if (start_date != null) {
                if (!first) {
                    query.append(", ");
                }
                query.append("start_date = ?");
            }

            query.append(" WHERE jail_code = ?");

            pstmt = conn.prepareStatement(query.toString());

            int index = 1;

            if (area_of_jurisdiction  != null && !area_of_jurisdiction.trim().isEmpty()) {
                pstmt.setString(index++, area_of_jurisdiction);
            }

            if (start_date != null) {
                pstmt.setDate(index++, start_date);
            }

            pstmt.setInt(index, jail_code);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
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
    
    public List<String[]> getJailsByAreaAndYear(String area, String year){
        Connection conn = ConnectToSQL.connect();
        List<String[]> jailList = new ArrayList<>();
        if (conn == null) {
            System.out.println("Failed to connect to server");
            return jailList;
        }
        
        area = "%" + area + "%";

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            String sql = "SELECT * FROM jails WHERE deleted = 0 AND (area_of_jurisdiction LIKE ? or ? = 'all') AND (YEAR(start_date) = ? or ? = 'all')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, area);
            pstmt.setString(2, area);
            pstmt.setString(3, year);
            pstmt.setString(4, year);
            rst = pstmt.executeQuery();
            
            while (rst.next()){
                String[] jail = new String[3];
                jail[0] = String.valueOf(rst.getInt("jail_code"));
                jail[1] = rst.getString("area_of_jurisdiction");
                jail[2] = rst.getDate("start_date").toString();
                jailList.add(jail);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return jailList;
    }
    
    public List<String[]> generateReportOfficerPart(int year, int month){
        Connection conn = ConnectToSQL.connect();
        List<String[]> jailList = new ArrayList<>();
        if (conn == null) {
            System.out.println("Failed to connect to server");
            return jailList;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT j.jail_code, j.area_of_jurisdiction, COUNT(DISTINCT o.badge_number) as officerCount "
                    + "FROM jails j "
                    + "LEFT JOIN officers o ON o.jail_code = j.jail_code "
                    + "LEFT JOIN crimes cri ON cri.badge_number = o.badge_number "
                    + "WHERE j.deleted = 0 AND YEAR(date_committed) < ? OR (YEAR(date_committed) = ? AND MONTH(date_committed) <= ?) "
                    + "GROUP BY j.jail_code;"
            );
            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            pstmt.setInt(3, month);
            
            rst = pstmt.executeQuery();
            
            while (rst.next()){
                String[] jail = new String[3];
                jail[0] = String.valueOf(rst.getInt("jail_code"));
                jail[1] = rst.getString("area_of_jurisdiction");
                jail[2] = String.valueOf(rst.getInt("officerCount"));
                jailList.add(jail);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return jailList;
    }
    
    public List<String[]> generateReportCriminalPart(int year, int month){
        Connection conn = ConnectToSQL.connect();
        List<String[]> jailList = new ArrayList<>();
        if (conn == null) {
            System.out.println("Failed to connect to server");
            return jailList;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT j.jail_code, j.area_of_jurisdiction, COUNT(DISTINCT c.criminal_code) as criminalCount "
                    + "FROM jails j "
                    + "LEFT JOIN criminals c ON c.jail_code = j.jail_code "
                    + "LEFT JOIN crimes cri ON cri.criminal_code = c.criminal_code "
                    + "WHERE j.jail_code >= 0 AND j.deleted = 0 AND YEAR(date_committed) < ? OR (YEAR(date_committed) = ? AND MONTH(date_committed) <= ?) "
                    + "GROUP BY j.jail_code; "
            );
            pstmt.setInt(1, year);
            pstmt.setInt(2, year);
            pstmt.setInt(3, month);
            
            rst = pstmt.executeQuery();
            
            while (rst.next()){
                String[] jail = new String[3];
                jail[0] = String.valueOf(rst.getInt("jail_code"));
                jail[1] = rst.getString("area_of_jurisdiction");
                jail[2] = String.valueOf(rst.getInt("criminalCount"));
                jailList.add(jail);
            }
            
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return jailList;
    }
}
