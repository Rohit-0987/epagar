

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
         <%@ include file="includes/admin-header.jsp" %>
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br>
                    <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    
                                                    if(status.equals("2"))
                                                    {
                                                        out.println("<div class='text-center' style='color:red'>File Deleted successfully!</div>");
                                                    }
                                                    
                             }
                    catch(Exception e){}
                                    %>
                    </div>
                    <div class="col-lg-7">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Files</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <table class="table">
                                    <tr>
                                        <th>Sr.No.</th><th>Employee name</th><th>File</th><th>Action</th>
                                    </tr>
                                     <%
                                         int i=1;
                                    Database db=new Database();
                                    ResultSet rs=db.getFiles();
                                    while(rs.next())
                                    {
                                        int employee_id=rs.getInt("employee_id");
                                        ResultSet employee= db.getEmployeeById(employee_id);
                                        employee.next();
                                    %>
                                    <tr>
                                        <td><%=i++%></td><td><%=employee.getString("name")%></td><td><a target="_blank" href="uploads/<%=rs.getString("file")%>"><%=rs.getString("file")%></a></td>
                                    <td>
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post">
                                                    <input type="hidden" name="action" value="delete"/>
                                                    <input type="hidden" name="table" value="files"/>
                                                    <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                    <button type="submit" class="btn btn-danger btn-xs" >Remove</button>
                                                </form>
                                        </td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                 <%

                    try{
                                    String status=" ";
                                status=request.getParameter("status");
                                                    if(status.equals("1"))
                                                    {
                                                        out.println("<div class='text-center' style='color:green'>File send successfully!</div>");
                                                    }
                             }
                    catch(Exception e){}
                                    %>
                                <center><label style="font-size: 20px; color:#000 ">Send New File</label></center>
                                <hr style="margin: 5px">
                                <br>
                                <div class="form-group"> 
                                          
                                              <label class="control-label">Employee</label>
                                              <select class="form-control" name="employee" id="employee" required="true">
                                                  <option value="">Select employee</option>
                                                  <%
                                                    ResultSet resy=db.getEmployees();
                                                    while(resy.next()){
                                                    %>
                                                    <option value="<%=resy.getInt("id")%>"><%=resy.getString("name")%></option>
                                                    <%
                                                        }
                                                    %>
                                              </select>
                                        </div>
                                <form class="form-horizontal" action="includes/uploadFile.jsp" enctype="multipart/form-data" method="post">
                                        
                                      
                                        <div class="form-group"> 
                                          
                                          <div class="col-sm-12"> 
                                              <label class="control-label">Select File</label>
                                            <input type="file"  name="file" required="true" class="form-control">
                                          </div>
                                        </div>
                                        <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
                                        </div>
                                    
                                      </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <%@ include file="includes/footer.jsp" %>
    </body>
</html>

<script>
    $("#employee").change(function(){
   var employee=this.value;
   
   $.ajax({
       url:"includes/WebService.jsp",
       method:"POST",
       data:{"action":"setemployeidesession","employeeid":employee},
       success:function(res){
           console.log(res);
       }
   });
});
    </script>
