<%@page import="database.Database"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
   String UPLOAD_DIRECTORY = "/uploads";
    
    String saveFile =new String();
    String contentType=request.getContentType();
    
    if((contentType!=null) && (contentType.indexOf("multipart/form-data")>=0)){
        DataInputStream in=new DataInputStream(request.getInputStream());
        int formDataLength=request.getContentLength();
        byte dataBytes[]=new byte[formDataLength];
        int byteRead=0;
        int totalBytesRead=0;
        
        while(totalBytesRead<formDataLength)
        {
            byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
            totalBytesRead+=byteRead;
        }
        
        String file=new String(dataBytes,"CP1256");
        
        saveFile=file.substring(file.indexOf("filename=\"")+ 10);
        saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
        saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
        
        int lastIndex=contentType.lastIndexOf("=");
        String boundary=contentType.substring(lastIndex+1, contentType.length());
        
        int pos;
        pos=file.indexOf("filename=\"");
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        
        int boundaryLocation=file.indexOf(boundary,pos);
        
        int startPos=((file.substring(0,pos)).getBytes("CP1256")).length;
        int endPos=((file.substring(0,boundaryLocation)).getBytes("CP1256")).length;
        
        String saveFile1="/root/Documents/PRO/epagar/web/uploads/"+saveFile;
        File ff=new File(saveFile1);
        
        try{
//            System.out.print(saveFile1);
            FileOutputStream fileout=new FileOutputStream(ff);
            fileout.write(dataBytes,startPos,(endPos-startPos));
            fileout.flush();
            Database db=new Database();
            int userid=Integer.parseInt((String)session.getAttribute("empid"));
            boolean res=db.addFiles(userid,saveFile);
            System.out.println(res);
            if(res){
                response.sendRedirect("../admin-files.jsp?status=1");
            }else{
                response.sendRedirect("../admin-files.jsp?status=0");
            }
        }catch(Exception e){
            System.out.println(e);
        }
    }
%>