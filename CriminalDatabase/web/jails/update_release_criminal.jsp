<%-- 
    Document   : update_free_criminal
    Created on : Nov 17, 2024, 8:27:57 AM
    Author     : nathanaelian
--%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="criminalmanagement.*" %>
<%@ page import="java.time.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Releasing of Criminal</title>
    </head>
    <body>
        <h1>Release Criminal</h1>
        <%
            String criminal_code = request.getParameter("criminal_code");
            String old_Jail_Code = request.getParameter("old_jail_code");
            String date_Committed = request.getParameter("date_committed");
            
            int criminalCode = Integer.parseInt(criminal_code);
            int oldJailCode = Integer.parseInt(old_Jail_Code);         
            
            try {
                int cjhResult;
                IncarcerationHistory cjh = new IncarcerationHistory();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf.parse(date_Committed); 
                cjh.criminal_code = criminalCode;
                cjh.jail_code = oldJailCode;
                cjh.status = "Released";
                int doesExist = cjh.checkExists();
                if (doesExist == 1){
                    cjhResult = cjh.addRecordWith();
                } else {
                    cjh.start_date = new java.sql.Date(date.getTime());
                    cjhResult = cjh.addRecordWithout();
                }
                    
                Criminal criminal = new Criminal();
                criminal.criminal_code = criminalCode;
                criminal.jail_code = -1;
                int crimUpdateResult = criminal.updateCriminalJailCode();
                    
                if (cjhResult == 1 && crimUpdateResult == 1){
                    out.println("<p>Released Criminal Successfully</p>");    
                        
                    String result[] = criminal.retrieveCriminal();
                    out.println("<p>Updated Details</p>");
                    out.println("<p>Criminal Code: " + result[0] +"</p>");
                    out.println("<p>First Name: " + result[1] +"</p>");
                    out.println("<p>Last Name: " + result[2] +"</p>");
                    out.println("<p>Total Sentence: " + result[3] +"</p>");
                    out.println("<p>Jail Code: " + result[4] +"</p>");
                } else {
                    out.println("<p>Update Unsuccessful.</p>");
                }
                    
                
            } catch (NumberFormatException e) {
                out.println("<p>Error</p>");
            }
        %>
    </body>
</html>

