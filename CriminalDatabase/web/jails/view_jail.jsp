<%-- 
    Document   : view_jail
    Created on : Nov 17, 2024, 9:01:22 PM
    Author     : nathanaelian
--%>

<%@ page import="criminalmanagement.*" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>View Jail</title>
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
            <p class="main-text" id="garamond">View Jail</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String jailCodeStr = request.getParameter("jail_code");

                    if (jailCodeStr != null) {
                        try {
                            int jailCode = Integer.parseInt(jailCodeStr);
                            Jails jail = new Jails();
                            jail.jail_code = jailCode;

                            String[] res = jail.retrieveJail();
                            if (res != null) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Jail Record Exists</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Jail Code:</td><td>" + res[0] + "</td></tr>");
                                out.println("<tr><td>Area of Jurisdiction:</td><td>" + res[1] + "</td></tr>");
                                out.println("<tr><td>Start Date:</td><td>" + res[2] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<table>");
                                out.println("<tr><td>Jail Does Not Exist</td></tr>");
                                out.println("<form action='add_jail.html' method='post'>");
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Add Jail' id='roboto' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
                                out.println("</table>");
                            }
                        } catch (Exception e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format.</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2' style='color: red; text-align: center;'>All Fields Are Required</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button type="button" class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>

<!-- 
How the table should look after JS:
<table>
    <thead>
        <tr>
            <td>Crime Code</td>
            <td>Crime Type</td>
            <td>Badge Number</td>
            <td>Date Committed</td>
            <td>Sentence (Years)</td>
            <td>Criminal Code</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>101</td>
            <td>Theft</td>
            <td>12345</td>
            <td>2023-05-12</td>
            <td>2</td>
            <td>201</td>
        </tr>
        <tr>
            <td>102</td>
            <td>Robbery</td>
            <td>12346</td>
            <td>2023-06-15</td>
            <td>5</td>
            <td>202</td>
        </tr>
    </tbody>
</table>
-->
