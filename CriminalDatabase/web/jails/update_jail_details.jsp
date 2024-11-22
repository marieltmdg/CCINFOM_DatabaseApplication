<%-- 
    Document   : update_jail_details
    Created on : Nov 18, 2024, 3:13:01 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Jail Details</title>
    </head>
    <body>
        <h2>Update Jail Details</h2>
        <%
            String jailCode = request.getParameter("jail_code");
            String areaJuris = request.getParameter("area_juris");
            String startDate = request.getParameter("start_date");
            
            if (jailCode != null){
                try {
                    int jCode = Integer.parseInt(jailCode);
                    Jails jail = new Jails();
                    jail.jail_code = jCode;
                    
                    String[] check = jail.retrieveJail();
                    if (check != null){
                        if (areaJuris != null && !areaJuris.isEmpty()){
                            jail.area_of_jurisdiction = areaJuris;
                        }
                        if (startDate != null && !startDate.isEmpty()){
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            java.util.Date date = sdf.parse(startDate); 
                            jail.start_date = new java.sql.Date(date.getTime());;
                        }
                        Boolean result = jail.updateJail();
                        if (result){
                            out.println("<p>Jail details updated successfully.</p>");
                            
                            String[] res = jail.retrieveJail();
                            out.println("<p>Details: </p>");
                            out.println("<p>Jail Code: " + res[0] +"</p>");
                            out.println("<p>Area of Jurisdiction: " + res[1] +"</p>");
                            out.println("<p>Start Date: " + res[2] +"</p>");
                        } else {
                            out.println("<p>Failed to update jail details.</p>");
                        }
                    }
                    
                } catch (Exception e) {
                    out.println("<p>Invalid input format.</p>");
                }
            } else {
                out.println("<p>Jail code is required.</p>");
            }
        %>
    </body>
</html>
