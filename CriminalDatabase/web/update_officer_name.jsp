<%-- 
    Document   : update_officer_name
    Created on : Nov 17, 2024, 9:58:59 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Officer Name</title>
    </head>
    <body>
        <h2>Update Officer Name</h2>
        <%
            String officerBadgeNumber = request.getParameter("badge_number");
            String newFirstName = request.getParameter("first_name");
            String newLastName = request.getParameter("last_name");

            if (officerBadgeNumber != null) {
                try {
                    int badgeNumber = Integer.parseInt(officerBadgeNumber);
                    Officer officer = new Officer();
                    officer.badge_number = badgeNumber;
                    int check = officer.checkExists();

                    if (check == 1) {
                        // Check if user provided new names, and update accordingly
                        if (newFirstName != null && !newFirstName.isEmpty()) {
                            officer.first_name = newFirstName;
                        }
                        if (newLastName != null && !newLastName.isEmpty()) {
                            officer.last_name = newLastName;
                        }

                        int updateResult = officer.updateOfficerName();
                        if (updateResult == 1) {
                            out.println("<p>Officer name updated successfully.</p>");
                            
                            String[] result = officer.retrieveOfficer();
                            out.println("<p>Details: </p>");
                            out.println("<p>Badge Number: " + badgeNumber +"</p>");
                            out.println("<p>First Name: " + result[1] +"</p>");
                            out.println("<p>Last Name: " + result[2] +"</p>");
                            out.println("<p>Active: " + result[3] +"</p>");
                            out.println("<p>Jail Code: " + result[4] +"</p>");
                            out.println("<p>Start Date of Assignment: " + result[5] +"</p>");
                        } else {
                            out.println("<p>Failed to update officer name.</p>");
                        }
                    } else {
                        out.println("<p>Officer does not exist.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input format. Please enter a valid number for the badge number.</p>");
                }
            } else {
                out.println("<p>Badge number is required.</p>");
            }
        %>
    </body>
</html>
