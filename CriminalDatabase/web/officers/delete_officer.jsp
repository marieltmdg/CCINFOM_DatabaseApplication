<%-- 
    Document   : delete_officer
    Created on : Nov 17, 2024, 5:53:01 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Delete Officer Record</title>
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
            <p class="main-text" id="garamond">Delete Officer Record</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <% 
                    String sBadgeNumber = request.getParameter("badge_number");

                    if (sBadgeNumber != null) {
                        try {
                            int badgeNum = Integer.parseInt(sBadgeNumber);
                            Officer officer = new Officer();
                            officer.badge_number = badgeNum;

                            String[] result = officer.retrieveOfficer();

                            if (result != null) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Are you sure you want to delete this officer?</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td><strong>Badge Number:</strong></td><td>" + badgeNum + "</td></tr>");
                                out.println("<tr><td><strong>First Name:</strong></td><td>" + result[1] + "</td></tr>");
                                out.println("<tr><td><strong>Last Name:</strong></td><td>" + result[2] + "</td></tr>");
                                out.println("<tr><td><strong>Start Date of Assignment:</strong></td><td>" + result[3] + "</td></tr>");
                                out.println("<tr><td><strong>Active Status:</strong></td><td>" + result[4] + "</td></tr>");
                                out.println("<tr><td><strong>Jail Code:</strong></td><td>" + result[5] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                                out.println("<form action='delete_officer_confirm.jsp' method='POST'>");
                                out.println("<input type='hidden' name='badge_number' value='" + badgeNum + "'/>");
                                out.println("<button class='button' id='roboto' type='submit' style='margin-top: 2vh;  margin-bottom: 0px; width: 20%;'>Confirm Deletion</button>");
                                out.println("</form>");
                            } else {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Officer Not Found</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td colspan='2'>No officer found with Badge Number: " + badgeNum + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            }

                        } catch (NumberFormatException e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format. Please enter a valid badge number.</td></tr>");
                            out.println("</table>");
                        }
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
