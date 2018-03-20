<%@page import="java.sql.*"%>  
<%@page import="java.util.*" %>
<table border="0" align="left" style="margin-left: -2px;">
    <tr>
        <td>
         <%

   CallableStatement cs;
   String st=request.getParameter("t");
   out.println("<select name=\'state_name\' onchange=\"\"><option value=\'-1\'>Select State </option>");
   List<String> l1=new ArrayList<String>();   
   try
        {
            String val;
            ResultSet rs=db.DBConnect.connect().createStatement().executeQuery("select * from tblstate order by 1"); 
            
            while(rs.next())
            {
               %>
    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
    <%        }
                    
        }
        catch(Exception e){}
 %>
   
        </td>
    </tr>
</table>
