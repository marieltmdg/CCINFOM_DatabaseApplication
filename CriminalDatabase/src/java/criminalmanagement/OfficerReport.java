/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;
import criminalmanagement.ConnectToSQL;

public class OfficerReport {
    public int year;
    public HashMap<Integer, OfficerReportData> officerCriminalsMap;

    public OfficerReport(int year) {
        this.year = year;
        this.officerCriminalsMap = new HashMap<>();
    }

    private void generateReport() {
        Connection conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement(
                    "SELECT o.badge_number, o.first_name, o.last_name, COUNT(c.crime_code) AS criminalsCaught "
                    + "FROM officers o "
                    + "LEFT JOIN crimes c ON o.badge_number = c.badge_number "
                    + "WHERE YEAR(c.date_committed) = ? AND o.deleted = 0"
                    + "GROUP BY o.badge_number;"
            );
            pstmt.setInt(1, year);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                int badgeNumber = rst.getInt("badge_number");
                String firstName = rst.getString("first_name");
                String lastName = rst.getString("last_name");
                int criminalsCaught = rst.getInt("criminalsCaught");

                OfficerReportData officerData = new OfficerReportData(firstName, lastName, criminalsCaught);
                officerCriminalsMap.put(badgeNumber, officerData);
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
    
    public List<String[]> getReport(String sortBy, boolean ascending) {
        generateReport();
        List<String[]> reportData = new ArrayList<>();

        for (Map.Entry<Integer, OfficerReportData> entry : officerCriminalsMap.entrySet()) {
            OfficerReportData data = entry.getValue();
            reportData.add(new String[]{
                String.valueOf(entry.getKey()), 
                data.firstName, 
                data.lastName,
                String.valueOf(data.criminalsCaught) 
            });
        }

        Comparator<String[]> comparator;
        switch (sortBy) {
            case "last_name":
                comparator = Comparator.comparing(o -> o[2]);  
                break;
            case "first_name":
                comparator = Comparator.comparing(o -> o[1]); 
                break;
            case "badge_number":
                comparator = Comparator.comparingInt(o -> Integer.parseInt(o[0]));
                break;
            case "criminals_caught":
                comparator = Comparator.comparingInt(o -> Integer.parseInt(o[3])); 
                break;
            default:
                throw new IllegalArgumentException("Invalid sort field: " + sortBy);
        }

        if (!ascending) {
            comparator = comparator.reversed();
        }

        reportData.sort(comparator);
        return reportData;
    }
    
    public static class OfficerReportData {
        String firstName;
        String lastName;
        int criminalsCaught;

        public OfficerReportData(String firstName, String lastName, int criminalsCaught) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.criminalsCaught = criminalsCaught;
        }
    }
}

