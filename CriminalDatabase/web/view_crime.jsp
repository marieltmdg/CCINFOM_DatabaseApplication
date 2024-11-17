<%-- 
    Document   : view_crime
    Created on : Nov 16, 2024, 8:41:56 PM
    Author     : paolocruzado
--%>
<%@ page import="criminalmanagement.Crimes" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>View Crime</h2>
        <%
            String crimeCodeStr = request.getParameter("crime_code");

            if (crimeCodeStr != null) {
                try {
                    int crimeCode = Integer.parseInt(crimeCodeStr);
                    Crimes crime = new Crimes();
                    crime.crime_code = crimeCode;

                    ResultSet rst = crime.viewCrime();
                    if (rst != null && rst.next()) {
                        out.println("<p>Crime Code: " + rst.getInt("Crime_Code") + "</p>");
                        out.println("<p>Crime Type: " + rst.getString("Crime_Type") + "</p>");
                        out.println("<p>Badge Number: " + rst.getString("Badge_Number") + "</p>");
                        out.println("<p>Date Committed: " + rst.getString("Date_Committed") + "</p>");
                        out.println("<p>Sentence: " + rst.getInt("Sentence") + "</p>");
                        out.println("<p>Criminal Code: " + rst.getInt("Criminal_Code") + "</p>");
                    } else {
                        out.println("<p>Crime not found.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input. Please enter a valid crime code.</p>");
                } catch (SQLException e) {
                    out.println("<p>Error retrieving crime: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Crime code is required.</p>");
            }
        %>
    </body>
</html>
