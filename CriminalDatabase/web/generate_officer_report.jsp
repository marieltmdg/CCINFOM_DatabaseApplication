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
    <h2>Officer Report</h2>
        <%
            String sYear = request.getParameter("year");

            if (sYear != null) {
                try {
                    int year = Integer.parseInt(sYear);
                    OfficerReport report = new OfficerReport(year);
                    report.generateReport();
                    String[] result = report.getReport();
                    
                    for (String s : result){
                     out.println("<p>" + s + "</p>");
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
