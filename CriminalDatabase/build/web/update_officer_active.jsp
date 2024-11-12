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
            String activeStatus = request.getParameter("active_status");
            
            if (sBadgeNum != null) {
                try {
                    int badgeNum = Integer.parseInt(sBadgeNum);
                    
                    if (activeStatus.equals("T")){
                        Officer officer = new Officer();
                        
                        officer.badge_number = badgeNum;
                        officer.jail_code = -1;
                        officer.active = "F";
                        int changeResult = officer.changeOfficerActive();

                        OfficerHistory oh = new OfficerHistory();
                        oh.badge_number = badgeNum;
                        int ohResult =  oh.removeCurrentAssignment();
                        
                        if (changeResult == 1 && ohResult == 1){
                            String result[] = officer.retrieveOfficer();    
                            out.println("<p>Success</p>");
                            
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
                        // currently inactive
                        String sJailCode = request.getParameter("jail_code");
                    
                        if (sJailCode != null){
                            int jailCode = Integer.parseInt(sJailCode);
                        
                            Officer officer = new Officer();
                            officer.badge_number = badgeNum;
                            officer.jail_code = jailCode;
                            officer.active = "T";
                            int activateRes = officer.changeOfficerActive();
                            
                            OfficerHistory oh = new OfficerHistory();
                            oh.badge_number = badgeNum;
                            oh.jail_code = jailCode;
                            int ohResult =  oh.createNewAssignment();

                            if (activateRes == 1 && ohResult == 1) {
                                String result[] = officer.retrieveOfficer();    
                                out.println("<p>Success</p>");

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
                            out.println("<p>All fields are required.</p>");
                        }
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
