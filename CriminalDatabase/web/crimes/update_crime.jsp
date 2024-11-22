<%@ page import="criminalmanagement.Crimes" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Crime Sentence</title>
</head>
<body>
    <h2>Update Crime Sentence</h2>
    <%
        String crimeCodeStr = request.getParameter("crimeCode");
        String crimeType = request.getParameter("crimeType");
        String dateCommittedStr = request.getParameter("dateCommitted");

        if (crimeCodeStr != null && crimeType != null && dateCommittedStr != null) {
            try {
                int crimeCode = Integer.parseInt(crimeCodeStr);
                Date dateCommitted = Date.valueOf(dateCommittedStr); 

                Crimes crimes = new Crimes();
                boolean isUpdated = crimes.updateCrime(crimeCode, crimeType, dateCommitted);

                if (isUpdated) {
                    out.println("<script>alert('Crime record successfully updated.'); window.location.href = '../index.html';</script>");
                } else {
                    out.println("<script>alert('Failed to update the crime record. Please check the data.'); window.location.href = '../index.html';</script>");
                }
            } catch (Exception e) {
                out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href = '../index.html';</script>");
            }
        } else {
            out.println("<script>alert('All fields are required'); window.location.href = '../index.html';</script>");
        }
    %>
</body>
</html>
