<%-- 
    Document   : add_officer
    Created on : Nov 5, 2024, 7:54:27 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a New Officer</title>
    </head>
    <body>
        <h2>Create New Officer Record</h2>
        <%
            String officerFirstName = request.getParameter("first_name");
            String officerLastName = request.getParameter("last_name");
            String stringJailCode = request.getParameter("jail_code");

            if (officerFirstName != null && officerLastName != null
                && stringJailCode != null) {
                try {
                    int jailCode = Integer.parseInt(stringJailCode);
                    
                    Officer officer = new Officer();
                    officer.first_name = officerFirstName;
                    officer.last_name = officerLastName;
                    officer.jail_code = jailCode;
                    int badgeNumber = officer.registerNewOfficer();
                    OfficerHistory oh = new OfficerHistory();
                    oh.badge_number = badgeNumber;
                    oh.jail_code = jailCode;
                    int historyResult = oh.createNewAssignment();
                    
                    if (badgeNumber >= 0 && historyResult == 1) {
                        String[] result = officer.retrieveOfficer();
                        out.println("<p>Success.</p>");
                        out.println("<p>Details: </p>");
                        out.println("<p>Badge Number: " + badgeNumber +"</p>");
                        out.println("<p>First Name: " + result[1] +"</p>");
                        out.println("<p>Last Name: " + result[2] +"</p>");
                        out.println("<p>Years Of Service: " + result[3] +"</p>");
                        out.println("<p>Active: " + result[4] +"</p>");
                        out.println("<p>Jail Code: " + result[5] +"</p>");
                    } else {
                        out.println("<p>Creation Unsuccessful.</p>");
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

