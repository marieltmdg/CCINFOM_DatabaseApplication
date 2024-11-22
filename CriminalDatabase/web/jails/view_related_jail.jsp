<%-- 
    Document   : view_related_jail
    Created on : Nov 20, 2024, 7:39:01 AM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Criminal History of Jail</title>
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
            <p class="main-text" id="garamond">Criminal History of Jail</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String jailCodeStr = request.getParameter("jail_code");

                    if (jailCodeStr != null) {
                        try {
                            int jailCode = Integer.parseInt(jailCodeStr);
                            IncarcerationHistory ih = new IncarcerationHistory();
                            ih.jail_code = jailCode;

                            List<String[]> res = ih.getCrimHistory();
                            if (res == null || res.isEmpty()) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>No criminal history found matching the criteria.</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td colspan='2'>Please Try Again</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<table border='1'>");
                                out.println("<thead>");
                                out.println("<tr>");
                                out.println("<th>Criminal Code</th><th>Jail Code</th><th>Start Date</th><th>End Date</th><th>Status</th>");
                                out.println("</tr>");
                                out.println("</thead>");
                                out.println("<tbody>");

                                for (String[] jailData : res) {
                                    out.println("<tr>");
                                    out.println("<td>" + jailData[0] + "</td>");
                                    out.println("<td>" + jailData[1] + "</td>");
                                    out.println("<td>" + jailData[2] + "</td>");
                                    out.println("<td>" + jailData[3] + "</td>");
                                    out.println("<td>" + jailData[4] + "</td>");
                                    out.println("</tr>");
                                }

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
                        out.println("<tr><td colspan='2' style='color: red; text-align: center;'>All Fields Are Required</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
