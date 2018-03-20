<%@include  file="Header.jsp"%>
<s:head theme="ajax"/>
<body bgcolor="lightyellow">
                     
    <div  id="frdesign" align="center" style="margin-left: 400px; position: static; float: center;" > <h1 style="color: red">   </h1>
        <s:form action="PChange" validate="true">
      <s:hidden name="ctr" value="3"/>
     
      <s:textfield name="email" label="please enter your email id"/>
   
    <s:submit value="submit" align="center"/>
</s:form>
    </div>
    <%@include file="Footer.jsp"%>
</body>