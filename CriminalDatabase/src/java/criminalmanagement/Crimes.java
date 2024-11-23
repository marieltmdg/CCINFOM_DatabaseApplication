/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package criminalmanagement;

import java.util.*;
import java.sql.*;
import java.sql.Date;

/**
 *
 * @author marie
 */
public class Crimes {
    public int crime_code;
    public int additional_sentence; 
    public String crime_type;
    public int badge_number;
    public String date;
    public int sentence;
    public int criminal_code;
    public Connection conn;
    
    public Crimes() {
        this.conn = ConnectToSQL.connect();
    }

    public Crimes(int crime_code, int additional_sentence) {
        this.crime_code = crime_code;
        this.additional_sentence = additional_sentence;
        this.conn = ConnectToSQL.connect();
    }
    
    public Crimes(int crime_code, String crime_type, int badge_number, String date, int sentence, int criminal_code) {
        this.crime_code = crime_code;
        this.crime_type = crime_type;
        this.badge_number = badge_number;
        this.date = date;
        this.sentence = sentence;
        this.criminal_code = criminal_code;
        this.conn = ConnectToSQL.connect();
    }
    
    public boolean isDeleted(int crime_code) {
        this.conn = ConnectToSQL.connect();
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        
        try {
            pstmt = conn.prepareStatement("SELECT Deleted FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();

            if (rst.next()) { 
                int deleted = rst.getInt("Deleted");
                if (deleted == 1) {
                    System.out.println("Crime deleted.");
                    return true;
                }
            } else {
                System.out.println("Crime not found.");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } 
        
        return false;
    }

    public boolean changeSentence() {
        this.conn = ConnectToSQL.connect();
        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT Sentence, Criminal_Code FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();

            if (!rst.next()) {
                System.out.println("Crime not found.");
                return false;
            }

            int currentCrimeSentence = rst.getInt("Sentence");
            int criminalCode = rst.getInt("Criminal_Code");
            rst.close();
            pstmt.close();

            pstmt = conn.prepareStatement("SELECT Total_Sentence FROM Criminals WHERE Criminal_Code = ?");
            pstmt.setInt(1, criminalCode);
            rst = pstmt.executeQuery();

            if (!rst.next()) {
                System.out.println("Criminal not found.");
                return false;
            }

            int currentTotalSentence = rst.getInt("Total_Sentence");
            rst.close();
            pstmt.close();

            int newCrimeSentence = currentCrimeSentence + additional_sentence; // additionalSentence is assumed to be provided
            int updatedTotalSentence = currentTotalSentence - currentCrimeSentence + newCrimeSentence;

            pstmt = conn.prepareStatement("UPDATE Crimes SET Sentence = ? WHERE Crime_Code = ?");
            pstmt.setInt(1, newCrimeSentence);
            pstmt.setInt(2, crime_code);
            pstmt.executeUpdate();
            pstmt.close();
        
            pstmt = conn.prepareStatement("UPDATE Criminals SET Total_Sentence = ? WHERE Criminal_Code = ?");
            pstmt.setInt(1, updatedTotalSentence);
            pstmt.setInt(2, criminalCode);
            pstmt.executeUpdate();
            pstmt.close();

            System.out.println("Crime and criminal records updated successfully.");

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return true;
    }
    
    public boolean addCrime() {
        this.conn = ConnectToSQL.connect();
        
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return false;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT MAX(Crime_Code) AS MaxCrimeCode FROM Crimes");
            rst = pstmt.executeQuery();

            int nextCrimeCode = 1; 
            if (rst.next()) {
                nextCrimeCode = rst.getInt("MaxCrimeCode") + 1; 
            }

            rst.close();
            pstmt.close();

            pstmt = conn.prepareStatement("INSERT INTO Crimes (Crime_Code, Crime_Type, Badge_Number, Date_Committed, Sentence, Criminal_Code) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, nextCrimeCode); 
            pstmt.setString(2, crime_type);
            pstmt.setInt(3, badge_number);
            pstmt.setString(4, date);
            pstmt.setInt(5, sentence);
            pstmt.setInt(6, criminal_code);
            pstmt.executeUpdate();
            pstmt.close();
            
            pstmt = conn.prepareStatement("SELECT Total_Sentence FROM Criminals WHERE Criminal_Code = ?");
            pstmt.setInt(1, criminal_code);
            rst = pstmt.executeQuery();

            if (!rst.next()) {
                System.out.println("Criminal not found.");
                return false;
            }

            int currentTotalSentence = rst.getInt("Total_Sentence");
            rst.close();
            pstmt.close();
            
            pstmt = conn.prepareStatement("UPDATE Criminals SET Total_Sentence = ? WHERE Criminal_Code = ?");
            pstmt.setInt(1, currentTotalSentence + sentence);
            pstmt.setInt(2, criminal_code);
            pstmt.executeUpdate();
            pstmt.close();

            System.out.println("Crime added successfully.");
            return true;
        } catch (Exception e) {
            System.out.println("Error adding crime: " + e.getMessage());
            return false;
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

    public String[] viewCrime(int crime_code) {
        this.conn = ConnectToSQL.connect();

        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT Deleted FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();

            if (rst.next() && rst.getInt("Deleted") == 1) {
                System.out.println("Crime has been deleted.");
                return null;
            }

            pstmt = conn.prepareStatement("SELECT * FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();

            if (rst.next()) {
                String[] crimeDetails = new String[7];
                crimeDetails[0] = String.valueOf(rst.getInt("Crime_Code"));
                crimeDetails[1] = rst.getString("Crime_Type");
                crimeDetails[2] = rst.getString("Badge_Number") != null 
                                   ? String.valueOf(rst.getInt("Badge_Number")) 
                                   : "NULL";
                crimeDetails[3] = rst.getDate("Date_Committed").toString();
                crimeDetails[4] = String.valueOf(rst.getInt("Sentence"));
                crimeDetails[5] = rst.getString("Criminal_Code") != null 
                                   ? String.valueOf(rst.getInt("Criminal_Code")) 
                                   : "NULL";
                crimeDetails[6] = String.valueOf(rst.getInt("Deleted"));

                return crimeDetails;
            } else {
                System.out.println("No crime found with the given code.");
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error viewing crime: " + e.getMessage());
            return null;
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    public boolean deleteCrime() {
        this.conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return false;
        }

        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement("UPDATE Crimes SET Deleted = 1 WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            pstmt.executeUpdate();
            pstmt.close();
            System.out.println("Crime deleted successfully.");
            return true;
        } catch (Exception e) {
            System.out.println("Error deleting crime: " + e.getMessage());
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<String[]> crimeReport(int month, int year) {
        this.conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        List<String[]> crimeReportList = new ArrayList<>();

        try {
            String sql = "SELECT Crime_Type, COUNT(Crime_Code) AS Crime_Count FROM Crimes WHERE MONTH(Date_Committed) = ? AND YEAR(Date_Committed) = ? AND Deleted = 0 GROUP BY Crime_Type ORDER BY COUNT(Crime_Code) DESC;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, month);
            pstmt.setInt(2, year);

            ResultSet rst = pstmt.executeQuery();

            while (rst.next()) {
                String crimeType = rst.getString("Crime_Type");
                String crimeCount = String.valueOf(rst.getInt("Crime_Count"));
                crimeReportList.add(new String[] { crimeType, crimeCount });
            }

            return crimeReportList;
        } catch (Exception e) {
            System.out.println("Error generating crime report: " + e.getMessage());
            return null;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean updateCrime(int code, String crime, Date dateCommitted) {
        this.conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return false;
        }

        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE Crimes SET Crime_Type = ?, Date_Committed = ? WHERE Crime_Code = ?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, crime);
            pstmt.setDate(2, dateCommitted); 
            pstmt.setInt(3, code);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Crime updated successfully.");
                return true;
            } else {
                System.out.println("No crime found with the provided code.");
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error updating crime: " + e.getMessage());
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<String[]> relatedOfficer(int crime) {
        this.conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        boolean deleted = isDeleted(crime);
        if (deleted) {
            System.out.println("Crime is marked as deleted.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        List<String[]> officers = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Officers WHERE Badge_Number = (SELECT Badge_Number FROM Crimes WHERE Crime_Code = ?) AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, crime); 
            rst = pstmt.executeQuery();
            while (rst.next()) {
                officers.add(new String[] {
                    String.valueOf(rst.getInt("Badge_Number")),
                    rst.getString("First_Name"),
                    rst.getString("Last_Name"),
                    String.valueOf(rst.getInt("Jail_Code")),
                    String.valueOf(rst.getDate("Start_Date_Current")),
                    rst.getString("Active")
                });
            }
        } catch (Exception e) {
            System.out.println("Error retrieving related officers: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return officers; 
    }


    public List<String[]> relatedCriminal(int crime) {
        this.conn = ConnectToSQL.connect();
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        boolean deleted = isDeleted(crime);
        if (deleted) {
            System.out.println("Crime is marked as deleted.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        List<String[]> criminals = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Criminals WHERE Criminal_Code = (SELECT Criminal_Code FROM Crimes WHERE Crime_Code = ?) AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, crime); 
            rst = pstmt.executeQuery();
            
            while (rst.next()) {
                criminals.add(new String[] {
                    String.valueOf(rst.getInt("Criminal_Code")),
                    rst.getString("First_Name"),
                    rst.getString("Last_Name"),
                    String.valueOf(rst.getInt("Total_Sentence")),
                    String.valueOf(rst.getInt("Jail_Code"))
                });
            }
            return criminals; 
        } catch (Exception e) {
            System.out.println("Error retrieving related criminals: " + e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return criminals; 
    }

    public ResultSet filterByCrimeType(String crimeType) {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            String sql = "SELECT * FROM Crimes WHERE Crime_Type = ? AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, crimeType); // Set the crime type
            rst = pstmt.executeQuery();
            return rst; // Return the result set
        } catch (Exception e) {
            System.out.println("Error filtering by crime type: " + e.getMessage());
            return null;
        }
    }
        
    public ResultSet filterBySentenceHighToLow() {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            String sql = "SELECT * FROM Crimes WHERE Deleted = 0 ORDER BY Sentence DESC";
            pstmt = conn.prepareStatement(sql);
            rst = pstmt.executeQuery();
            return rst; // Return the result set
        } catch (Exception e) {
            System.out.println("Error filtering by sentence (high to low): " + e.getMessage());
            return null;
        }
    }


    public ResultSet filterBySentenceLowToHigh() {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            String sql = "SELECT * FROM Crimes WHERE Deleted = 0 ORDER BY Sentence ASC";
            pstmt = conn.prepareStatement(sql);
            rst = pstmt.executeQuery();
            return rst; // Return the result set
        } catch (Exception e) {
            System.out.println("Error filtering by sentence (low to high): " + e.getMessage());
            return null;
        }
    }

    public ResultSet filterByMonthAndYear(int month, int year) {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            String sql = "SELECT * FROM Crimes WHERE MONTH(Date_Committed) = ? AND YEAR(Date_Committed) = ? AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, month); // Set the month
            pstmt.setInt(2, year);  // Set the year
            rst = pstmt.executeQuery();
            return rst; // Return the result set
        } catch (Exception e) {
            System.out.println("Error filtering by month and year: " + e.getMessage());
            return null;
        }
    }

}