<%-- 
    Document   : related_crime
    Created on : Nov 22, 2024, 4:30:03 PM
    Author     : paolocruzado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@ page import="java.sql.*" %>
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
                    String crimeCodeParam = request.getParameter("crimeCode");
                    if (crimeCodeParam != null && !crimeCodeParam.isEmpty()) {
                        int crimeCode = Integer.parseInt(crimeCodeParam);

                        Crimes crimes = new Crimes();

                        ResultSet officerRs = crimes.relatedOfficer(crimeCode);
                        if (officerRs != null && officerRs.next()) {
                            out.println("<table>");
                            out.println("<tr><thead><td>Badge Number</td><td>First Name</td><td>Last Name</td><td>Jail Code</td><td>Start Date</td><td>Active</td></thead></tr>");
                            do {
                                out.println("<tr>");
                                out.println("<td>" + officerRs.getInt("Badge_Number") + "</td>");
                                out.println("<td>" + officerRs.getString("First_Name") + "</td>");
                                out.println("<td>" + officerRs.getString("Last_Name") + "</td>");
                                out.println("<td>" + officerRs.getInt("Jail_Code") + "</td>");
                                out.println("<td>" + officerRs.getDate("Start_Date_Current") + "</td>");
                                out.println("<td>" + officerRs.getString("Active") + "</td>");
                                out.println("</tr>");
                            } while (officerRs.next());
                            out.println("</table>");
                        } 

                        ResultSet criminalRs = crimes.relatedCriminal(crimeCode);
                        if (criminalRs != null && criminalRs.next()) {
                            out.println("<br><table>");
                            out.println("<tr><thead><td>Criminal Code</td><td>First Name</td><td>Last Name</td><td>Total Sentence</td><td>Jail Code</td></thead></tr>");
                            do {
                                out.println("<tr>");
                                out.println("<td>" + criminalRs.getInt("Criminal_Code") + "</td>");
                                out.println("<td>" + criminalRs.getString("First_Name") + "</td>");
                                out.println("<td>" + criminalRs.getString("Last_Name") + "</td>");
                                out.println("<td>" + criminalRs.getInt("Total_Sentence") + "</td>");
                                out.println("<td>" + criminalRs.getInt("Jail_Code") + "</td>");
                                out.println("</tr>");
                            } while (criminalRs.next());
                            out.println("</table>");
                        } 
                        
                        if (officerRs == null && criminalRs == null) {
                            out.println("<script>alert('Error, please try again.'); window.location.href = '../index.html';</script>");
                        }
                    } else {
                        out.println("<script>alert('Please enter a valid crime code.'); window.location.href = '../index.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>

