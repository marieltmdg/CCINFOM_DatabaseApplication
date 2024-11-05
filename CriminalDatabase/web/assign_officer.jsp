<%-- 
    Document   : assign_officer
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
        <title>Assign or Reassign Officer</title>
    </head>
    <body>
        <h2>Assignment Result (Assuming Existing)</h2>
    <%
        String officerBadgeNumber = request.getParameter("officer_badgeNumber");
        String jailCode = request.getParameter("jail_code");

        if (officerBadgeNumber != null && jailCode != null) {
            try {
                int badgeNumber = Integer.parseInt(officerBadgeNumber);
                int jailCodeInt = Integer.parseInt(jailCode);

                Officer officer = new Officer();
                officer.badge_number = badgeNumber;
                officer.jail_code = jailCodeInt;
                int result = officer.assignExistingOfficer();

                if (result == 1) {
                    out.println("<p>New officer successfully assigned to jail.</p>");
                } else {
                    out.println("<p>Assignment failed. Officer or jail may not exist.</p>");
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
