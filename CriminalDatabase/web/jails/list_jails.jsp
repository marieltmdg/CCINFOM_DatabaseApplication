<%-- 
    Document   : list_jails
    Created on : Nov 18, 2024, 4:31:22 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>List Jails</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="bg-image">
            <img src="src/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">List Jails</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <form action="list_jails.jsp" method="POST">
                    <label class="form-label">(Leave Blank if Filter Will Not Be Used.)</label><br><br>
                    <label for="textInArea" class="form-label">Area of Jurisdiction has character/string:</label>
                    <input type="text" id="textInArea" name="textInArea" class="form-input"><br><br>
                    <label for="year" class="form-label">Start Year:</label>
                    <input type="number" id="year" name="year" class="form-input"><br><br>
                    
                    <div class="button-container">
                        <button class="button back-button" id="roboto" onclick="window.location.href='index.html'" type="button">Back</button>
                        <input type="submit" value="List Officers" id="roboto" class="button">
                </div>
                </form><br>
                <%
                    String textInArea = request.getParameter("textInArea");
                    String year = request.getParameter("year");

                    if (textInArea == null || textInArea == "")
                        textInArea = "%%";
                    if (year == null || year == "")
                        year = "all";


                    Jails jail = new Jails();
                    List<String[]> jails = jail.getJailsByAreaAndYear(textInArea, year);

                    if (jails == null || jails.isEmpty()) {
                        out.println("<tr><td colspan='4' class='no-data'>No Jails Found Matching the Criteria</td></tr>");
                    } else {
                        out.println("<table>");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Jail Code</th><th>Area of Jurisdiction</th><th>Start Date</th>");
                        out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                        
                        for (String[] jailData : jails) {
                            out.println("<tr>");
                            out.println("<td>" + jailData[0] + "</td>");
                            out.println("<td>" + jailData[1] + "</td>");
                            out.println("<td>" + jailData[2] + "</td>");
                            out.println("</tr>");
                        }

                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
            </div> 
        </div>
    </body>
</html>


