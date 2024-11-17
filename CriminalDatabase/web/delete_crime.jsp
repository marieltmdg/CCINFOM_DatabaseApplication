<%-- 
    Document   : delete_crime
    Created on : Nov 16, 2024, 8:42:59 PM
    Author     : paolocruzado
--%>
<%@ page import="criminalmanagement.Crimes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Delete Crime</h2>
        <%
            String crimeCodeStr = request.getParameter("crime_code");

            if (crimeCodeStr != null) {
                try {
                    int crimeCode = Integer.parseInt(crimeCodeStr);
                    Crimes crime = new Crimes();
                    crime.crime_code = crimeCode;

                    boolean success = crime.deleteCrime();
                    if (success) {
                        out.println("<p>Crime deleted successfully!</p>");
                    } else {
                        out.println("<p>Failed to delete crime. Please check the crime code.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input. Please enter a valid crime code.</p>");
                }
            } else {
                out.println("<p>Crime code is required.</p>");
            }
        %>
    </body>
</html>
