<%-- 
    Document   : update_officer_active
    Created on : Nov 5, 2024, 8:14:11 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Officer Activity Status</title>
    </head>
    <body>
        <h2>Update Officer Activity Status</h2>
        <%
            String sBadgeNum = request.getParameter("badge_number");
            
            if (sBadgeNum != null) {
                try {
                    int badgeNum = Integer.parseInt(sBadgeNum);
                    
                    Officer officer = new Officer();
                    officer.badge_number = badgeNum;
                    int deactivateRes = officer.changeOfficerActive();
                    
                    OfficerHistory oh = new OfficerHistory();
                    oh.badge_number = badgeNum;
                    int ohResult =  oh.toggleInactive();

                    if (deactivateRes == 1 && ohResult == 1) {
                        out.println("<p>Success.</p>");
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
