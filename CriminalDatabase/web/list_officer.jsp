<%-- 
    Document   : list_officers
    Created on : Nov 17, 2024, 10:36:19 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Officers</title>
    </head>
    <body>
        <h2>List Officers</h2>
        <%
            String active = request.getParameter("active");

            if (active != null) {
                try {
                    Officer officer = new Officer();
                    List<String[]> officers = officer.getOfficersByActiveStatus(active);
                    
                    if (officers == null || officers.isEmpty()) {
                        out.println("<p>No officers found with the status: " + active + "</p>");
                    } else {
                        out.println("<table border='1'>");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th>Badge Number</th><th>First Name</th><th>Last Name</th><th>Start Date</th><th>Active</th><th>Jail Code</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                        
                        for (String[] officerData : officers) {
                            out.println("<tr>");
                            out.println("<td>" + officerData[0] + "</td>");
                            out.println("<td>" + officerData[1] + "</td>");
                            out.println("<td>" + officerData[2] + "</td>");
                            out.println("<td>" + officerData[3] + "</td>");
                            out.println("<td>" + officerData[4] + "</td>");
                            out.println("<td>" + officerData[5] + "</td>");
                            out.println("</tr>");
                        }
                        
                        out.println("</table>");
                    }
                    
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input format. Please enter valid characters.</p>");
                }
            } else {
                out.println("<p>All fields are required.</p>");
            }
        %>
    </body>
</html>
