<%-- 
    Document   : view_officer_history
    Created on : Nov 17, 2024, 10:12:15 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Officer History</title>
    </head>
    <body>
        <h2>View Officer History</h2>
        <%
            String officerBadgeNumber = request.getParameter("badge_number");

            if (officerBadgeNumber != null) {
                try {
                    int badgeNumber = Integer.parseInt(officerBadgeNumber); 
                    Officer officer = new Officer();
                    officer.badge_number = badgeNumber;
                    int check = officer.checkExists();

                    if (check == 1) {
                        OfficerHistory oh = new OfficerHistory();
                        oh.badge_number = badgeNumber;
                        List<String[]> result = oh.getOfficerHistory(); 

                        out.println("<p>Showing results for officer with badge number: " + badgeNumber +"</p>");
                        if (result == null || result.isEmpty()){
                            out.println("<p>Officer has no past assignment history.</p>");
                        } else {
                            out.println("<table border='1'>");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th>Badge Number</th><th>Jail Code</th><th>Start Date</th><th>End Date</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                            for (String[] record : result) {
                                out.println("<tr>");
                                out.println("<td>" + record[0] + "</td>");
                                out.println("<td>" + record[1] + "</td>");
                                out.println("<td>" + record[2] + "</td>");
                                out.println("<td>" + record[3] + "</td>");
                                out.println("</tr>");
                            }
                            out.println("</tbody>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<p>Officer with badge number " + badgeNumber + " does not exist.</p>");
                        out.println("<p><a href='add_officer.html'>Click here to add the officer</a></p>");
                    }

                } catch (NumberFormatException e) {
                    out.println("<p>Invalid input format. Please enter a valid badge number.</p>");
                }
            } else {
                out.println("<p>Badge number is required to view officer history.</p>");
            }
        %>
    </body>
</html>