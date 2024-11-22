<%-- 
    Document   : update_jail
    Created on : Nov 18, 2024, 2:59:58 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Jail Record</title>
    </head>
    <body>
        <%
            String jailCode = request.getParameter("jail_code");
            
            if (jailCode != null){
                try {
                    int jCode = Integer.parseInt(jailCode);
                    Jails jail = new Jails();
                    jail.jail_code = jCode;
                    String[] res = jail.retrieveJail();
                    if (res != null) {
                        out.println("<p>Jail Code: " + res[0] + "</p>");
                        out.println("<p>Area of Jurisdiction: " + res[1] + "</p>");
                        out.println("<p>Start Date: " + res[2] + "</p>");
                        out.println("<p>Criminal Count: " + res[3] + "</p>");
                        out.println("<p>Leave blank for fields that will not change</p>");
                        
                        out.println("<form action='update_jail_details.jsp' method='post'>");
                        out.println("<input type='hidden' name='jail_code' value='" + jCode + "'>");
                        out.println("<label for='area_juris'>Area of Jurisdiction: </label>");
                        out.println("<input type='text' id='area_juris' name='area_juris'<br>");
                        out.println("<label for='start_date'>Start Date (YYYY-MM-DD): </label>");
                        out.println("<input type='text' id='start_date' name='start_date'<br>");
                        out.println("<input type='submit' value='Update Jail Information'>");
                        out.println("</form>");
                    } else {
                        out.println("<p>Jail does not exist.</p>");
                        out.println("<form action ='add_jail.html' method='post'>");
                        out.println("<input type='submit' value='Add jail'>");
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
