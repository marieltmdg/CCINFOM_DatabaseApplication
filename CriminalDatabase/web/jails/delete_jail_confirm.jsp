<%-- 
    Document   : delete_jail_confirm
    Created on : Nov 22, 2024, 10:34:00 PM
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
                    
                            boolean res = jail.deleteJail();
                            
                            if (res) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Jail Deleted Successfully</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td><strong>Jail Code:</strong></td><td>" + jCode + "</td></tr>");
                                out.println("<tr><td colspan='2'>Jail has been deleted from the system.</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Unable to Delete Jail</th></tr>");
                                out.println("</thead>");
                                out.println("</table>");
                            }
                        } catch (Exception e) {
                            out.println("<table>");
                            out.println("<thead>");
                            out.println("<tr><th colspan='2' style='color: white;'>Error</th></tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                            out.println("<tr><td colspan='2'>Error: " + e.getMessage() + "</td></tr>");
                            out.println("</tbody>");
                            out.println("</table>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<thead>");
                        out.println("<tr><th colspan='2' style='color: white;'>Input required.</th></tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                        out.println("<tr><td colspan='2'>Missing Input.</td></tr>");
                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>


