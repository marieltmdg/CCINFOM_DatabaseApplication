<%-- 
    Document   : report_criminal
    Created on : 22 Nov 2024, 11:17:50 am
    Author     : CASAS
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
        <title>Criminal Report</title>
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
            <p class="main-text" id="garamond">Criminal Report</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <% try{%>
                    <table border="1">
                        <tr>
                            <th>Month</th>
                            <th>Total</th>
                        </tr>
                        <%
                            Criminal criminal = new Criminal();
                            int year = Integer.parseInt(request.getParameter("year"));

                            List<Map<String, Object>> criminals = criminal.criminalReport(year);

                            // Iterate through the list and display each row in the table
                            for (Map<String, Object> row : criminals) {
                        %>
                        <tr>
                            <td><%= row.get("crimeMonth") %></td>
                            <td><%= row.get("totalCriminals") %></td>
                        </tr>
                        <%}%>
                    </table>
                <%}catch(NumberFormatException e){
                    out.println("<script>alert('Please input a valid number'); window.location.href = 'report_criminal.html';</script>");
                }%>
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
