<%-- 
    Document   : add_criminal
    Created on : 17 Nov 2024, 5:17:52 pm
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
        <title>Add Criminal</title>
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
            <p class="main-text" id="garamond">Add Criminal</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    Criminal criminal = new Criminal();

                    String v_first_name = request.getParameter("first_name");
                    String v_last_name = request.getParameter("last_name");
                    String v_total_sentence = request.getParameter("total_sentence");
                    String v_jail_code = request.getParameter("jail_code");

                    criminal.criminal_code = criminal.newCriminalCode();
                    criminal.first_name = v_first_name;
                    criminal.last_name = v_last_name;
                    criminal.total_sentence = Integer.parseInt(v_total_sentence);
                    criminal.jail_code = Integer.parseInt(v_jail_code);
                    
                    int status = criminal.registerCriminal();
                    if(status==1){
                        String[] result = criminal.retrieveCriminal();
                        out.println("<table>");
                        out.println("<thead>");
                            out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>Criminal Added Successfully</td></tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                            out.println("<tr><td>Criminal Code:</td><td>" + result[0] + "</td></tr>");
                            out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                            out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                            out.println("<tr><td>Total Sentence:</td><td>" + result[3] + "</td></tr>");
                            out.println("<tr><td>Jail Code:</td><td>" + result[4] + "</td></tr>");
                            out.println("<tr><td>Deleted:</td><td>" + result[5] + "</td></tr>");
                        out.println("</tbody>");
                        out.println("</table>");
                    }else{
                        out.println("<table>");
                        out.println("<tr><td colspan='2'>Failed to add criminal</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>