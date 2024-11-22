<%-- 
    Document   : view_officer_history
    Created on : Nov 17, 2024, 10:12:15 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Officer History</title>
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        
        <div class="bg-image">
            <img src="../src/vigan.jpg" alt="Background Image">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="../src/pnp-logo.png" class="logo" alt="PNP Logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">View Officer History</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
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

                                out.println("<p></p>");
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr>");
                                out.println("<th colspan='4'>Showing results for [Badge Number: " + badgeNumber + "] </strong></th>");
                                out.println("</tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                
                                if (result == null || result.isEmpty()){
                                    out.println("<table>");
                                    out.println("<tr><td colspan='4' class='no-data'>Officer Has No Past Assignment History</td></tr>");
                                    out.println("</table>");
                                } else {
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
                                // Redirect to add officer
                                out.println("<table>");
                                out.println("<tr><td>Officer Record Not Found</td></tr>");
                                out.println("</table>");
                                out.println("<form action='add_officer.html' method='post'>");
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Add Officer' id='roboto' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
                            }

                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid input format. Please enter a valid number.'); window.location.href = 'view_officer_history.html';</script>");
                        }
                    } else {
                        out.println("<p></p>");
                        out.println("<table>");
                        out.println("<tr><td colspan='4' class='no-data'>All Fields Are Required</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>