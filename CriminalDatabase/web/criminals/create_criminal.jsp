<%-- 
    Document   : create_criminal
    Created on : Nov 5, 2024, 12:24:34 PM
    Author     : marie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Record Crime and Criminal</title>
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
            <p class="main-text" id="garamond">Record a Crime</p>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="output-box" id="output">
                <%
                    Criminal criminal = new Criminal();
                    Crimes crime = new Crimes();

                    String v_crime_type = request.getParameter("crime_type");
                    String v_sentence = request.getParameter("sentence");
                    String v_badge_number = request.getParameter("badge_number");
                    String v_date_committed =(request.getParameter("year") +"-"+ request.getParameter("month") +"-"+ request.getParameter("day"));

                    String v_criminal_code = request.getParameter("criminal_code");
                    String v_first_name = request.getParameter("first_name");
                    String v_last_name = request.getParameter("last_name");
                    String v_jail_code = request.getParameter("jail_code");

                    criminal.criminal_code = Integer.parseInt(v_criminal_code);
                    criminal.first_name = v_first_name;
                    criminal.last_name = v_last_name;
                    criminal.total_sentence = 0;
                    criminal.jail_code = Integer.parseInt(v_jail_code);

                    int criminalExists = criminal.checkExists();
                    if(criminalExists==0){
                        criminal.criminal_code = criminal.newCriminalCode();
                        int status = criminal.registerCriminal();
                        if(status==1){
                            String[] result = criminal.retrieveCriminal();
                            out.println("<table>");
                            out.println("<thead>");
                                out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>New criminal record created</td></tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                                out.println("<tr><td>Criminal Code:</td><td>" + criminal.criminal_code + "</td></tr>");
                                out.println("<tr><td>First Name:</td><td>" + result[1] + "</td></tr>");
                                out.println("<tr><td>Last Name:</td><td>" + result[2] + "</td></tr>");
                                out.println("<tr><td>Total Sentence:</td><td>" + result[3] + "</td></tr>");
                                out.println("<tr><td>Jail Code:</td><td>" + result[4] + "</td></tr>");
                            out.println("</tbody>");
                            out.println("</table>");
                        }else{
                            out.println("<table>");
                            out.println("<tr><td colspan='2'>Criminal does not exist but was failed to be recorded</td></tr>");
                            out.println("</table>");
                        }
                    }
                    
                    crime.criminal_code = criminal.criminal_code;
                    crime.crime_type = v_crime_type;
                    crime.badge_number = Integer.parseInt(v_badge_number);
                    crime.date = v_date_committed;
                    crime.sentence = Integer.parseInt(v_sentence);

                    boolean success = crime.addCrime();
                    if(success){
                        crime.crime_code = criminal.getMax(4);
                        ResultSet rst = crime.viewCrime();
                        if (rst != null && rst.next()) {
                            out.println("<table>");
                            out.println("<thead>");
                                out.println("<tr><td colspan='2' style='color: white; font-weight: bold;'>Crime Recorded</td></tr>");
                            out.println("</thead>");
                            out.println("<tbody>");
                                out.println("<tr><td>Crime Code: </td><td>" + rst.getString("Crime_Code") + "</td></tr>");
                                out.println("<tr><td>Crime Type: </td><td>" + rst.getString("Crime_Type") + "</td></tr>");
                                out.println("<tr><td>Badge Number: </td><td>" + rst.getString("Badge_Number") + "</td></tr>");
                                out.println("<tr><td>Date Committed: </td><td>" + rst.getString("Date_Committed") + "</td></tr>");
                                out.println("<tr><td>Sentence: </td><td>" + rst.getInt("Sentence") + "</td></tr>");
                                out.println("<tr><td>Criminal Code: </td><td>" + rst.getInt("Criminal_Code") + "</td></tr>");
                            out.println("</tbody>");
                            out.println("</table>");
                        } else {
                            out.println("<p>Crime not found.</p>");
                        }
                    }else{
                        out.println("<table>");
                        out.println("<tr><td colspan='2'>c.crime_code</td></tr>");
                        out.println("</table>");
                    }

                %>
                <button class="button" id="roboto" onclick="window.location.href='../index.html'" style="margin-top: 2vh; margin-bottom: 0px; width: 20%;">Back</button>
            </div> 
        </div>
    </body>
</html>
