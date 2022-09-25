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
                        <li class='<% if(pageName.equals("index.jsp")){ out.println("active"); } %>'><a href="index.jsp">Employee Login</a></li>
                        <li class='<% if(pageName.equals("admin-login.jsp")){ out.println("active"); } %>'><a href="admin-login.jsp">Admin Login</a></li>
                    </ul>
                
            </div>
        </nav>
                   
                    
