<%@page import="java.sql.*"%>  
<%@page import="java.util.*" %>
<table border="0" align="left" style="margin-left: -2px;">
    <tr>
        <td>
         <%

   CallableStatement cs;
   String st=request.getParameter("t");
   out.println("&nbsp;&nbsp;&nbsp;<select name=\'state_name\' onchange=\"showCity(this.value)\"><option value=\'-1\'>Select State </option>");
   List<String> l1=new ArrayList<String>();
   int i=0;     
   try
        {
            String val;
            ResultSet rs=db.DBConnect.connect().createStatement().executeQuery("select * from tblstate order by 1"); 
            
            while(rs.next())
            {i++;
               %>
            <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
            <%
            }
                    
        }
        catch(Exception e){}
 %>
   
        </td>
    </tr>
</table>
