<%-- 
    Document   : retrieve_officer
    Created on : Nov 5, 2024, 1:35:18 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reassign Officer</title>
    </head>
    <body> 
        <h2>Reassign Officer</h2>
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
                        out.println("<p>Start Date of Assignment: " + result[3] +"</p>");
                        out.println("<p>Active: " + result[4] +"</p>");
                        out.println("<p>Jail Code: " + result[5] +"</p>");
                        out.println("<p>Update Active or Update Jail Code?</p>");
                        
                        // active
                        if (result[4].equals("T")) {
                            out.println("<form action='reassign_officer_jailCode.jsp' method='post'>");
                            out.println("<input type='hidden' name='badge_number' value='" + badgeNumber + "'>");
                            out.println("<input type='hidden' name='active_status' value='" + result[4] + "'>");
                            out.println("<label for='jail_code'>New Jail Code:</label>");
                            out.println("<input type='text' id='jail_code' name='jail_code' required><br>");
                            out.println("<input type='submit' value='Update Jail Code'>");
                            out.println("</form>");
                        } else {
                            out.println("<p>Officer currently inactive. Cannot change jail code.</p>");
                        }

                        out.println("<form action='reassign_officer_active.jsp' method='post'>");
                        out.println("<input type='hidden' name='badge_number' value='" + badgeNumber + "'>");
                        out.println("<input type='hidden' name='active_status' value='" + result[4] + "'>");
                        if (result[4].equals("F")){
                            out.println("<label for='jail_code'>New Jail Code:</label>");
                            out.println("<input type='text' id='jail_code' name='jail_code' required><br>");
                        }
                        out.println("<input type='submit' value='Update Active'>");
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
