<%@include file="Header.jsp"%>
<body bgcolor="lightyellow">
    <s:head theme="ajax"/>
     <div  id="frdesign" align="center" style="margin-top: 160px;margin-left: 150px; position: static; float: center;height: 250px;">
    <s:form action="Validate.action" validate="true" >
  <s:hidden name="ctr" value="2"/>
 <s:textfield label="Enter your verification code" name="vcode" size="15" required="true"/>
  <s:submit value="Register" />

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
     <s:property value="msg"/> 
    </s:form>
     </div>
      <%@include file="Footer.jsp"%>
</body>