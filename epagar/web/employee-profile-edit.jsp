<%-- 
    Document   : index
    Created on : 13 Jan, 2020, 10:37:59 PM
    Author     : akshay
--%>

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
         <%@ include file="includes/faculty-header.jsp" %>
        
            <div class="section">
                <div class="container">
                    <div class="col-md-12"><br><br></div>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <center><label style="font-size: 20px; color:#000 ">Update my Profile</label></center>
                                <form class="form-horizontal" action="">
                                <hr style="margin: 5px">
                                <br>
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px;  margin-bottom: 10px;">
                                    <b>Personal Details</b>
                                </div><br><br>
                                
                                <div class="col-md-3">
                                    <label>Name</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Mobile no</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                
                                
                                <div class="col-md-3">
                                    <label>Email ID</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12" style="background-color:#e19400; color:#fff; padding: 5px; margin-bottom: 10px;">
                                    <b>Professional Details</b>
                                </div><br><br>
                                <div class="col-md-3">
                                    <label>DOB</label>
                                    <input type="date" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                <div class="col-md-3">
                                    <label>Branch</label>
                                    <select class="form-control">
                                        <option>Computer</option>
                                    </select>
                                </div>
                                 <div class="col-md-3">
                                    <label>Qualification</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-3">
                                    <label>Designation</label>
                                    <input type="text" class="form-control" name="" style="margin-bottom:5px;"/>
                                </div>
                                
                                <div class="col-md-12">
                                    <br><br>
                                    <div class="form-group"> 
                                          <div class=" col-sm-12 text-center">
                                            <button type="submit" class="btn btn-success">Update</button>
                                            <button type="reset" class="btn btn-warning">Cancel</button>
                                          </div>
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
