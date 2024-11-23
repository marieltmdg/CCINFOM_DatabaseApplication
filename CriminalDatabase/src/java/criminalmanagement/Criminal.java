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
        return ConnectToSQL.connect();
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
                            + "WHERE criminal_code = ? AND first_name = ? AND last_name = ? AND deleted = 0");
            pstmt.setInt(1, criminal_code);
            pstmt.setString(2, first_name);
            pstmt.setString(3, last_name);
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
    
    public int checkExists(int criminal_code){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT * FROM criminals "
                            + "WHERE criminal_code = ? AND deleted = 0");
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
    
    public int newCriminalCode(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT MAX(criminal_code) + 1 as newID FROM criminals");
            ResultSet rst = pstmt.executeQuery();
            return rst.getInt("newID");
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
    
    public boolean deleteCriminal(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        
        try {
            pstmt = conn.prepareStatement("UPDATE criminals SET deleted=1 WHERE criminal_code = ? AND first_name = ? AND last_name = ?");
            pstmt.setInt(1, criminal_code);
            pstmt.setString(2, first_name);
            pstmt.setString(3, last_name);
            pstmt.executeUpdate();
            pstmt.close();
            
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
    
    public int deleteCriminalWithCrimCodeOnly(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return 0;
        }
        
        PreparedStatement pstmt = null;
        
        try {
            pstmt = conn.prepareStatement("UPDATE criminals SET deleted = 1 WHERE criminal_code = ? AND jail_code = ?");
            pstmt.setInt(1, criminal_code);
            pstmt.setInt(2, jail_code);
            pstmt.executeUpdate();
            pstmt.close();
            
            return 1;
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
        return 0;
    }
    
    public boolean updateCriminal(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return false;
        }
        
        PreparedStatement pstmt = null;
        
        try {
            if(!"".equals(first_name)){
                pstmt = conn.prepareStatement("UPDATE criminals SET first_name = ? WHERE criminal_code = ?");
                pstmt.setString(1, first_name);
                pstmt.setInt(2, criminal_code);
                pstmt.executeUpdate();
            }
            if(!"".equals(last_name)){
                pstmt = conn.prepareStatement("UPDATE criminals SET last_name = ? WHERE criminal_code = ?");
                pstmt.setString(1, last_name);
                pstmt.setInt(2, criminal_code);
                pstmt.executeUpdate();
            }
            if(total_sentence >= 0){
                pstmt = conn.prepareStatement("UPDATE criminals SET total_sentence = ? WHERE criminal_code = ?");
                pstmt.setInt(1, total_sentence);
                pstmt.setInt(2, criminal_code);
                pstmt.executeUpdate();
            }
            if(jail_code >= 0){
                pstmt = conn.prepareStatement("UPDATE criminals SET jail_code = ? WHERE criminal_code = ?");
                pstmt.setInt(1, jail_code);
                pstmt.setInt(2, criminal_code);
                pstmt.executeUpdate();
            }
            pstmt.close();
            
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
    
    public String[] retrieveCriminal(){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return null;
        }
        
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM criminals WHERE criminal_code = ?");
            pstmt.setInt(1, criminal_code);
            rst = pstmt.executeQuery();
            
            if (!rst.isBeforeFirst()){
                return null;
            }
            
            String[] arr = null;
            if (rst.next()) {
                String criminalCode = rst.getString("criminal_code");
                String firstName = rst.getString("first_name");
                String lastName = rst.getString("last_name");
                String sentence = rst.getString("total_sentence");
                String jailCode = rst.getString("jail_code");
                String deleted = rst.getString("deleted");
                
                arr = new String[] { criminalCode, firstName, lastName, sentence,
                                        jailCode, deleted};
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
    
    public List<Map<String, Object>> listCriminals(int cCodeStart, int cCodeEnd, int tsStart, int tsEnd, int jcStart, int jcEnd) {
        List<Map<String, Object>> criminalList = new ArrayList<>();
        Connection conn = connect();

        if (conn == null) {
            System.out.println("Failed to connect to server");
            return criminalList;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM criminals "
                                        + "WHERE criminal_code BETWEEN ? AND ? "
                                        + "AND total_sentence BETWEEN ? AND ? "
                                        + "AND jail_code BETWEEN ? AND ? AND deleted = 0");
            pstmt.setInt(1, cCodeStart);
            pstmt.setInt(2, cCodeEnd);
            pstmt.setInt(3, tsStart);
            pstmt.setInt(4, tsEnd);
            pstmt.setInt(5, jcStart);
            pstmt.setInt(6, jcEnd);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("criminal_code", rst.getInt("criminal_code"));
                row.put("first_name", rst.getString("first_name"));
                row.put("last_name", rst.getString("last_name"));
                row.put("total_sentence", rst.getInt("total_sentence"));
                row.put("jail_code", rst.getInt("jail_code"));
                row.put("deleted", rst.getInt("deleted"));

                criminalList.add(row);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return criminalList;
    }
    
    /**
     * @param mode refers to the column you want to get the max value of
     *             1 - criminal_code
     *             2 - total_sentence
     *             3 - jail_code
     *             4 - crime_code
     * @return the max value of the specified column
     */
    public int getMax(int mode){
        Connection conn = connect();
        
        if(conn == null){
            System.out.println("Failed to connect to server");
            return -1;
        }
        
        PreparedStatement pstmt = null;
        try {
            switch(mode){
                case 1:
                    pstmt = conn.prepareStatement(
                    "SELECT MAX(criminal_code) as maxVal FROM criminals"); 
                    break;
                case 2:
                    pstmt = conn.prepareStatement(
                    "SELECT MAX(total_sentence) as maxVal FROM criminals"); 
                    break;
                case 3:
                    pstmt = conn.prepareStatement(
                    "SELECT MAX(jail_code) as maxVal FROM criminals"); 
                    break;
                case 4:
                    pstmt = conn.prepareStatement(
                    "SELECT MAX(crime_code) as maxVal FROM crimes"); 
                    break;
            }
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()){
                return rst.getInt("maxVal");
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
        return -1;
    }
    
    public List<Map<String, Object>> relatedCrimes() {
        List<Map<String, Object>> criminalList = new ArrayList<>();
        Connection conn = connect();

        if (conn == null) {
            System.out.println("Failed to connect to server");
            return criminalList;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM crimes WHERE criminal_code = ? AND deleted = 0");
            pstmt.setInt(1, criminal_code);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("crime_code", rst.getInt("crime_code"));
                row.put("crime_type", rst.getString("crime_type"));
                row.put("badge_number", rst.getString("badge_number"));
                row.put("date_committed", rst.getString("date_committed"));
                row.put("sentence", rst.getInt("sentence"));
                row.put("criminal_code", rst.getInt("criminal_code"));
                
                criminalList.add(row);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return criminalList;
    }
    
    public List<Map<String, Object>> criminalReport(int year) {
        List<Map<String, Object>> reportList = new ArrayList<>();
        Connection conn = connect();

        if (conn == null) {
            System.out.println("Failed to connect to server");
            return reportList;
        }

        PreparedStatement pstmt = null;
        ResultSet rst = null;

        try {
            pstmt = conn.prepareStatement("SELECT MONTHNAME(date_committed) AS crimeMonth, "
                                           + "MONTH(date_committed) AS monthNumber, "
                                           + "COUNT(criminal_code) AS totalCriminals "
                                           + "FROM crimes WHERE YEAR(date_committed) = ? AND deleted=0 "
                                           + "GROUP BY crimeMonth, monthNumber "
                                           + "ORDER BY monthNumber");
            pstmt.setInt(1, year);
            rst = pstmt.executeQuery();

            while (rst.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("crimeMonth", rst.getString("crimeMonth"));
                row.put("totalCriminals", rst.getInt("totalCriminals"));
                
                reportList.add(row);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rst != null) rst.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return reportList;
    }
}