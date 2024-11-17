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
public class Crimes {
    public int crime_code;
    public int additional_sentence; // Additional sentence to update
    public String crime_type;
    public int badge_number;
    public String date;
    public int sentence;
    public int criminal_code;
    public Connection conn;
    
    public Crimes() {
        this.conn = connect();
    }

    public Crimes(int crime_code, int additional_sentence) {
        this.crime_code = crime_code;
        this.additional_sentence = additional_sentence;
        this.conn = connect();
    }
    
    public Crimes(int crime_code, String crime_type, int badge_number, String date, int sentence, int criminal_code) {
        this.crime_code = crime_code;
        this.crime_type = crime_type;
        this.badge_number = badge_number;
        this.date = date;
        this.sentence = sentence;
        this.criminal_code = criminal_code;
        this.conn = connect();
    }
    
    public Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/criminaldb?useTimezone=true&serverTimezone=UTC&user=root&password=032805paolo"
            );
            System.out.println("Connection successful");
            this.conn = conn;
            return conn;
        } catch (Exception e) {
            System.out.println("Connection failed: " + e.getMessage());
            return null;
        }
    }

    public boolean changeSentence() {
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
            rst.close();
            pstmt.close();

            // Calculate the new sentence for the crime
            int newCrimeSentence = currentCrimeSentence + additional_sentence; // additionalSentence is assumed to be provided
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
        }
        
        return true;
    }
    
    public boolean addCrime() {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
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
        }
    }

    // View crime
    public ResultSet viewCrime() {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
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
        }
    }

    // Delete crime
    public boolean deleteCrime() {
        if (conn == null) {
            System.out.println("Failed to connect to the database.");
            return false;
        }

        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement("DELETE FROM Crimes WHERE Crime_Code = ?");
            pstmt.setInt(1, crime_code);
            pstmt.executeUpdate();
            pstmt.close();
            System.out.println("Crime deleted successfully.");
            return true;
        } catch (Exception e) {
            System.out.println("Error deleting crime: " + e.getMessage());
            return false;
        }
    }
}
