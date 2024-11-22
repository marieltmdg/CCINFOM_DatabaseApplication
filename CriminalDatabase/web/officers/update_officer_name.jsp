<%-- 
    Document   : update_officer_name
    Created on : Nov 17, 2024, 9:58:59 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.Officer" %>
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
        <title>Update Officer Name</title>
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
            <p class="main-text" id="garamond">Update Officer Name</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    String officerBadgeNumber = request.getParameter("badge_number");
                    String newFirstName = request.getParameter("first_name");
                    String newLastName = request.getParameter("last_name");

                    if (officerBadgeNumber != null) {
                        try {
                            int badgeNumber = Integer.parseInt(officerBadgeNumber);
                            Officer officer = new Officer();
                            officer.badge_number = badgeNumber;
                            int check = officer.checkExistsAndNotDeleted();

                            if (check == 1) {
                                if (newFirstName != null && !newFirstName.isEmpty()) {
                                    officer.first_name = newFirstName;
                                }
                                if (newLastName != null && !newLastName.isEmpty()) {
                                    officer.last_name = newLastName;
                                }

                                int updateResult = officer.updateOfficerName();
                                if (updateResult == 1) {
                                    String[] result = officer.retrieveOfficer();
                                    out.println("<table>");
                                    out.println("<tr><th colspan='2'>Success! Officer Name Updated</th></tr>");
                                    out.println("<tr><th>Badge Number</th><td>" + badgeNumber +"</td></tr>");
                                    out.println("<tr><th>First Name</th><td>" + result[1] +"</td></tr>");
                                    out.println("<tr><th>Last Name</th><td>" + result[2] +"</td></tr>");
                                    out.println("<tr><th>Start Date of Assignment</th><td>" + result[3] +"</td></tr>");
                                    out.println("<tr><th>Active</th><td>" + result[4] +"</td></tr>");
                                    out.println("<tr><th>Jail Code</th><td>" + result[5] +"</td></tr>");
                                    out.println("</table>");
                                } else {
                                    out.println("<table>");
                                    out.println("<tr><td colspan='2'>Failed to Update Officer Name</td></tr>");
                                    out.println("</table>");
                                }
                            } else {
                                out.println("<table>");
                                out.println("<tr><td>Officer Record Not Found</td></tr>");
                                out.println("</table>");
                                out.println("<form action='add_officer.html' method='post'>");
                                out.println("<div class='button-container'>");
                                out.println("<input type='submit' value='Add Officer' id='roboto' class='button'>");
                                out.println("</div>");
                                out.println("</form>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Invalid input format. Please enter a valid number.'); window.location.href = 'update_officer.html';</script>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<tr><td colspan='2'>Badge Number is Required</td></tr>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
