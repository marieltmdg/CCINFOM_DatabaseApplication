package criminalmanagement;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author marie
 */

import java.util.*;
import java.sql.*;

public class Criminal {
    // insert fields
    public int criminal_code;
    public String first_name;  
    public String last_name;
    public int total_sentence;
    public int jail_code;
    
    public ArrayList<Integer> criminal_idList = new ArrayList<>();
    public ArrayList<String> criminal_fNameList = new ArrayList<>();
    public ArrayList<String> criminal_lNameList = new ArrayList<>();
    public ArrayList<Integer> criminal_totalSentenceList = new ArrayList<>();
    public ArrayList<Integer> criminal_jailCode = new ArrayList<>();
    
    public Criminal(){
        
    }
    
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
    
    public int registerCriminal(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(criminal_code) + 1 as newID FROM criminals");
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                criminal_code = rst.getInt("newId");
            }

            pstmt = conn.prepareStatement("INSERT INTO criminals (criminal_code, first_name, last_name, total_sentence, jail_code) VALUES (?,?,?,?,?)");
            pstmt.setInt(1,criminal_code);
            pstmt.setString(2, first_name);
            pstmt.setString(2, last_name);
            pstmt.setInt(3, total_sentence);
            pstmt.setInt(4, jail_code);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
            
            System.out.println("Success");
            return 1;
        } catch (Exception e){
            System.out.println(e.getMessage());
            return 0;
        }
    }
}