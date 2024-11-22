<%-- 
    Document   : delete_criminal
    Created on : 17 Nov 2024, 11:56:13 pm
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
        <title>Delete Criminal</title>
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
            <p class="main-text" id="garamond">Delete Criminal</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    Criminal criminal = new Criminal();
                    boolean status=false;

                    String v_criminal_code = request.getParameter("criminal_code");
                    String v_first_name = request.getParameter("first_name");
                    String v_last_name = request.getParameter("last_name");

                    criminal.criminal_code = Integer.parseInt(v_criminal_code);
                    criminal.first_name = v_first_name;
                    criminal.last_name = v_last_name;
                    
                    int exists = criminal.checkExists();
                    if(exists==1){
                        status = criminal.deleteCriminal();
                        if(status){
                            String[] result = criminal.retrieveCriminal();
                            out.println("<table>");
                            out.println("<thead>");
                                out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>Criminal Deleted Successfully</td></tr>");
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
                            out.println("<tr><td colspan='2'>Unable to Delete Criminal</td></tr>");
                            out.println("</table>");
                        }
                    }else{
                        out.println("<script>alert('Criminal Does Not Exist'); window.location.href = 'delete_criminal.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>