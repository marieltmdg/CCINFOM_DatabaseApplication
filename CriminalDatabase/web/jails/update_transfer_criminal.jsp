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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Criminal Transfer</title>
    </head>
    <body>
        <h1>Transfer Criminal</h1>
        <%
            String criminal_code = request.getParameter("criminal_code");
            String new_Jail_Code = request.getParameter("jail_code");
            String old_Jail_Code = request.getParameter("old_jail_code");
            String date_Committed = request.getParameter("date_committed");
            
            int criminalCode = Integer.parseInt(criminal_code);
            int oldJailCode = Integer.parseInt(old_Jail_Code);         
            
            if (new_Jail_Code != null) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date date = sdf.parse(date_Committed); 
                    int newJailCode = Integer.parseInt(new_Jail_Code);
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
                        out.println("<p>Success</p>");    
                        
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
            } else {
                out.println("<p>All fields are required.</p>");
            }
        %>
    </body>
</html>
