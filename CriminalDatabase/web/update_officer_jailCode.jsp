<%-- 
    Document   : update_officer_jailCode
    Created on : Nov 5, 2024, 8:14:22 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Officer Jail Code</title>
    </head>
    <body>
        <%
            String sBadgeNum = request.getParameter("badge_number");
            String activeStatus = request.getParameter("active_status");
            String sJailCode = request.getParameter("jail_code");
            
            if (sBadgeNum != null) {
                try {
                    int badgeNum = Integer.parseInt(sBadgeNum);
                    int jailCode = Integer.parseInt(sJailCode);
                    
                    if (activeStatus.equals("T")){
                        Officer officer = new Officer();
                        officer.jail_code = jailCode;
                        officer.badge_number = badgeNum;
                        int changeResult = officer.changeOfficerJailCode();

                        OfficerHistory oh = new OfficerHistory();
                        oh.jail_code = jailCode;
                        oh.badge_number = badgeNum;
                        int ohResult =  oh.createNewAssignment();
                        
                        if (changeResult == 1 && ohResult == 1){      
                            out.println("<p>Success</p>");    
                        
                            String result[] = officer.retrieveOfficer();
                            out.println("<p>Updated Details</p>");
                            out.println("<p>Badge Number: " + result[0] +"</p>");
                            out.println("<p>First Name: " + result[1] +"</p>");
                            out.println("<p>Last Name: " + result[2] +"</p>");
                            out.println("<p>Years Of Service: " + result[3] +"</p>");
                            out.println("<p>Active: " + result[4] +"</p>");
                            out.println("<p>Jail Code: " + result[5] +"</p>");

                        } else {
                            out.println("<p>Update Unsuccessful.</p>");
                        }               
                        
                    } else {
                        out.println("<p>Officer currently inactive.</p>");
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
