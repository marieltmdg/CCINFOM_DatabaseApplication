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

    public HashMap<Integer, Integer> officerCriminalsMap;

    public OfficerReport(int year) {
        this.year = year;
        this.officerCriminalsMap = new HashMap<>();
    }

    public Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/criminaldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678"
            );
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
        }
        return null;
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
                    + "FROM officers o "
                    + "LEFT JOIN crimes c ON o.badge_number = c.badge_number "
                    + "WHERE YEAR(c.date_committed) = ? "
                    + "GROUP BY o.badge_number;"
            );
            pstmt.setInt(1, year);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                int badgeNumber = rst.getInt("badge_number");
                int criminalsCaught = rst.getInt("criminalsCaught");

                officerCriminalsMap.put(badgeNumber, criminalsCaught);
            }

            System.out.println("Report generated successfully.");
        } catch (Exception e) {
            System.out.println("Error generating report: " + e.getMessage());
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

    public String[] getReport() {
    List<String> reportLines = new ArrayList<>();

    reportLines.add("Officer Report for Year: " + year);
    reportLines.add("Badge Number | Criminals Caught");
    reportLines.add("---------------------------------");

    for (Map.Entry<Integer, Integer> entry : officerCriminalsMap.entrySet()) {
        int badgeNumber = entry.getKey();
        int criminalsCaught = entry.getValue();
        reportLines.add(badgeNumber + "           | " + criminalsCaught);
    }
    
    return reportLines.toArray(new String[0]);
}

}
