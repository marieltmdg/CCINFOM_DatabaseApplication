<%-- 
    Document   : update_officer
    Created on : Nov 17, 2024, 9:50:25 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Officer Record</title>
    </head>
    <body>
        <%
            String officerBadgeNumber = request.getParameter("badge_number");

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
                        out.println("<p>Leave blank for fields that will not change</p>");
                        
                        out.println("<form action='update_officer_name.jsp' method='post'>");
                        out.println("<input type='hidden' name='badge_number' value='" + badgeNumber + "'>");
                        out.println("<label for='first_name'>First Name: </label>");
                        out.println("<input type='text' id='first_name' name='first_name'<br>");
                        out.println("<label for='last_name'>Last Name: </label>");
                        out.println("<input type='text' id='last_name' name='last_name'<br>");
                        out.println("<input type='submit' value='Update Name'>");
                        out.println("</form>");
                        
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
