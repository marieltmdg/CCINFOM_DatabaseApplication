<%-- 
    Document   : update_transfer_criminal
    Created on : Nov 12, 2024, 9:36:47 PM
    Author     : nathanaelian
--%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@ page import="java.time.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Criminal Transfer</title>
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
            <p class="main-text" id="garamond">Criminal Transfer</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <!-- Start the JS code here: -->
                <%
                    String criminal_code = request.getParameter("criminal_code");
                    String new_Jail_Code = request.getParameter("jail_code");
                    String old_Jail_Code = request.getParameter("old_jail_code");
                    String date_Committed = request.getParameter("date_committed");

                    int criminalCode = Integer.parseInt(criminal_code);
                    int oldJailCode = Integer.parseInt(old_Jail_Code);
                    int newJailCode = Integer.parseInt(new_Jail_Code);
                    
                    Jails jail = new Jails();
                    jail.jail_code = newJailCode;
                    int check = jail.checkExistsAndNotDeleted();

                    if (new_Jail_Code != null && check == 1) {
                        try {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            java.util.Date date = sdf.parse(date_Committed); 
                            int cjhResult;
                            IncarcerationHistory cjh = new IncarcerationHistory();
                            cjh.criminal_code = criminalCode;
                            cjh.jail_code = oldJailCode;
                            cjh.status = "Transferred";
                            int doesExist = cjh.checkExists();
                            if (doesExist == 1){
                                cjhResult = cjh.addRecordWith();
                            } else {
                                cjh.start_date = new java.sql.Date(date.getTime());
                                cjhResult = cjh.addRecordWithout();
                            }

                            Criminal criminal = new Criminal();
                            criminal.criminal_code = criminalCode;
                            criminal.jail_code = newJailCode;
                            int crimUpdateResult = criminal.updateCriminalJailCode();

                            if (cjhResult == 1 && crimUpdateResult == 1){
                                String result[] = criminal.retrieveCriminal();       
                                out.println("<table>");
                                out.println("<thead>");
                                out.println("<tr><th colspan='2' style='color: white; font-weight: bold;'>Criminal Transferred Successfully!</th></tr>");
                                out.println("</thead>");
                                out.println("<tbody>");
                                out.println("<tr><td>Criminal Code:</td><td>" + result[0] + "</td></tr>");
                                out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                out.println("<tr><td>Total Sentence:</td><td>" + result[3] + "</td></tr>");
                                out.println("<tr><td>Jail Code:</td><td>" + result[4] + "</td></tr>");
                                out.println("</tbody>");
                                out.println("</table>");
                            } else {
                                out.println("<script>alert('Update Unsuccessful.'); window.location.href = 'index.html';</script>");
                            }


                        } catch (NumberFormatException e) {
                            out.println("<script>alert('Input format error.'); window.location.href = 'index.html';</script>");
                        }
                    } else {
                        out.println("<script>alert('Invalid input. Possible Reason: Jail was deleted.'); window.location.href = 'index.html';</script>");
                    }
                %>
                <button class="button" id="roboto" onclick="window.location.href='index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>

