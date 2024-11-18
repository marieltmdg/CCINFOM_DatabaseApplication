<%-- 
    Document   : generate_officer_report
    Created on : Nov 17, 2024, 5:31:26 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Officer Report</title>
    </head>
    <body>
        <h2>Officer Report</h2>

        <form action="generate_officer_report.jsp" method="GET">
            <label for="year">Select Year:</label>
            <input type="number" id="year" name="year" required>
            <input type="submit" value="Generate Report">
        </form>

        <%
            String sYear = request.getParameter("year");

            if (sYear != null && !sYear.trim().isEmpty()) {
                try {
                    int year = Integer.parseInt(sYear);  
                    OfficerReport report = new OfficerReport(year);
                    report.generateReport();
                    List<String[]> result = report.getReport();
                    
                    out.println("<p><strong>Showing results for year " + year + "</strong></p>");
                    if (result == null || result.isEmpty()) {
                        out.println("<p>No report data available for the year " + year + ".</p>");
                    } else {
                        out.println("<table border='1'>");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Badge Number</th>");
                        out.println("<th>Criminals Caught</th>");
                        out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                        
                        for (String[] line : result) {
                            out.println("<tr>");
                            out.println("<td>" + line[0] + "</td>");
                            out.println("<td>" + line[1] + "</td>");
                            out.println("</tr>");
                        }
                        out.println("</tbody>");
                        out.println("</table>");
                    }
                    
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid year format. Please enter a valid year.</p>");
                }
            } else {
                out.println("<p>Please enter a year to generate the report.</p>");
            }
        %>
    </body>
</html>
