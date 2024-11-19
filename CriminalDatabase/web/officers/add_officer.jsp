<%-- 
    Document   : add_officer
    Created on : Nov 5, 2024, 7:54:27 PM
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
        <title>Create a New Officer</title>
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
            <p class="main-text" id="garamond">Create a New Officer</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <% 
                    String officerFirstName = request.getParameter("first_name");
                    String officerLastName = request.getParameter("last_name");
                    String stringJailCode = request.getParameter("jail_code");

                    if (officerFirstName != null && officerLastName != null && stringJailCode != null) {
                        try {
                            int jailCode = Integer.parseInt(stringJailCode);

                            Officer officer = new Officer();
                            officer.first_name = officerFirstName;
                            officer.last_name = officerLastName;
                            officer.jail_code = jailCode;
                            int badgeNumber = officer.registerNewOfficer();

                            if (badgeNumber >= 0) {
                                String[] result = officer.retrieveOfficer();
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Success! Officer created successfully.</th></tr>");
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
                            } else if (badgeNumber == -2) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Officer Not Created</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td colspan='2'>Jail does not exist.</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Creation Unsuccessful</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td colspan='2'>Please try again.</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            }

                        } catch (NumberFormatException e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format. Please enter a valid badge number.</td></tr>");
                            out.println("</table>");}
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2' style='color: red; text-align: center;'>All fields are required.</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
