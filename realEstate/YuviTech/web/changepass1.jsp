<%@include file="Header.jsp"%>
    <s:head theme="ajax"/>
    <link rel="stylesheet" href="css/abc.css"/>
    <div  style="height: 250px">
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/change.jpg" width="100%" height="250px" style="border-radius: 20px;" />
    </div>    

    <div class="outer"> 
    <div align="center">
        <s:form action="PChange" validate="true">
            
            
    <table>
        <s:hidden name="ctr" value="4"/>
    
 <tr><h1>Change Your Password</h1> 
 <h2 style="color: red"><s:property value="msg"/></h2>
     <td><s:textfield name="email" label="Enter Email id"/></td>
   <td><s:password name="op1" label="Old passward"/></td>
  <td> <s:password name="np" label="New Passward"/></td>
  <td><s:submit value="change" /></td>
   </tr>
        </table>
        </s:form>
    </div> 
    </div>
    <%@include file="Footer.jsp"%>