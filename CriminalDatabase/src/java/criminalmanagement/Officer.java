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
public class Officer {
    public int badge_number;
    public String first_name;  
    public String last_name;
    public java.sql.Date start_date_current;
    public String active;
    public int jail_code;

    public int checkExists(){
        Connection conn = ConnectToSQL.connect();
        
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
        Connection conn = ConnectToSQL.connect();
        
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
                String startDate = rst.getString("start_date_current");
                String active = rst.getString("active");
                String jailCode = rst.getString("jail_code");
                
                arr = new String[] { badgeNumber, firstName, lastName, startDate,
                                    active, jailCode};
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
        Connection conn = ConnectToSQL.connect();
        
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
            int rowsAffected = pstmt.executeUpdate();
        
            if (rowsAffected > 0) {
                return badge_number;
            } else {
                return -1;
            }
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
        Connection conn = ConnectToSQL.connect();
        
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
            int rowsAffected = pstmt.executeUpdate();
        
            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
            }
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
        Connection conn = ConnectToSQL.connect();
        
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
               
            int rowsAffected = pstmt.executeUpdate();
        
            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
            }
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
        Connection conn = ConnectToSQL.connect();
        
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
            int rowsAffected = pstmt.executeUpdate();
        
            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
            }
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
    
    public int deleteOfficerAndHistory() {
        Connection conn = ConnectToSQL.connect();

        if (conn == null) {
            return -1;
        }

        PreparedStatement pstmt = null;
        try {
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement("DELETE FROM officers WHERE badge_number = ?");
            pstmt.setInt(1, badge_number);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                conn.commit();
                return 1; 
            } else {
                return 0;
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
        return -1; 
    }
    
    public int updateOfficerName() {
        Connection conn = ConnectToSQL.connect();

        if (conn == null) {
            return -1;
        }

        PreparedStatement pstmt = null;
        try {
            StringBuilder query = new StringBuilder("UPDATE officers SET ");
            boolean first = true;

            if (first_name != null && !first_name.trim().isEmpty()) {
                query.append("first_name = ?");
                first = false;
            }

            if (last_name != null && !last_name.trim().isEmpty()) {
                if (!first) {
                    query.append(", ");
                }
                query.append("last_name = ?");
            }

            query.append(" WHERE badge_number = ?");

            pstmt = conn.prepareStatement(query.toString());

            int index = 1;

            if (first_name != null && !first_name.trim().isEmpty()) {
                pstmt.setString(index++, first_name);
            }

            if (last_name != null && !last_name.trim().isEmpty()) {
                pstmt.setString(index++, last_name);
            }

            pstmt.setInt(index, badge_number);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                return 1;
            } else {
                return 0;
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
        return -1;
    }
    
    public List<String[]> getOfficersByStatusAndJail(String status, String jail) {
        Connection conn = ConnectToSQL.connect();
        List<String[]> officerList = new ArrayList<>();

        if (conn == null) {
            System.out.println("Failed to connect to server");
            return officerList;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            String sql = "SELECT badge_number, first_name, last_name, start_date_current, active, jail_code " +
                "FROM officers WHERE (active = ? OR ? = 'all') " + 
                "AND (jail_code = ? OR ? = 'all' OR jail_code IS NULL)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setString(2, status);
            pstmt.setString(3, jail);
            pstmt.setString(4, jail);

            rst = pstmt.executeQuery();

            while (rst.next()) {
                String[] officer = new String[6];
                officer[0] = String.valueOf(rst.getInt("badge_number"));
                officer[1] = rst.getString("first_name");
                officer[2] = rst.getString("last_name");
                officer[3] = rst.getDate("start_date_current").toString();
                officer[4] = rst.getString("active");
                officer[5] = (rst.getObject("jail_code") == null) ? "null" : String.valueOf(rst.getInt("jail_code"));
                officerList.add(officer);
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

        return officerList;
    }


}
