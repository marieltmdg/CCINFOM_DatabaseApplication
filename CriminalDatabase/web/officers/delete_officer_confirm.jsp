<%-- 
    Document   : confirm_delete_officer
    Created on : Nov 18, 2024, 1:17:48 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Delete</title>
    </head>
    <body>
        <h2>Delete Officer Record</h2>
        <%
            String badgeNumber = request.getParameter("badge_number");
            if (badgeNumber != null) {
                try {
                    int badgeNum = Integer.parseInt(badgeNumber);
                    Officer officer = new Officer();
                    officer.badge_number = badgeNum;
                    int result = officer.deleteOfficerAndHistory(); 

                    if (result == 1) {
                        out.println("<p>Officer deleted successfully.</p>");
                    } else {
                        out.println("<p>Failed to delete officer. Please check the badge number or officer status.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Badge number is required.</p>");
            }
            
            %>
    </body>
</html>
