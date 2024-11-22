<%-- 
    Document   : view_jail
    Created on : Nov 17, 2024, 9:01:22 PM
    Author     : nathanaelian
--%>

<%@ page import="criminalmanagement.*" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Jail</title>
    </head>
    <body>
        <h1>View Jail</h1>
        <%
            String jailCodeStr = request.getParameter("jail_code");

            if (jailCodeStr != null) {
                try {
                    int jailCode = Integer.parseInt(jailCodeStr);
                    Jails jail = new Jails();
                    jail.jail_code = jailCode;

                    String[] res = jail.retrieveJail();
                    if (res != null) {
                        out.println("<p>Jail Code: " + res[0] + "</p>");
                        out.println("<p>Area of Jurisdiction: " + res[1] + "</p>");
                        out.println("<p>Start Date: " + res[2] + "</p>");
                        out.println("<p>Criminal Count: " + res[3] + "</p>");
                    } else {
                        out.println("<p>Jail not found.</p>");
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
