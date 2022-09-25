<%
                        String uri = request.getRequestURI();
                        String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>
<div class=""  style=" display: inline-block; width: 100%;     background-color: #fffde8;">
            <div class="col-md-4">
                <!--<center><img src="images/dte_logo.gif" style="width: 100px"/></center>-->
            </div>
            <div class="col-md-12">
                
                <center>
                    <h3><b>Online E-Pagar System</b></h3>
            </div>
            <div class="col-md-4"></div>
        </div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                
                <ul class="nav navbar-nav">
                    <li class='<% if(pageName.equals("admin-home.jsp")){ out.println("active"); } %>'><a href="admin-home.jsp">Home</a></li>
                    <li class='dropdown'>
                        <a  href="admin-employees.jsp">Employees </a></a>
                           
                    </li>
                    <li class='<% if(pageName.equals("admin-files.jsp")){ out.println("active"); } %>'><a href="admin-files.jsp">Files</a></li>
                    <li class='<% if(pageName.equals("admin-notifications.jsp")){ out.println("active"); } %>'><a href="admin-notifications.jsp">Notifications</a></li>
                    <li class='<% if(pageName.equals("admin-attendance.jsp")){ out.println("active"); } %>'><a href="admin-attendance.jsp">Attendance</a></li>
                    <li class='<% if(pageName.equals("admin-payment.jsp")){ out.println("active"); } %>'><a href="admin-payment.jsp">Payments</a></li>
                    <li class='<% if(pageName.equals("admin-password.jsp")){ out.println("active"); } %>'><a href="admin-password.jsp">Change Password</a></li>
                    <li class=''><a href="index.jsp">Logout</a></li>
                </ul>
            </div>
        </nav>