<%-- 
    Document   : view_criminal
    Created on : 18 Nov 2024, 10:41:06 am
    Author     : CASAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>View Criminal Record</title>
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
            <p class="main-text" id="garamond">View Criminal Record</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    try{
                        Criminal criminal = new Criminal();

                        String v_criminal_code = request.getParameter("criminal_code");
                        criminal.criminal_code = Integer.parseInt(v_criminal_code);
                        int exists = criminal.checkExists(criminal.criminal_code);

                        if (exists == 1){ 
                            String[] result = criminal.retrieveCriminal();
                                out.println("<table>");
                                out.println("<thead>");
                                    out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>Criminal Record Exists</td></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                    out.println("<tr><td>Criminal Code:</td><td>" + result[0] + "</td></tr>");
                                    out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                    out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                    out.println("<tr><td>Total Sentence:</td><td>" + result[3] + "</td></tr>");
                                    out.println("<tr><td>Jail Code:</td><td>" + result[4] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                        }else{
                            out.println("<table>");
                            out.println("<tr><td colspan='2'>Criminal Does Not Exist</td></tr>");
                            out.println("</table>");
                        }
                    }catch(NumberFormatException e){
                        out.println("<script>alert('Please input a valid number'); window.location.href = 'view_criminal.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>