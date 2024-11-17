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
        <%
            String sYear = request.getParameter("year");

            if (sYear != null) {
                try {
                    int year = Integer.parseInt(sYear);
                    OfficerReport report = new OfficerReport(year);
                    report.generateReport();
                    List<String[]> result = report.getReport();
                    
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
                    out.println("<p>Invalid input format. Please enter valid numbers.</p>");
                }
            } else {
                out.println("<p>All fields are required.</p>");
            }
        %>
    </body>
</html>
