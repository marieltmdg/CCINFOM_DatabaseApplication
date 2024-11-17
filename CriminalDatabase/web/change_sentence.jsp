<%@ page import="criminalmanagement.Crimes" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Crime Sentence</title>
</head>
<body>
    <h2>Update Crime Sentence</h2>
    <%
        String code = request.getParameter("crime_code");
        String sentence = request.getParameter("additional_sentence");

        if (code != null && sentence != null) {
            try {
                int crimeCode = Integer.parseInt(code);
                int additionalSentence = Integer.parseInt(sentence);

                Crimes crime = new Crimes(crimeCode, additionalSentence);
                boolean success = crime.changeSentence();

                if (success) {
                    out.println("<p>Success</p>");
                } else {
                    out.println("<p>Fail</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p>Invalid input. Please enter numeric values.</p>");
            }
        } else {
            out.println("<p>Please fill all fields.</p>");
        }
    %>
</body>
</html>
