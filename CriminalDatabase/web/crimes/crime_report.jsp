<%-- 
    Document   : view_crime
    Created on : Nov 16, 2024, 8:41:56 PM
    Author     : paolocruzado
--%>
<%@ page import="criminalmanagement.Crimes" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
        <title>Crime Report</title>
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
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String monthStr = request.getParameter("month");
                    String yearStr = request.getParameter("year");

                    if (monthStr != null && yearStr != null) {
                        try {
                            int month = Integer.parseInt(monthStr);
                            int year = Integer.parseInt(yearStr);

                            Crimes crimes = new Crimes();
                            List<String[]> crimeReport = crimes.crimeReport(month, year);

                            if (crimeReport == null || crimeReport.isEmpty()) {
                                out.println("<script>alert('No crime data found for the specified month and year.'); window.location.href = '../index.html';</script>");
                            } else {
                                out.println("<table border='1'>");
                                out.println("<thead><tr><td>Crime Type</td><td>Count</td></tr></thead>");
                                out.println("<tbody>");

                                for (String[] row : crimeReport) {
                                    out.println("<tr>");
                                    out.println("<td>" + row[0] + "</td>");
                                    out.println("<td>" + row[1] + "</td>");
                                    out.println("</tr>");
                                }

                                out.println("</tbody>");
                                out.println("</table>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid input. Please enter valid numbers for month and year.'); window.location.href = '../index.html';</script>");
                        } catch (Exception e) {
                            out.println("<script>alert('An error occurred: " + e.getMessage() + "'); window.location.href = '../index.html';</script>");
                        }
                    } else {
                        out.println("<script>alert('Please provide valid month and year.'); window.location.href = '../index.html';</script>");
                    }
                %>

                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
