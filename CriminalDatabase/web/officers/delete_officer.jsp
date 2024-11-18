<%-- 
    Document   : delete_officer
    Created on : Nov 17, 2024, 5:53:01 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Officer Record</title>
    </head>
    <body>
        <h2>Delete Officer Record</h2>
        <%
            String sBadgeNumber = request.getParameter("badge_number");

            if (sBadgeNumber != null) {
                try {
                    int badgeNum = Integer.parseInt(sBadgeNumber);
                    Officer officer = new Officer();
                    officer.badge_number = badgeNum;

                    String[] result = officer.retrieveOfficer();
                    
                    if (result != null) {
                        out.println("<h3>Officer Details</h3>");
                        out.println("<p><strong>Badge Number:</strong> " + badgeNum + "</p>");
                        out.println("<p><strong>First Name:</strong> " + result[1] + "</p>");
                        out.println("<p><strong>Last Name:</strong> " + result[2] + "</p>");
                        out.println("<p><strong>Start Date of Assignment:</strong> " + result[3] + "</p>");
                        out.println("<p><strong>Active Status:</strong> " + result[4] + "</p>");
                        out.println("<p><strong>Jail Code:</strong> " + result[5] + "</p>");
                        out.println("<form action='confirm_delete_officer.jsp' method='POST'>");
                        out.println("<input type='hidden' name='badge_number' value='" + badgeNum + "'/>");
                        out.println("<p>Are you sure you want to delete this officer?</p>");
                        out.println("<input type='submit' value='Confirm Deletion' />");
                        out.println("</form>");
                    } else {
                        out.println("<p>No officer found with Badge Number: " + badgeNum + "</p>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input format. Please enter a valid badge number.</p>");
                }
            }
        %>
    </body>
</html>
