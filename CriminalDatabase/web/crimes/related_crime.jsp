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
        <title>View Related</title>
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
            <p class="main-text" id="garamond">View Related</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String crimeCodeParam = request.getParameter("crimeCode");
                    if (crimeCodeParam != null && !crimeCodeParam.isEmpty()) {
                        try {
                            int crimeCode = Integer.parseInt(crimeCodeParam);

                            Crimes crimes = new Crimes();

                            List<String[]> officerList = crimes.relatedOfficer(crimeCode);
                            List<String[]> criminalList = crimes.relatedCriminal(crimeCode);

                            if ((officerList == null || officerList.isEmpty()) && (criminalList == null || criminalList.isEmpty())) {
                                out.println("<script>alert('No related officers or criminals found.'); window.location.href = '../index.html';</script>");
                            } else {
                                if (officerList != null && !officerList.isEmpty()) {
                                    out.println("<table border='1'>");
                                    out.println("<thead><tr><td>Badge Number</td><td>First Name</td><td>Last Name</td><td>Jail Code</td><td>Start Date</td><td>Active</td></tr></thead>");
                                    out.println("<tbody>");
                                    for (String[] officer : officerList) {
                                        out.println("<tr>");
                                        out.println("<td>" + officer[0] + "</td>");
                                        out.println("<td>" + officer[1] + "</td>");
                                        out.println("<td>" + officer[2] + "</td>");
                                        out.println("<td>" + officer[3] + "</td>");
                                        out.println("<td>" + officer[4] + "</td>");
                                        out.println("<td>" + officer[5] + "</td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</tbody></table><br><br>");
                                }

                                if (criminalList != null && !criminalList.isEmpty()) {
                                    out.println("<table border='1'>");
                                    out.println("<thead><tr><td>Criminal Code</th><td>First Name</td><td>Last Name</td><td>Total Sentence</td><td>Jail Code</td></tr></thead>");
                                    out.println("<tbody>");
                                    for (String[] criminal : criminalList) {
                                        out.println("<tr>");
                                        out.println("<td>" + criminal[0] + "</td>");
                                        out.println("<td>" + criminal[1] + "</td>");
                                        out.println("<td>" + criminal[2] + "</td>");
                                        out.println("<td>" + criminal[3] + "</td>");
                                        out.println("<td>" + criminal[4] + "</td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</tbody></table>");
                                }
                            }
                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid crime code format. Please enter a number.'); window.location.href = '../index.html';</script>");
                        } catch (Exception e) {
                            out.println("<script>alert('An error occurred: " + e.getMessage() + "'); window.location.href = '../index.html';</script>");
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

