
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
                <div class="">
                    <div class="col-md-12">
                        <center><label style="font-size: 20px; color:#000 ">My Attendance</label></center>
                        <hr>
                            <div class="col-md-12">
                               <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Date</th><th>Status</th>
                                    </tr>
                                    <%
                                    Database db=new Database();
                                    String suselogid=(String)session.getAttribute("userlogin");
                                    ResultSet rs=db.getEmployeeAttendance(suselogid);
                                    int i=1;
                                    while(rs.next())
                                    {
                                        String status =rs.getString("status");
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=rs.getString("date")%></td><td><%=status%></td>
                                       
                                    </tr>
                                    <%
                                    }
                                    %>
                                </table>
                            </div>
                  
                        </div>  
                </div>
            </div>
            <%@ include file="includes/footer.jsp" %>
    </body>
</html>
<script>
    $("#yearsem").change(function(){
   var yrsem=this.value;
   
   $.ajax({
       url:"includes/WebService.jsp",
       method:"POST",
       data:{"action":"getSubjectsByYearSemId","yearsemid":yrsem},
       success:function(res){
          // alert(res);
           $("#subject").html(res);
       }
   });
});
    </script>