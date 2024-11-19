<%-- 
    Document   : update_officer_active
    Created on : Nov 5, 2024, 8:14:11 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Change Officer Active Status</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="bg-image">
            <img src="../src/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="../src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">Change Officer Active Status</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    String sBadgeNum = request.getParameter("badge_number");
                    String activeStatus = request.getParameter("active_status");

                    if (sBadgeNum != null) {
                        try {
                            int badgeNum = Integer.parseInt(sBadgeNum);

                            if (activeStatus.equals("T")){
                                Officer officer = new Officer();
                                officer.badge_number = badgeNum;
                                String result[] = officer.retrieveOfficer();

                                // record history
                                OfficerHistory oh = new OfficerHistory();
                                oh.badge_number = badgeNum;
                                oh.jail_code = Integer.parseInt(result[5]);

                                String dateStr = result[3];
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                java.util.Date utilDate = sdf.parse(dateStr); 
                                oh.start_date = new java.sql.Date(utilDate.getTime()); 

                                int ohResult =  oh.recordCurrentAssignment();

                                // change active
                                officer.jail_code = -1;
                                officer.active = "F";
                                int changeResult = officer.changeOfficerActive();

                                if (changeResult == 1 && ohResult == 1){
                                    result = officer.retrieveOfficer();    
                                    out.println("<table>");
                                    out.println("<thead>");
                                    out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Success! Officer Active Status Updated.</th></tr>");
                                    out.println("</thead>");
                                    out.println("<tbody>");
                                    out.println("<tr><td>Badge Number:</td><td>" + result[0] + "</td></tr>");
                                    out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                    out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                    out.println("<tr><td>Start Date of Assignment:</td><td>" + result[3] + "</td></tr>");
                                    out.println("<tr><td>Active:</td><td>" + result[4] + "</td></tr>");
                                    out.println("<tr><td>Jail Code:</td><td>" + result[5] + "</td></tr>");
                                    out.println("</tbody>");
                                    out.println("</table>");

                                } else {
                                    out.println("<table>");
                                    out.println("<tr><td colspan='2'>Update Unsuccessful.</td></tr>");
                                    out.println("</table>");
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

                                    if (activateRes == 1) {
                                        String result[] = officer.retrieveOfficer();    
                                        out.println("<table>");
                                        out.println("<thead>");
                                        out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Success! Officer active status updated.</th></tr>");
                                        out.println("</thead>");
                                        out.println("<tbody>");
                                        out.println("<tr><td>Badge Number:</td><td>" + result[0] + "</td></tr>");
                                        out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                        out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                        out.println("<tr><td>Start Date of Assignment:</td><td>" + result[3] + "</td></tr>");
                                        out.println("<tr><td>Active:</td><td>" + result[4] + "</td></tr>");
                                        out.println("<tr><td>Jail Code:</td><td>" + result[5] + "</td></tr>");
                                        out.println("</tbody>");
                                        out.println("</table>");

                                    } else if (activateRes == -2){
                                        out.println("<table>");
                                        out.println("<tr><td colspan='2'>Jail Does Not Exist.</td></tr>");
                                        out.println("</table>");
                                    } else {
                                        out.println("<table>");
                                        out.println("<tr><td colspan='2'>Update Unsuccessful.</td></tr>");
                                        out.println("</table>");
                                    }
                                } else {
                                    out.println("<table>");
                                    out.println("<tr><td colspan='2'>All fields are required.</td></tr>");
                                    out.println("</table>");
                                }
                            }

                        } catch (NumberFormatException e) {
                            out.println("<table>");
                            out.println("<tr><td colspan='2'>Invalid input format. Please enter valid numbers.</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2'>All fields are required.</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>

