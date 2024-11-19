<%-- 
    Document   : view_officer
    Created on : Nov 17, 2024, 9:53:46 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>View Officer Record</title>
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
            <p class="main-text" id="garamond">View Officer Record</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <% 
                    String officerBadgeNumber = request.getParameter("officer_badgeNumber");

                    if (officerBadgeNumber != null) {
                        try {
                            int badgeNumber = Integer.parseInt(officerBadgeNumber);
                            Officer officer = new Officer();
                            officer.badge_number = badgeNumber;
                            int check = officer.checkExists();

                            if (check == 1) {
                                String[] result = officer.retrieveOfficer();
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Officer Record Exists</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Badge Number:</td><td>" + badgeNumber + "</td></tr>");
                                out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                out.println("<tr><td>Start Date of Assignment:</td><td>" + result[3] + "</td></tr>");
                                out.println("<tr><td>Active:</td><td>" + result[4] + "</td></tr>");
                                out.println("<tr><td>Jail Code:</td><td>" + result[5] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                // Redirect to add officer
                                out.println("<table>");
                                out.println("<tr><td>Officer Record Not Found</td></tr>");
                                out.println("<form action='add_officer.html' method='post'>");
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Add Officer' id='roboto' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
                                out.println("</table>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format. Please enter a valid badge number.</td></tr>");
                            out.println("</table>");}
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2' style='color: white; text-align: center;'>All Fields Are Required.</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
