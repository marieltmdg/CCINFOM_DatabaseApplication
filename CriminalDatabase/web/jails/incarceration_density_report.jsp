<%-- 
    Document   : incarceration_density_report
    Created on : Nov 20, 2024, 8:36:05 AM
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
        <title>Incarceration Density Report</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="bg-image">
            <img src="s../rc/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="../src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">Incarceration Density Report</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                 <%
                    String month = request.getParameter("month");
                    String year = request.getParameter("year");
                    System.out.println(year);
                    System.out.println(month);

                    Jails jail = new Jails();
                    int nMonth = Integer.parseInt(month);
                    int nYear = Integer.parseInt(year);
                    List<String[]> jails1 = jail.generateReportOfficerPart(nYear, nMonth);
                    List<String[]> jails2 = jail.generateReportCriminalPart(nYear, nMonth);

                    if (jails1 == null || jails1.isEmpty() || jails2 == null || jails2.isEmpty()) {
                        out.println("<script>alert('No jails match the criteria.'); window.location.href = 'index.html';</script>");
                    } else {
                        out.println("<table border='1'>");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Jail Code</th><th>Area of Jurisdiction</th><th>Number of Officers</th><th>Number of Criminals</th>");
                        out.println("</tr>");
                        out.println("</thead>");
                        out.println("<tbody>");

                        if (jails1.size() >= jails2.size()){
                            for (int i = 0; i < jails1.size(); i++) {
                                if (i < jails2.size()){
                                    out.println("<tr>");
                                    out.println("<td>" + jails1.get(i)[0] + "</td>");
                                    out.println("<td>" + jails1.get(i)[1] + "</td>");
                                    out.println("<td>" + jails1.get(i)[2] + "</td>");
                                    out.println("<td>" + jails2.get(i)[2] + "</td>");
                                    out.println("</tr>");
                                } else {
                                    out.println("<tr>");
                                    out.println("<td>" + jails1.get(i)[0] + "</td>");
                                    out.println("<td>" + jails1.get(i)[1] + "</td>");
                                    out.println("<td>" + jails1.get(i)[2] + "</td>");
                                    out.println("<td>" + 0 + "</td>");
                                    out.println("</tr>");
                                }
                            }
                        } else {
                            for (int i = 0; i < jails2.size(); i++) {
                                if (i < jails1.size()){
                                    out.println("<tr>");
                                    out.println("<td>" + jails2.get(i)[0] + "</td>");
                                    out.println("<td>" + jails2.get(i)[1] + "</td>");
                                    out.println("<td>" + jails1.get(i)[2] + "</td>");
                                    out.println("<td>" + jails2.get(i)[2] + "</td>");
                                    out.println("</tr>");
                                } else {
                                    out.println("<tr>");
                                    out.println("<td>" + jails2.get(i)[0] + "</td>");
                                    out.println("<td>" + jails2.get(i)[1] + "</td>");
                                    out.println("<td>" + 0 + "</td>");
                                    out.println("<td>" + jails2.get(i)[2] + "</td>");
                                    out.println("</tr>");
                                }
                            }
                        }

                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
