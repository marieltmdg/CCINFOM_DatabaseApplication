<%-- 
    Document   : delete_jail
    Created on : Nov 17, 2024, 10:45:46 PM
    Author     : nathanaelian
--%>
<%@ page import="criminalmanagement.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Jail</title>
    </head>
    <body>
        <h2>Delete Jail</h2>
        <%
            String jailCode = request.getParameter("jail_code");
            
            if (jailCode != null){
                try {
                    int jCode = Integer.parseInt(jailCode);
                    Jails jail = new Jails();
                    jail.jail_code = jCode;
                    boolean res = jail.deleteJail();
                    
                    if (res)
                        out.println("<p>Jail deleted successfully.</p>");
                    else
                        out.println("<p>Failed to delete jail.</p>");
                        
                } catch (Exception e) {
                    out.println("<p>Invalid input.</p>");
                }
            } else {
                out.println("<p>No input.</p>");
            }
        %>
    </body>
</html>
