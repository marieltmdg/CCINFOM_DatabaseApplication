<%-- 
    Document   : add_crime
    Created on : Nov 16, 2024, 8:40:55 PM
    Author     : paolocruzado
--%>
<%@ page import="criminalmanagement.Crimes" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Crime</title>
    </head>
    <body>
        <h2>Add Crime</h2>
        <h2>Add Crime Record</h2>
        <%
            String crimeType = request.getParameter("crime_type");
            String sentenceStr = request.getParameter("sentence");
            String criminalCodeStr = request.getParameter("criminal_code");
            String badgeNum = request.getParameter("badgeNum");
            String date = request.getParameter("date");

            if (crimeType != null && sentenceStr != null && criminalCodeStr != null && badgeNum != null && date != null) {
                try {
                    int sentence = Integer.parseInt(sentenceStr);
                    int criminalCode = Integer.parseInt(criminalCodeStr);
                    
                    Crimes crime = new Crimes();
                    crime.crime_type = crimeType;
                    crime.badge_number = Integer.parseInt(badgeNum);
                    crime.date = date;
                    crime.sentence = sentence;
                    crime.criminal_code = criminalCode;

                    boolean success = crime.addCrime();
                    
                    if (success) {
                        out.println("<script>alert('Crime added successfully!'); window.location.href = '../index.html';</script>");
                    } else {
                        out.println("<script>alert('Failed to add crime. Please try again.'); window.location.href = '../index.html';</script>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Invalid input.'); window.location.href = '../index.html';</script>");
                }
            } else {
                out.println("<script>alert('All fields are required.'); window.location.href = '../index.html';</script>");
            }
        %>
    </body>
</html>
