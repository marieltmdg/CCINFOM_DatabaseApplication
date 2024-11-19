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

                    if (officerFirstName != null && officerLastName != null
                        && stringJailCode != null) {
                        try {
                            int jailCode = Integer.parseInt(stringJailCode);

                            Officer officer = new Officer();
                            officer.first_name = officerFirstName;
                            officer.last_name = officerLastName;
                            officer.jail_code = jailCode;
                            int badgeNumber = officer.registerNewOfficer();

                            if (badgeNumber >= 0) {
                                String[] result = officer.retrieveOfficer();
                                out.println("<p>Success.</p>");
                                out.println("<p>Details: </p>");
                                out.println("<p>Badge Number: " + badgeNumber +"</p>");
                                out.println("<p>First Name: " + result[1] +"</p>");
                                out.println("<p>Last Name: " + result[2] +"</p>");
                                out.println("<p>Start Date of Assignment: " + result[3] +"</p>");
                                out.println("<p>Active: " + result[4] +"</p>");
                                out.println("<p>Jail Code: " + result[5] +"</p>");
                            } else if (badgeNumber == -2){
                                    out.println("<p>Jail does not exist.</p>");
                            }else {
                                out.println("<p>Creation Unsuccessful.</p>");
                            }

                        } catch (NumberFormatException e) {
                            out.println("<p>Invalid input format. Please enter valid numbers.</p>");
                        }
                    } else {
                        out.println("<p>All fields are required.</p>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>