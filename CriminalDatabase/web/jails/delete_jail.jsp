<%-- 
    Document   : delete_jail
    Created on : Nov 17, 2024, 10:45:46 PM
    Author     : nathanaelian
--%>
<%@ page import="criminalmanagement.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Delete Jail</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="bg-image">
            <img src="../src/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="../src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">Delete Jail</p>
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
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Delete the following jail record?</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Jail Code:</td><td>" + res[0] + "</td></tr>");
                                out.println("<tr><td>Area of Jurisdiction:</td><td>" + res[1] + "</td></tr>");
                                out.println("<tr><td>Start Date:</td><td>" + res[2] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                                out.println("<form action='../delete_jail_confirm.jsp' method='POST'>");
                                out.println("<input type='hidden' name='jail_code' value='" + jailCode + "'/>");
                                out.println("<button class='button' id='roboto' type='submit' style='margin-top: 2vh;  margin-bottom: 0px; width: 20%;'>Confirm Deletion</button>");
                                out.println("</form>");
                            } else {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Jail Record Not Found</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td colspan='2'>No jail found.</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            }

                        } catch (Exception e) {
                            out.println("<table");
                            out.println("<tr><td colspan='2' style='color: white; text-align: center;'>Invalid input format.</td></tr>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2' style='color: red; text-align: center;'>Invalid Input.</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>



