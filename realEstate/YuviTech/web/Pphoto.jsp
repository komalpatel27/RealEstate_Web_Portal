
<%@page import="java.io.*,java.sql.*" %>
    <%
       try 
       {
         ServletOutputStream sout = response.getOutputStream();
         String n=request.getParameter("n");
         int n1 =Integer.parseInt(n);
         Blob photo;
         byte data[];
         ResultSet rs = db.DBConnect.getPropImage(n1);
         if(rs.next())
         {
            photo = rs.getBlob(1);
            data = photo.getBytes(1,(int)photo.length());
            sout.write(data); 
            sout.flush(); 
            sout.close();                                    
         }
         }catch(Exception ex) {}
    %>