<%-- 
    Document   : list_jails
    Created on : Nov 18, 2024, 4:31:22 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Jails</title>
    </head>
    <body>
        <h2>List Jails</h2>
        <form action="list_jails.jsp" method="POST">
            <h4>Filters (Leave blank if not used):</h4>
            <label for="textInArea">Area of Jurisdiction has character/string:</label>
            <input type="text" id="textInArea" name="textInArea"><br><br>
            <label for="year">Start Year:</label>
            <input type="number" id="year" name="year"><br><br>
            <input type="submit" value="Filter"><br><br>
        </form>
        <%
            String textInArea = request.getParameter("textInArea");
            String year = request.getParameter("year");
            
            if (textInArea == null || textInArea == "")
                textInArea = "%%";
            if (year == null || year == "")
                year = "all";
                
            System.out.println(textInArea);
            System.out.println(year);
            
            Jails jail = new Jails();
            List<String[]> jails = jail.getJailsByAreaAndYear(textInArea, year);
            
            if (jails == null || jails.isEmpty()) {
                out.println("<p>No jails found matching the criteria.</p>");
            } else {
                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Jail Code</th><th>Area of Jurisdiction</th><th>Start Date</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                for (String[] jailData : jails) {
                    out.println("<tr>");
                    out.println("<td>" + jailData[0] + "</td>");
                    out.println("<td>" + jailData[1] + "</td>");
                    out.println("<td>" + jailData[2] + "</td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");
            }
        %>
    </body>
</html>
