<%@include file="Header.jsp"%>
<body bgcolor="lightyellow">
    <s:head theme="ajax"/>
    
   <link rel="stylesheet" href="abc.css"/>
    <div  style="height: 250px">
    <div  id="frdesign" style=" width: 37%; height: 250px; float: left; background-color:gainsboro;border-radius: 20px;  ">
        <img src="images/forget1.png" width="100%" height="250px" style="border-radius: 20px;" />
    </div>    

    <div class="outer" style="height: 250px"> 
   
      <div  align="center">
    
       <h1 color="red">Forget Passward </h1>
          <s:property value="msg"/>
          <s:property value="msg1"/>
    <s:form action="FPass" validate="true"  >
    <table>
    <tr><td><s:hidden name="ctr" value="6"/>
    <%=session.getAttribute("qa")%> </td><td><input type="text"label="" name="sa" size="15" required="true"/></td></tr>
    <tr><td><s:textfield name="email" label="Your Email id"/></td>
    <td><s:submit value="Search" /></td>
    </tr>
    </table>
    
    </s:form>
        </div>
    </div>
    <%@include file="Footer.jsp"%>
  </body>