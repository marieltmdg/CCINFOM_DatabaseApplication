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
            pstmt.setString(3, last_name);
            pstmt.setInt(4, total_sentence);
            pstmt.setInt(5, jail_code);
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
    
    public int transferCriminal(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        try {
            PreparedStatement pstmt = conn.prepareStatement("");
            ResultSet rst = pstmt.executeQuery();
            
            return 1;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public String[] retrieveCriminal() {
        Connection conn = connect();
        String criminalCode = null;
        String firstName = null;
        String lastName = null;
        String totalSent = null;
        String jailCode = null;
        String dateCommitted = null;
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM criminals WHERE criminal_code = ?");
            pstmt.setInt(1, criminal_code);
            ResultSet rst = pstmt.executeQuery();
            
            // dne
            if (!rst.isBeforeFirst()) {
                return null;
            } 
             
            String[] arr = null;
            if (rst.next()) {
                criminalCode = rst.getString("criminal_code");
                firstName = rst.getString("first_name");
                lastName = rst.getString("last_name");
                totalSent = rst.getString("total_sentence");
                jailCode = rst.getString("jail_code");
                
            }
            
            rst.close();
            
            pstmt = conn.prepareStatement("SELECT * FROM crimes WHERE criminal_code = ? ORDER BY date_committed DESC LIMIT 1");
            pstmt.setInt(1, criminal_code);
            rst = pstmt.executeQuery();
            
            if (!rst.isBeforeFirst()) {
                return null;
            } 
            
            if (rst.next()){
                dateCommitted = rst.getString("date_committed");
            }            
            arr = new String[] {criminalCode, firstName, lastName, totalSent, jailCode, dateCommitted};
            
            rst.close();
            
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
    
    public int checkExists(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM criminals "
                    + "WHERE criminal_code = ?");
            pstmt.setInt(1, criminal_code);
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
    
    public int updateCriminalJailCode(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                "UPDATE criminals SET jail_code = ? "
                + "WHERE criminal_code = ?"
            );
            
            if (jail_code == -1){
                pstmt.setNull(1, java.sql.Types.VARCHAR);
            } else {
                pstmt.setInt(1, jail_code);
            }
            
            pstmt.setInt(2, criminal_code);
            pstmt.executeUpdate();
            
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
        return 0;
    }
    
}