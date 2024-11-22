<%-- 
    Document   : view_crime
    Created on : Nov 16, 2024, 8:41:56 PM
    Author     : paolocruzado
--%>
<%@ page import="criminalmanagement.Crimes" %>
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
        <title>View Crime</title>
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
            <p class="main-text" id="garamond">View Crime</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String crimeCodeStr = request.getParameter("crime_code");

                    if (crimeCodeStr != null) {
                        try {
                            int crimeCode = Integer.parseInt(crimeCodeStr);
                            Crimes crime = new Crimes();
                            crime.crime_code = crimeCode;

                            ResultSet rst = crime.viewCrime();
                            if (rst != null && rst.next()) {
                                out.println("<table>");
                                out.println("<thead><tr><td>Field</td><td>Value</td></tr></thead>");
                                out.println("<tr><td>Crime Code</td><td>" + rst.getInt("Crime_Code") + "</td></tr>");
                                out.println("<tr><td>Crime Type</td><td>" + rst.getString("Crime_Type") + "</td></tr>");
                                out.println("<tr><td>Badge Number</td><td>" + rst.getString("Badge_Number") + "</td></tr>");
                                out.println("<tr><td>Date Committed</td><td>" + rst.getString("Date_Committed") + "</td></tr>");
                                out.println("<tr><td>Sentence</td><td>" + rst.getInt("Sentence") + "</td></tr>");
                                out.println("<tr><td>Criminal Code</td><td>" + rst.getInt("Criminal_Code") + "</td></tr>");
                                out.println("</table>");

                            } else {
                                out.println("<script>alert('Crime not found.'); window.location.href = '../index.html';</script>");

                            }
                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid input.'); window.location.href = '../index.html';</script>");
                        } catch (SQLException e) {
                            out.println("<script>alert('Error retrieving crime.'); window.location.href = '../index.html';</script>");

                        }
                    } else {
                        out.println("<script>alert('Crime code is required.'); window.location.href = '../index.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
