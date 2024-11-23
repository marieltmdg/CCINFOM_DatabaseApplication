<%@ page import="criminalmanagement.Crimes" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>List Crimes</title>
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
            <p class="main-text" id="garamond">List of Crimes</p>
        </div>

        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String filter = request.getParameter("filter");

                    if (filter != null) {
                        Crimes crime = new Crimes();
                        ResultSet rst = null;

                        try {
                            if ("2".equals(filter)) {
                                rst = crime.filterBySentenceHighToLow(); 
                            } else if ("3".equals(filter)) {
                                rst = crime.filterBySentenceLowToHigh(); 
                            } else if ("1".equals(filter)) {
                                String crimeType = request.getParameter("crimeType"); 
                                if (crimeType != null && !crimeType.isEmpty()) {
                                    rst = crime.filterByCrimeType(crimeType);
                                } else {
                                    out.println("<script>alert('Crime type is required.'); window.location.href = '../index.html';</script>");
                                }
                            } else if ("4".equals(filter)) {
                                int month = Integer.parseInt(request.getParameter("month"));
                                int year = Integer.parseInt(request.getParameter("year"));
                                rst = crime.filterByMonthAndYear(month, year); // Filter by month and year
                            }

                            if (rst != null) {
                                out.println("<table border='1' cellpadding='10' cellspacing='0'>");
                                out.println("<thead><tr><td>Crime Code</td><td>Crime Type</td><td>Date Committed</td><td>Sentence (Years)</td></tr></thead>");
                                out.println("<tbody>");
                                while (rst.next()) {
                                    out.println("<tr>");
                                    out.println("<td>" + rst.getInt("Crime_Code") + "</td>");
                                    out.println("<td>" + rst.getString("Crime_Type") + "</td>");
                                    out.println("<td>" + rst.getDate("Date_Committed") + "</td>");
                                    out.println("<td>" + rst.getInt("Sentence") + "</td>");
                                    out.println("</tr>");
                                }
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<script>alert('No crimes found.'); window.location.href = '../index.html';</script>");
                            }
                        } catch (SQLException e) {
                            out.println("<script>alert('Error retrieving crimes.'); window.location.href = '../index.html';</script>");
                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid input.'); window.location.href = '../index.html';</script>");
                        }
                    } else {
                        out.println("<script>alert('Filter is required.'); window.location.href = '../index.html';</script>");
                    }
                %>


                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
