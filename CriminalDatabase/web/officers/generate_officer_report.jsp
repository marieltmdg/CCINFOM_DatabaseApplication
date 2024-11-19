<%-- 
    Document   : generate_officer_report
    Created on : Nov 17, 2024, 5:31:26 PM
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
        <title>Officer Report</title>
        <link rel="stylesheet" href="../style.css">
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
            <p class="main-text" id="garamond">Officer Report</p>
        </div>

        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <form action="generate_officer_report.jsp" method="GET" class="input-form">
                    <label for="year" class="form-label">Select Year:</label>
                    <input type="number" id="year" name="year" required class="form-input">
                    <br><br>

                    <label for="sortBy" class="form-label">Sort By:</label>
                    <select id="sortBy" name="sortBy" required class="form-input">
                        <option value="last_name">Last Name</option>
                        <option value="first_name">First Name</option>
                        <option value="badge_number">Badge Number</option>
                        <option value="criminals_caught">Criminals Caught</option>
                    </select>
                    <br><br>

                    <label for="sortOrder" class="form-label">Sort Order:</label>
                    <select id="sortOrder" name="sortOrder" required class="form-input">
                        <option value="asc">Ascending</option>
                        <option value="desc">Descending</option>
                    </select>
                    <br><br>

                    <div class="button-container">
                        <button class="button back-button" id="roboto" onclick="window.location.href='../index.html'" type="button">Back</button>
                        <input type="submit" value="Generate Report" id="roboto" class="button">
                    </div>
                </form>

                <%
                    String sYear = request.getParameter("year");
                    String sortBy = request.getParameter("sortBy");
                    String sortOrder = request.getParameter("sortOrder");

                    if (sYear != null && !sYear.trim().isEmpty()) {
                        try {
                            int year = Integer.parseInt(sYear);
                            OfficerReport report = new OfficerReport(year);
                            report.generateReport();

                            boolean ascending = "asc".equals(sortOrder);
                            List<String[]> result = report.getReport(sortBy, ascending);

                            out.println("<p></p>");
                            out.println("<table>");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th colspan='4'>Showing results for year " + year + " [Sorted by: " + sortBy + " in " + (ascending ? "ascending" : "descending") + " order]</th>");
                            out.println("</tr>");
                            out.println("</thead>");
                            out.println("<tbody>");

                            if (result == null || result.isEmpty()) {
                                out.println("<tr><td colspan='4' class='no-data'>No report data available for the year " + year + "</td></tr>");
                            } else {
                                
                                out.println("<tr>");
                                out.println("<th>Badge Number</th>");
                                out.println("<th>First Name</th>");
                                out.println("<th>Last Name</th>");
                                out.println("<th>Criminals Caught</th>");
                                out.println("</tr>");
                            
                                for (String[] line : result) {
                                    out.println("<tr>");
                                    out.println("<td>" + line[0] + "</td>");
                                    out.println("<td>" + line[1] + "</td>");
                                    out.println("<td>" + line[2] + "</td>");
                                    out.println("<td>" + line[3] + "</td>");
                                    out.println("</tr>");
                                }
                            }
                            out.println("</tbody>");
                            out.println("</table>");

                        } catch (NumberFormatException e) {
                            out.println("<table>");
                            out.println("<tr><td colspan='4' class='no-data'>Invalid year format. Please enter a valid year</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<p></p>");
                        out.println("<table>");
                        out.println("<tr><td colspan='4' class='no-data'>Please enter a year to generate the report</td></tr>");
                        out.println("</table>");
                    }
                %>
            </div>
        </div>

    </body>
</html>
