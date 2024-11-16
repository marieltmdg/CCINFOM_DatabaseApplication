<%-- 
    Document   : update_officer_jailCode
    Created on : Nov 5, 2024, 8:14:22 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.text.SimpleDateFormat"%>
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
                    int newjailCode = Integer.parseInt(sJailCode);
                    
                    if (activeStatus.equals("T")){
                        Officer officer = new Officer();
                        officer.badge_number = badgeNum;
                        String result[] = officer.retrieveOfficer();
                        
                        // record history
                        OfficerHistory oh = new OfficerHistory();
                        oh.badge_number = badgeNum;
                        oh.jail_code = Integer.parseInt(result[4]);
                        String dateStr = result[5];
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date utilDate = sdf.parse(dateStr); 
                        oh.start_date = new java.sql.Date(utilDate.getTime()); 
                        
                        int ohResult =  oh.recordCurrentAssignment();
                        
                        officer.jail_code = newjailCode;
                        int changeResult = officer.changeOfficerJailCode();
                        
                        if (changeResult == 1 && ohResult == 1){      
                            out.println("<p>Success</p>");    
                        
                            result = officer.retrieveOfficer();
                            out.println("<p>Updated Details</p>");
                            out.println("<p>Badge Number: " + result[0] +"</p>");
                            out.println("<p>First Name: " + result[1] +"</p>");
                            out.println("<p>Last Name: " + result[2] +"</p>");
                            out.println("<p>Active: " + result[3] +"</p>");
                            out.println("<p>Jail Code: " + result[4] +"</p>");
                            out.println("<p>Start Date of Assignment: " + result[5] +"</p>");

                        } else if (changeResult == -2){
                            out.println("<p>Jail does not exist.</p>");
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
