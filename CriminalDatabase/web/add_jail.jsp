<%-- 
    Document   : add_jail
    Created on : Nov 17, 2024, 9:47:48 PM
    Author     : nathanaelian
--%>
<%@ page import="criminalmanagement.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Jail</title>
    </head>
    <body>
        <h2>Add Jail Record</h2>
        <%
            String areaJuris = request.getParameter("area_of_jurisdiction");
            String yearsActive = request.getParameter("years_active");
            
            if (areaJuris != null && yearsActive != null){
                try {
                    int yActive = Integer.parseInt(yearsActive);
                    
                    Jails jail = new Jails();
                    jail.years_active = yActive;
                    jail.area_of_jurisdiction = areaJuris;
                    
                    boolean res = jail.addJail();
                    
                    if (res) {
                        out.println("<p>Jail added successfully!</p>");
                    } else {
                        out.println("<p>Failed to add jail. Please try again.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Invalid input.</p>");
                }
            } else {
                out.println("<p>No input.</p>");
            }
        %>
    </body>
</html>
