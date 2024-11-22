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
        
    </body>
</html>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Update Jail Record</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="bg-image">
            <img src="src/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">Update Jail Record</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String jailCode = request.getParameter("jail_code");

                    if (jailCode != null){
                        try {
                            int jCode = Integer.parseInt(jailCode);
                            Jails jail = new Jails();
                            jail.jail_code = jCode;
                            String[] res = jail.retrieveJail();
                            if (res != null) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th> colspan='2' style='color: white; font-weight: bold;'>Table Details</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Jail Code:</td><td>" + res[0] + "</td></tr>");
                                out.println("<tr><td>Area of Jurisdiction</td><td>" + res[1] + "</td></tr>");
                                out.println("<tr><td>Start Date of Jail:</td><td>" + res[2] + "</td></tr>");
                                out.println("<tr><th> colspan='2' style='color: white; font-weight: bold;'>Leave Blank if Data Will Not Be Updated.</th></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                               
                                out.println("<form action='update_jail_details.jsp' method='post'>");
                                out.println("<input type='hidden' name='jail_code' value='" + jCode + "'>");
                                out.println("<label for='area_juris' class='form-label'>Area of Jurisdiction: </label>");
                                out.println("<input type='text' id='area_juris' name='area_juris' class='form-input'<br>");
                                out.println("<label for='start_date' class='form-label'>Start Date (YYYY-MM-DD): </label>");
                                out.println("<input type='text' id='start_date' name='start_date' class='form-input'<br>");
                                out.println("<input type='submit' value='Update Jail Information' id='roboto' class='button'>");
                                out.println("</form>");
                            } else {                    
                                out.println("<table>");
                                out.println("<tr><td>Jail Does Not Exist</td></tr>");
                                out.println("<form action='add_jail.html' method='post'>");
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Add Officer' id='roboto' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
                                out.println("</table>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format.</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2' style='color: red; text-align: center;'>All Fields Are Required</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>

<!-- 
How the table should look after JS:
<table>
    <thead>
        <tr>
            <td>Crime Code</td>
            <td>Crime Type</td>
            <td>Badge Number</td>
            <td>Date Committed</td>
            <td>Sentence (Years)</td>
            <td>Criminal Code</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>101</td>
            <td>Theft</td>
            <td>12345</td>
            <td>2023-05-12</td>
            <td>2</td>
            <td>201</td>
        </tr>
        <tr>
            <td>102</td>
            <td>Robbery</td>
            <td>12346</td>
            <td>2023-06-15</td>
            <td>5</td>
            <td>202</td>
        </tr>
    </tbody>
</table>
-->

