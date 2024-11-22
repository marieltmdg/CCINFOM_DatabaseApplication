<%-- 
    Document   : update_criminal
    Created on : 18 Nov 2024, 12:56:34 am
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
        <title>Update Criminal</title>
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
            <p class="main-text" id="garamond">Update Criminal</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    try{
                        Criminal criminal = new Criminal();
                        boolean status=false;

                        String v_criminal_code = request.getParameter("criminal_code");
                        String v_first_name = request.getParameter("first_name");
                        String v_last_name = request.getParameter("last_name");
                        String v_total_sentence = request.getParameter("total_sentence");
                        String v_jail_code = request.getParameter("jail_code");

                        criminal.criminal_code = Integer.parseInt(v_criminal_code);
                        criminal.first_name = v_first_name;
                        criminal.last_name = v_last_name;

                        if(v_total_sentence != "")
                            criminal.total_sentence = Integer.parseInt(v_total_sentence);
                        else criminal.total_sentence = -1;
                        if(v_jail_code != ""){
                            criminal.jail_code = Integer.parseInt(v_jail_code);
                            Jails j = new Jails();
                            j.jail_code=criminal.jail_code;
                            int jailExist = j.checkExistsAndNotDeleted();
                            if(jailExist==0){
                                out.println("<table>");
                                out.println("<tr><td colspan='2'>Jail does not exist</td></tr>");
                                out.println("</table>");
                            }
                        }
                        else criminal.jail_code = -1;

                        int exists = criminal.checkExists(criminal.criminal_code);
                        if (exists == 1){ 
                            status = criminal.updateCriminal();
                            if(status){
                                String[] result = criminal.retrieveCriminal();
                                out.println("<table>");
                                out.println("<thead>");
                                    out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>Criminal Updated</td></tr>");
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
                                out.println("<tr><td colspan='2'>Unable to update criminal details</td></tr>");
                                out.println("</table>");
                            }
                        }else{
                            out.println("<table>");
                            out.println("<tr><td colspan='2'>Criminal Does Not Exist</td></tr>");
                            out.println("</table>");
                        }
                    }catch(NumberFormatException e){
                        out.println("<script>alert('Please input a valid number'); window.location.href = 'update_criminal.html';</script>");
                    }  
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
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
