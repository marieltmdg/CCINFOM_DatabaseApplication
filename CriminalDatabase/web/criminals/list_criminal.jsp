<%-- 
    Document   : view_criminal
    Created on : 18 Nov 2024, 11:35:06 am
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
        <title>List of Criminals</title>
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
            <p class="main-text" id="garamond">List of Criminals</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <table border="1">
                    <thead>
                        <tr>
                        <td>Criminal Code</td>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td>Total Sentence</td>
                        <td>Jail Code</td>
                        <td>Deleted</td>
                        </tr>
                    </thead>
                    <%
                        Criminal criminal = new Criminal();
                        int cCodeStart = Integer.parseInt(request.getParameter("cCodeStart"));
                        int cCodeEnd = Integer.parseInt(request.getParameter("cCodeEnd"));
                        int tsStart = Integer.parseInt(request.getParameter("tsStart"));
                        int tsEnd = Integer.parseInt(request.getParameter("tsEnd"));
                        int jcStart = Integer.parseInt(request.getParameter("jcStart"));
                        int jcEnd = Integer.parseInt(request.getParameter("jcEnd"));

                        if("-1".equals(request.getParameter("cCodeEnd")))   cCodeEnd=criminal.getMax(1);
                        if("-1".equals(request.getParameter("tsEnd")))      tsEnd=criminal.getMax(2);
                        if("-1".equals(request.getParameter("jcEnd")))      jcEnd=criminal.getMax(3);

                        List<Map<String, Object>> criminals = criminal.listCriminals(cCodeStart, cCodeEnd, tsStart, tsEnd, jcStart, jcEnd);

                        // Iterate through the list and display each row in the table
                        for (Map<String, Object> row : criminals) {
                    %>
                    <tr>
                        <td><%= row.get("criminal_code") %></td>
                        <td><%= row.get("first_name") %></td>
                        <td><%= row.get("last_name") %></td>
                        <td><%= row.get("total_sentence") %></td>
                        <td><%= row.get("jail_code") %></td>
                        <td><%= row.get("deleted") %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>