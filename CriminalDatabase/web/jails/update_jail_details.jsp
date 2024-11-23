<%-- 
    Document   : update_jail_details
    Created on : Nov 18, 2024, 3:13:01 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Update Jail Details</title>
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
            <p class="main-text" id="garamond">Update Jail Details</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String jailCode = request.getParameter("jail_code");
                    String areaJuris = request.getParameter("area_juris");
                    String startDate = request.getParameter("start_date");

                    if (jailCode != null){
                        try {
                            int jCode = Integer.parseInt(jailCode);
                            Jails jail = new Jails();
                            jail.jail_code = jCode;

                            String[] check = jail.retrieveJail();
                            if (check != null){
                                if (areaJuris != null && !areaJuris.isEmpty()){
                                    jail.area_of_jurisdiction = areaJuris;
                                }
                                if (startDate != null && !startDate.isEmpty()){
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    java.util.Date date = sdf.parse(startDate); 
                                    jail.start_date = new java.sql.Date(date.getTime());;
                                }
                                Boolean result = jail.updateJail();
                                if (result){
                                    String[] res = jail.retrieveJail();
                                    out.println("<table>");
                                    out.println("<thead>");
                                    out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Jail Update Successfully!</th></tr>");
                                    out.println("</thead>");
                                    out.println("<tbody>");
                                    
                                    out.println("<tr><td>Jail Code:</td><td>" + res[0] + "</td></tr>");
                                    out.println("<tr><td>Area of Jurisdiction</td><td>" + res[1] + "</td></tr>");
                                    out.println("<tr><td>Start Date of Jail:</td><td>" + res[2] + "</td></tr>");
                                    out.println("</tbody>");
                                    out.println("</table>");
                                } else {
                                    out.println("<table>");
                                    out.println("<thead>");
                                    out.println("<tr><th colspan='2' style='color: white;'>Failed To Update Jail Details</th></tr>");
                                    out.println("</thead>");
                                    out.println("<tbody>");
                                    out.println("<tr><td colspan='2'>Please Try Again</td></tr>");
                                    out.println("</tbody>");
                                    out.println("</table>");
                                }
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
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
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
