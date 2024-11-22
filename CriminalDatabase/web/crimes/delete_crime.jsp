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
                        out.println("<script>alert('Crime deleted successfully!'); window.location.href = '../index.html';</script>");
                    } else {
                        out.println("<script>alert('Failed to delete crime. Please check the crime code.'); window.location.href = '../index.html';</script>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Invalid input. Please enter a valid crime code.'); window.location.href = '../index.html';</script>");
                }
            } else {
                out.println("<script>alert('Crime code is required.'); window.location.href = '../index.html';</script>");
            }
        %>
    </body>
</html>
