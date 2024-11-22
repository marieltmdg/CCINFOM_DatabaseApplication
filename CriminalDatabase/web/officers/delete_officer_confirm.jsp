<%-- 
    Document   : confirm_delete_officer
    Created on : Nov 18, 2024, 1:17:48 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Delete Officer Record</title>
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <div class="bg-image">
            <img src="../src/vigan.jpg">
        </div>
        <div class="bg-gradient"></div>
        <div class="top-bar">
            <img src="../src/pnp-logo.png" class="logo">
            <p class="header-text" id="garamond">Philippine <br> National Police </p>
        </div>
        <div class="text-bar">
            <p class="main-text" id="garamond">Confirm Delete Officer Record</p>
        </div>

        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    String badgeNumber = request.getParameter("badge_number");
                    if (badgeNumber != null) {
                        try {
                            int badgeNum = Integer.parseInt(badgeNumber);
                            Officer officer = new Officer();
                            officer.badge_number = badgeNum;
                            int result = officer.deleteOfficerSoft();

                            if (result == 1) {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Officer Deleted Successfully</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td><strong>Badge Number:</strong></td><td>" + badgeNum + "</td></tr>");
                                out.println("<tr><td colspan='2'>The officer has been deleted from the system.</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white;'>Failed to Delete Officer</th></tr>");
                                out.println("</thead>");
                                out.println("</table>");
                            }
                        } catch (Exception e) {
                            out.println("<script>alert('Error: " + e.getMessage() + "); window.location.href = 'delete_officer.html';</script>");
                        }
                    } else {
                        out.println("<table>");
                        out.println("<thead>");
                        out.println("<tr><th colspan='2' style='color: white;'>Badge Number Missing</th></tr>");
                        out.println("</thead>");
                        out.println("<tbody>");
                        out.println("<tr><td colspan='2'>Badge number is required to delete the officer</td></tr>");
                        out.println("</tbody>");
                        out.println("</table>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div>
        </div>
    </body>
</html>
