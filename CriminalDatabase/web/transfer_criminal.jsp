<%-- 
    Document   : transfer_criminal
    Created on : Nov 12, 2024, 1:59:06 PM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Criminal</title>
    </head>
    <body>
        <h1>Transfer Criminal</h1>
        <%
            String crimCode = request.getParameter("criminal_code");
            
            if (crimCode != null){
                try {
                    int criminalCode = Integer.parseInt(crimCode);
                    Criminal criminal = new Criminal();
                    criminal.criminal_code = criminalCode;
                    int check = criminal.checkExists();
                    
                    if (check == 1) {
                        String[] res = criminal.retrieveCriminal();
                        out.println("<p>Criminal Exists</p>");
                        out.println("<p>Details</p>");
                        out.println("<p>Criminal Code: " + crimCode + "</p>");
                        out.println("<p>First Name: " + res[1] + "</p>");
                        out.println("<p>Last Name: " + res[2] + "</p>");
                        out.println("<p>Total Sentence: " + res[3] + "</p>");
                        out.println("<p>Jail Code: " + res[4] + "</p>");
                        out.println("<form action='update_transfer_criminal.jsp' method='post'>");
                        out.println("<input type='hidden' name='criminal_code' value='" + criminalCode + "'>");
                        out.println("<input type='hidden' name='old_jail_code' value='" + res[4] + "'>");
                        out.println("<input type='hidden' name='date_committed' value='" + res[5] + "'>");
                        out.println("<label for='jail_code'>New Jail Code:</label>");
                        out.println("<input type='text' id='jail_code' name='jail_code' required><br>");
                        out.println("<input type='submit' value='Transfer Criminal'>");
                        out.println("</form>");
                    } else {
                        out.println("<p>Criminal Does Not Exist</p>");
                        out.println("<form action ='create.html' method='post'>");
                        out.println("<input type='submit' value='Create Criminal Record'>");
                    }
                } catch (Exception e) {
                    out.println("<p>Invalid Input</p>");
                }
            } else {
                out.println("<p>No Input</p>");
            }
        %>
    </body>
</html>
