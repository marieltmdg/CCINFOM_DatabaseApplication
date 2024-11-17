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
        <title>Delete Officer</title>
    </head>
    <body>
        <h2>Delete Crime</h2>
        <%
            String sBadgeNumber = request.getParameter("badge_number");

            if (sBadgeNumber != null) {
                try {
                    int badgeNum = Integer.parseInt(sBadgeNumber);
                    Officer o = new Officer();
                    o.badge_number = badgeNum;
                    int result = o.deleteOfficerAndHistory();
                    
                    if (result ==  1) {
                        out.println("<p>Officer deleted successfully!</p>");
                    } else {
                        out.println("<p>Failed to delete officer. Please check the badge number.</p>");
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
