<%-- 
    Document   : incarceration_density_report
    Created on : Nov 20, 2024, 8:36:05 AM
    Author     : nathanaelian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="criminalmanagement.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incarceration Density Report</title>
    </head>
    <body>
        <h2>Incarceration Density Report</h2>
        <%
            String month = request.getParameter("month");
            String year = request.getParameter("year");
               
            System.out.println(year);
            System.out.println(month);
            
            Jails jail = new Jails();
            int nMonth = Integer.parseInt(month);
            int nYear = Integer.parseInt(year);
            List<String[]> jails1 = jail.generateReportOfficerPart(nYear, nMonth);
            List<String[]> jails2 = jail.generateReportCriminalPart(nYear, nMonth);
            
            if (jails1 == null || jails1.isEmpty() || jails2 == null || jails2.isEmpty()) {
                out.println("<p>No jails found matching the criteria.</p>");
            } else {
                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Jail Code</th><th>Area of Jurisdiction</th><th>Number of Officers</th><th>Number of Criminals</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

//                for (String[] jailData : jails1) {
//                    out.println("<tr>");
//                    out.println("<td>" + jailData[0] + "</td>");
//                    out.println("<td>" + jailData[1] + "</td>");
//                    out.println("<td>" + jailData[2] + "</td>");
//                    out.println("</tr>");
//                }
                
                if (jails1.size() >= jails2.size()){
                    for (int i = 0; i < jails1.size(); i++) {
                        if (i < jails2.size()){
                            out.println("<tr>");
                            out.println("<td>" + jails1.get(i)[0] + "</td>");
                            out.println("<td>" + jails1.get(i)[1] + "</td>");
                            out.println("<td>" + jails1.get(i)[2] + "</td>");
                            out.println("<td>" + jails2.get(i)[2] + "</td>");
                            out.println("</tr>");
                        } else {
                            out.println("<tr>");
                            out.println("<td>" + jails1.get(i)[0] + "</td>");
                            out.println("<td>" + jails1.get(i)[1] + "</td>");
                            out.println("<td>" + jails1.get(i)[2] + "</td>");
                            out.println("<td>" + 0 + "</td>");
                            out.println("</tr>");
                        }
                    }
                } else {
                    for (int i = 0; i < jails2.size(); i++) {
                        if (i < jails1.size()){
                            out.println("<tr>");
                            out.println("<td>" + jails2.get(i)[0] + "</td>");
                            out.println("<td>" + jails2.get(i)[1] + "</td>");
                            out.println("<td>" + jails1.get(i)[2] + "</td>");
                            out.println("<td>" + jails2.get(i)[2] + "</td>");
                            out.println("</tr>");
                        } else {
                            out.println("<tr>");
                            out.println("<td>" + jails2.get(i)[0] + "</td>");
                            out.println("<td>" + jails2.get(i)[1] + "</td>");
                            out.println("<td>" + 0 + "</td>");
                            out.println("<td>" + jails2.get(i)[2] + "</td>");
                            out.println("</tr>");
                        }
                    }
                }
               
                
//                for (String[] jailData : jails2) {
//                    out.println("<tr>");
//                    out.println("<td>" + jailData[0] + "</td>");
//                    out.println("<td>" + jailData[1] + "</td>");
//                    out.println("<td>" + jailData[2] + "</td>");
//                    out.println("</tr>");
//                }

                out.println("</tbody>");
                out.println("</table>");
            }
        %>
    </body>
</html>
