<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Pagar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@ include file="includes/employee-header.jsp" %>
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br></div>
                    <<b><h1 style="font-size:5vw; color:darkslateblue; font-family:courier,serif"> About us</h1>
                    <div class="col-lg-12 text-justify">
                       <h2 style="font-size: 2vw; color:grey; font-family:courier,serif" E-pagar book and attendance system is a platform that provides interface between Employee and Company. <br>The administrator plays an important role in our project. Administrators logging may also put attendance of employee. <br>They can add employee logins and updating. System provide the feature of sending File related to companies to selected employee. <br>They also set a notification to stay update about works in companies. 
                        
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>