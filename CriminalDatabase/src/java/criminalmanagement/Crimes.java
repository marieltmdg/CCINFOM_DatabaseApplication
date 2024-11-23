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
    public int additional_sentence; // Additional sentence to update
    public String crime_type;
    public int badge_number;
    public String date;
    public int sentence;
    public int criminal_code;
    
    public Connection connect(){
        return ConnectToSQL.connect();
    }

    public Crimes(int crime_code, int additional_sentence) {
        this.crime_code = crime_code;
        this.additional_sentence = additional_sentence;
    }
    
    public Crimes(int crime_code, String crime_type, int badge_number, String date, int sentence, int criminal_code) {
        this.crime_code = crime_code;
        this.crime_type = crime_type;
        this.badge_number = badge_number;
        this.date = date;
        this.sentence = sentence;
        this.criminal_code = criminal_code;
    }
    
    public boolean isDeleted(int crime_code) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
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
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
                if (rst != null) rst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return false;
    }

    public boolean changeSentence() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            // Check if the crime exists
            pstmt = conn.prepareStatement("SELECT Sentence, Criminal_Code FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();

            if (!rst.next()) {
                System.out.println("Crime not found.");
                return false;
            }

            int currentCrimeSentence = rst.getInt("Sentence");
            int criminalCode = rst.getInt("Criminal_Code");

            // Close current ResultSet and PreparedStatement before the next query
            rst.close();
            pstmt.close();

            // Check if the criminal exists
            pstmt = conn.prepareStatement("SELECT Total_Sentence FROM Criminals WHERE Criminal_Code = ?");
            pstmt.setInt(1, criminalCode);
            rst = pstmt.executeQuery();

            if (!rst.next()) {
                System.out.println("Criminal not found.");
                return false;
            }

            int currentTotalSentence = rst.getInt("Total_Sentence");

            // Close current ResultSet and PreparedStatement before updates
            rst.close();
            pstmt.close();

            // Calculate the new sentence for the crime
            int newCrimeSentence = currentCrimeSentence + additional_sentence; 
            int updatedTotalSentence = currentTotalSentence - currentCrimeSentence + newCrimeSentence;

            // Update the Crimes table with the new sentence
            pstmt = conn.prepareStatement("UPDATE Crimes SET Sentence = ? WHERE Crime_Code = ?");
            pstmt.setInt(1, newCrimeSentence);
            pstmt.setInt(2, crime_code);
            pstmt.executeUpdate();

            pstmt.close();

            // Update the Criminals table with the updated total sentence
            pstmt = conn.prepareStatement("UPDATE Criminals SET Total_Sentence = ? WHERE Criminal_Code = ?");
            pstmt.setInt(1, updatedTotalSentence);
            pstmt.setInt(2, criminalCode);
            pstmt.executeUpdate();

            pstmt.close();

            // Log success
            System.out.println("Crime and criminal records updated successfully.");

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
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

        return true;
    }

    
    public boolean addCrime() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            // Get the highest existing crime code
            pstmt = conn.prepareStatement("SELECT MAX(Crime_Code) AS MaxCrimeCode FROM Crimes");
            rst = pstmt.executeQuery();

            int nextCrimeCode = 1; // Default starting value
            if (rst.next()) {
                nextCrimeCode = rst.getInt("MaxCrimeCode") + 1; // Next available crime code
            }

            // Close result set and prepared statement
            rst.close();
            pstmt.close();

            // Insert new crime record
            pstmt = conn.prepareStatement("INSERT INTO Crimes (Crime_Code, Crime_Type, Badge_Number, Date_Committed, Sentence, Criminal_Code) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, nextCrimeCode); // Use the generated next crime code
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

    // View crime
    public ResultSet viewCrime() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        boolean deleted = isDeleted(crime_code);
        if (deleted == true) {
            return null;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            rst = pstmt.executeQuery();
            return rst;
        } catch (Exception e) {
            System.out.println("Error viewing crime: " + e.getMessage());
            return null;
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

    // Delete crime
    public boolean deleteCrime() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
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
    
    public ResultSet crimeReport(int month, int year) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }

        PreparedStatement pstmt = null;

        try {
            String sql = "SELECT Crime_Type, COUNT(Crime_Code) AS Crime_Count FROM Crimes WHERE MONTH(Date_Committed) = ? AND YEAR(Date_Committed) = ? AND Deleted = 0 GROUP BY Crime_Type ORDER BY COUNT(Crime_Code) DESC;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, month);
            pstmt.setInt(2, year);

            return pstmt.executeQuery(); 
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
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE Crimes SET Crime_Type = ?, Date_Committed = ? WHERE Crime_Code = ?";
            pstmt = conn.prepareStatement(sql);

            // Set the parameters for the query
            pstmt.setString(1, crime);
            pstmt.setDate(2, dateCommitted); // Use the provided java.sql.Date
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
    
    // Method to retrieve the related officer for a given crime code
    public ResultSet relatedOfficer(int crime) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        
        boolean deleted = isDeleted(crime);
        if (deleted == true) {
            return null;
        }

        try {
            String sql = "SELECT * FROM Officers WHERE Badge_Number = (SELECT Badge_Number FROM Crimes WHERE Crime_Code = ?) AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, crime); // Set the crime code
            rst = pstmt.executeQuery();
            return rst; 
        } catch (Exception e) {
            System.out.println("Error retrieving related officer: " + e.getMessage());
            return null;
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

    public ResultSet relatedCriminal(int crime) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }

        boolean deleted = isDeleted(crime);
        if (deleted == true) {
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            String sql = "SELECT * FROM Criminals WHERE Criminal_Code = (SELECT Criminal_Code FROM Crimes WHERE Crime_Code = ?) AND Deleted = 0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, crime); // Set the crime code
            rst = pstmt.executeQuery();
            return rst; // Return the result set
        } catch (Exception e) {
            System.out.println("Error retrieving related criminal: " + e.getMessage());
            return null;
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

    public ResultSet filterByCrimeType(String crimeType) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
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
        
    public ResultSet filterBySentenceHighToLow() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
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


    public ResultSet filterBySentenceLowToHigh() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
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

    public ResultSet filterByMonthAndYear(int month, int year) {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
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
    
    public List<String> getCrimeTypes() {
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;
        List<String> crimeTypes = new ArrayList<>();

        try {
            String sql = "SELECT DISTINCT Crime_Type FROM Crimes";
            pstmt = conn.prepareStatement(sql);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                String crimeType = rst.getString("Crime_Type");
                crimeTypes.add(crimeType); 
            }

        } catch (SQLException e) {
            System.out.println("Error retrieving crime types: " + e.getMessage());
            return null;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (rst != null) rst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return crimeTypes; // Return the list of crime types
    }
}
