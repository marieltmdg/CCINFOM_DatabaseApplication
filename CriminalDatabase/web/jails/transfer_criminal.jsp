<%-- 
    Document   : transfer_criminal
    Created on : Nov 12, 2024, 1:59:06 PM
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
        <title>Transfer Criminal</title>
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
            <p class="main-text" id="garamond">Transfer Criminal</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String crimCode = request.getParameter("criminal_code");

                    if (crimCode != null){
                        try {
                            int criminalCode = Integer.parseInt(crimCode);
                            Criminal criminal = new Criminal();
                            criminal.criminal_code = criminalCode;
                            int check = criminal.checkExists(criminalCode);

                            if (check == 1) {
                                String[] res = criminal.retrieveCriminal();
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Criminal Exists</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Criminal Code:</td><td>" + crimCode + "</td></tr>");
                                out.println("<tr><td>First Name:</td><td>" + res[1] + "</td></tr>");
                                out.println("<tr><td>Last Name:</td><td>" + res[2] + "</td></tr>");
                                out.println("<tr><td>Total Sentence:</td><td>" + res[3] + "</td></tr>");
                                out.println("<tr><td>Jail Code:</td><td>" + res[4] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");

                                if (Integer.parseInt(res[4]) == -1){
                                    out.println("<script>alert('Criminal is freed. Cannot be transferred.'); window.location.href = 'index.html';</script>");
                                } else {
                                    out.println("<form action='update_transfer_criminal.jsp' method='post'>");
                                    out.println("<input type='hidden' name='criminal_code' value='" + criminalCode + "'>");
                                    out.println("<input type='hidden' name='old_jail_code' value='" + res[4] + "'>");
                                    out.println("<input type='hidden' name='date_committed' value='" + res[6] + "'>");
                                    out.println("<label for='jail_code' class='form-label'>New Jail Code:</label>");
                                    out.println("<input type='text' id='jail_code' name='jail_code' required class='form-input'><br>");
                                    out.println("<input type='submit' value='Transfer Criminal' class='button'>");
                                    out.println("</form>");
                                    out.println("<form action='update_release_criminal.jsp' method='post'>");
                                    out.println("<input type='hidden' name='criminal_code' value='" + criminalCode + "'>");
                                    out.println("<input type='hidden' name='old_jail_code' value='" + res[4] + "'>");
                                    out.println("<input type='hidden' name='date_committed' value='" + res[6] + "'>");
                                    out.println("<input type='submit' value='Release Criminal' class='button'>");
                                    out.println("</form>");
                                }


                            } else {
                                out.println("<script>alert('Criminal does not exist.'); window.location.href = 'index.html';</script>");
                            }
                        } catch (Exception e) {
                            out.println("<script>alert('Invalid input.'); window.location.href = 'index.html';</script>");
                        }
                    } else {
                        out.println("<script>alert('No input.'); window.location.href = 'index.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
