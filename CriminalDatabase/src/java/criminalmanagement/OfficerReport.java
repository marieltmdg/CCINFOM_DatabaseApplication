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
public class OfficerReport {
    public int year;
    
    public ArrayList<Officer> officerList;
    public ArrayList<Integer> numOfCriminalsCaughtList;
         
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
    
    public void generateReport() {
        Connection conn = connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT o.badge_number, COUNT(c.crime_code) AS criminalsCaught "
                    +"FROM officers o "
                    +"LEFT JOIN crimes c ON o.badge_number = c.badge_number "
                    +"WHERE YEAR(c.date_committed) = ? "
                    +"GROUP BY o.badge_number;"
            );
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            
            while (rst.next()) {
                Officer officer = new Officer();
                officer.badge_number = rst.getInt("badge_number");
                int criminalsCaught = rs.getInt("criminalsCaught");
                
                officerList.add(officer);
                numOfCriminalsCaughtList.add(criminalsCaught);
            }
            
            System.out.println("Report generated successfully.");
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
    }
}
