<%-- 
    Document   : delete_officer
    Created on : Nov 17, 2024, 5:53:01 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>List Officers</title>
        <meta charset="UTF-8">
        <script>
            function toggleJailDropdown() {
                const activeDropdown = document.getElementById("active");
                const jailDropdown = document.getElementById("jail");

                if (activeDropdown.value === "F") {
                    jailDropdown.disabled = true;
                    jailDropdown.value = "all";
                } else {
                    jailDropdown.disabled = false;
                }
            }
        </script>
    </head>
    <body>
        <h2>List Officers</h2>
        <form action="list_officers.jsp" method="POST">
            <label for="active">Choose Active Status:</label>
            <select id="active" name="active" required onchange="toggleJailDropdown()">
                <option value="all">All</option>
                <option value="T">Active</option>
                <option value="F">Inactive</option>
            </select><br><br>

            <label for="jail">Choose Jail:</label>
            <select id="jail" name="jail" required>
                <option value="all">All</option>
                <%
                    Jails jails = new Jails();
                    List<String[]> jailList = jails.getJails();
                    for (String[] jail : jailList) {
                %>
                        <option value="<%= jail[0] %>"><%= jail[1] %> (<%= jail[0] %>)</option>
                <%
                    }
                %>
            </select><br><br>

            <input type="submit" value="List Officers">
        </form>

        <%
            String active = request.getParameter("active");
            String jail = request.getParameter("jail");

            if (active != null) {
                Officer officer = new Officer();
                List<String[]> officers = officer.getOfficersByStatusAndJail(active, jail);
                
                out.println("<p><strong>Showing results for [active: " + active + "] from [jail: " + jail+"]</strong></p>");
                if (officers == null || officers.isEmpty()) {
                    out.println("<p>No officers found matching the criteria.</p>");
                } else {
                    out.println("<table border='1'>");
                    out.println("<thead>");
                    out.println("<tr>");
                    out.println("<th>Badge Number</th><th>First Name</th><th>Last Name</th><th>Start Date</th><th>Active</th><th>Jail Code</th>");
                    out.println("</tr>");
                    out.println("</thead>");
                    out.println("<tbody>");

                    for (String[] officerData : officers) {
                        out.println("<tr>");
                        out.println("<td>" + officerData[0] + "</td>");
                        out.println("<td>" + officerData[1] + "</td>");
                        out.println("<td>" + officerData[2] + "</td>");
                        out.println("<td>" + officerData[3] + "</td>");
                        out.println("<td>" + officerData[4] + "</td>");
                        out.println("<td>" + officerData[5] + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</tbody>");
                    out.println("</table>");
                }
            } else {
                out.println("<p>Please select both active status and jail to list officers.</p>");
            }
        %>
    </body>
</html>
