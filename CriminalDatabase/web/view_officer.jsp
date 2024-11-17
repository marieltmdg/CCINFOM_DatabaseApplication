<%-- 
    Document   : view_officer
    Created on : Nov 17, 2024, 9:53:46 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Officer</title>
    </head>
    <body>
        <h2>View Officer</h2>
        <%
            String officerBadgeNumber = request.getParameter("officer_badgeNumber");

            if (officerBadgeNumber != null) {
                try {
                    int badgeNumber = Integer.parseInt(officerBadgeNumber);
                    Officer officer = new Officer();
                    officer.badge_number = badgeNumber;
                    int check = officer.checkExists();

                    if (check == 1) {
                        String[] result = officer.retrieveOfficer();
                    
                        out.println("<p>Officer Record Exists.</p>");
                        out.println("<p>Details</p>");
                        out.println("<p>Badge Number: " + badgeNumber +"</p>");
                        out.println("<p>First Name: " + result[1] +"</p>");
                        out.println("<p>Last Name: " + result[2] +"</p>");
                        out.println("<p>Active: " + result[3] +"</p>");
                        out.println("<p>Jail Code: " + result[4] +"</p>");
                        out.println("<p>Start Date of Assignment: " + result[5] +"</p>");
                    } else {
                        // redirect to add officer
                        out.println("<p>Officer does not exist</p>");
                        out.println("<form action ='add_officer.html' method='post'>");
                        out.println("<input type='submit' value='Add officer'>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input format. Please enter valid numbers.</p>");
                }
            } else {
                out.println("<p>All fields are required.</p>");
            }
        %>
    </body>
</html>
