<%-- 
    Document   : list_officer
    Created on : Nov 17, 2024, 5:53:01 PM
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
        <title>List Officers</title>
        <link rel="stylesheet" href="../style.css">
        <script>
            function toggleJailDropdown() {
                const activeDropdown = document.getElementById("active");
                const jailDropdown = document.getElementById("jail");

                if (activeDropdown.value === "F") {
                    jailDropdown.disabled = true;
                    jailDropdown.value = "all";
                } else {
                    jailDropdown.disabled = false;
                }
            }
        </script>
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
            <p class="main-text" id="garamond">List Officers</p>
        </div>
        
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <form action="list_officers.jsp" method="POST">
                <label for="active" class="form-label">Choose Active Status:</label>
                <select id="active" name="active" required class="form-input",required onchange="toggleJailDropdown()">
                    <option value="all">All</option>
                    <option value="T">Active</option>
                    <option value="F">Inactive</option>
                </select><br><br>

                <label for="jail" class="form-label">Choose Jail:</label>
                <select id="jail" name="jail" required class="form-input">
                    <option value="all">All</option>
                <%
                    Jails jails = new Jails();
                    List<String[]> jailList = jails.getJails();
                    for (String[] jail : jailList) {
                %>
                        <option value="<%= jail[0] %>"><%= jail[1] %> (<%= jail[0] %>)</option>
                <%
                    }
                %>
            </select><br><br>

            <div class="button-container">
                        <button class="button back-button" id="roboto" onclick="window.location.href='../index.html'" type="button">Back</button>
                        <input type="submit" value="List Officers" id="roboto" class="button">
            </div>
        </form>

        <%
            String active = request.getParameter("active");
            String jail = request.getParameter("jail");

            if (active != null) {
                Officer officer = new Officer();
                List<String[]> officers = officer.getOfficersByStatusAndJail(active, jail);
                
                out.println("<p></p>");
                out.println("<table>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th colspan='4'>Showing results for [active: " + active + "] from [jail: " + jail+"]</strong></p></th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");
                            
                if (officers == null || officers.isEmpty()) {
                    out.println("<tr><td colspan='4' class='no-data'>No officers found matching the criteria.</td></tr>");
                } else {
                    out.println("<table>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>Badge Number</th><th>First Name</th><th>Last Name</th><th>Start Date</th><th>Active</th><th>Jail Code</th>");
                    out.println("</tr>");
                    out.println("</thead>");
                    out.println("<tbody>");

                    for (String[] officerData : officers) {
                        out.println("<tr>");
                        out.println("<td>" + officerData[0] + "</td>");
                        out.println("<td>" + officerData[1] + "</td>");
                        out.println("<td>" + officerData[2] + "</td>");
                        out.println("<td>" + officerData[3] + "</td>");
                        out.println("<td>" + officerData[4] + "</td>");
                        out.println("<td>" + officerData[5] + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</tbody>");
                    out.println("</table>");
                }
            } else {
                out.println("<p></p>");
                out.println("<table>");
                out.println("<tr><td colspan='4' class='no-data'>Please select active and jail.</td></tr>");
                out.println("</table>");
            }
        %>
    </body>
</html>
