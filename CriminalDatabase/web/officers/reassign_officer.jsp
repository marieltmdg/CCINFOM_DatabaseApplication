<%-- 
    Document   : retrieve_officer
    Created on : Nov 5, 2024, 1:35:18 PM
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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reassign Officer</title>
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
            <p class="main-text" id="garamond">Reassign Officer</p>
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
                            int check = officer.checkExistsAndNotDeleted();

                            if (check == 1) {
                                String[] result = officer.retrieveOfficer();
                                
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Officer Details</th></tr>");
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

                                out.println("<table>");
                                out.println("<tr><td>Update Active or Update Jail Code?</td></tr>");
                                out.println("</table>");

                                // If the officer is active, allow jail code update
                                if (result[4].equals("T")) {
                                    out.println("<form action='reassign_officer_jailCode.jsp' method='post'>");
                                    out.println("<input type='hidden' name='badge_number' value='" + badgeNumber + "'>");
                                    out.println("<input type='hidden' name='active_status' value='" + result[4] + "'>");
                                    out.println("<tr><td><label for='jail_code' class='form-label'>New Jail Code:</label></td>");
                                    out.println("<td><input type='text' id='jail_code' name='jail_code' class='form-input' required></td></tr>");
                                    out.println("<div class='button-container'>");
                                    out.println("<input type='submit' value='Update Jail Code' class='button'>");
                                    out.println("</div>");
                                    out.println("</form>");
                                } else {
                                    out.println("<table>");
                                    out.println("<tr><td>Officer currently inactive. Cannot change jail code.</td></tr>");
                                    out.println("</table>");
                                }

                                // Form to update active status
                                out.println("<form action='reassign_officer_active.jsp' method='post'>");
                                out.println("<input type='hidden' name='badge_number' value='" + badgeNumber + "'>");
                                out.println("<input type='hidden' name='active_status' value='" + result[4] + "'>");
                                if (result[4].equals("F")) {
                                    out.println("<tr><td><label for='jail_code' class='form-label'>New Jail Code:</label></td>");
                                    out.println("<td><input type='text' id='jail_code' name='jail_code' class='form-input' required></td></tr>");
                                }
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Update Active' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
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
                            out.println("<script>alert('Invalid input format. Please enter a valid number.'); window.location.href = 'reassign_officer.html';</script>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td>All Fields are Required.</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            
            </div>
        </div>
    </body>
</html>
