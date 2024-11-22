<%-- 
    Document   : view_related_jail
    Created on : Nov 20, 2024, 7:39:01 AM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criminal History of Jail</title>
    </head>
    <body>
        <h2>Criminal History of Jail</h2>
        <%
            String jailCodeStr = request.getParameter("jail_code");

            if (jailCodeStr != null) {
                try {
                    int jailCode = Integer.parseInt(jailCodeStr);
                    IncarcerationHistory ih = new IncarcerationHistory();
                    ih.jail_code = jailCode;

                    List<String[]> res = ih.getCrimHistory();
                    if (res == null || res.isEmpty()) {
                out.println("<p>No criminal history found matching the criteria.</p>");
            } else {
                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Criminal Code</th><th>Jail Code</th><th>Start Date</th><th>End Date</th><th>Status</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                for (String[] jailData : res) {
                    out.println("<tr>");
                    out.println("<td>" + jailData[0] + "</td>");
                    out.println("<td>" + jailData[1] + "</td>");
                    out.println("<td>" + jailData[2] + "</td>");
                    out.println("<td>" + jailData[3] + "</td>");
                    out.println("<td>" + jailData[4] + "</td>");
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");
            }
                } catch (Exception e) {
                    out.println("<p>Invalid input. Please enter a valid jail code.</p>");
                }
            } else {
                out.println("<p>No input.</p>");
            }
        %>
    </body>
</html>
