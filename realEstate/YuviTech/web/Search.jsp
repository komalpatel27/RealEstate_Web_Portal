 <%
   
       String clt2=(String)session.getAttribute("clt");
       if(clt2!=null)
          {
          
       if(clt2.equalsIgnoreCase("Admin"))
        {
           %>
           <%@include file="ahead.jsp"%>
           <%
         }
        else
       {
           %>
           <%@include file="Header.jsp"%>
           <%
       }
      
           }
        else
       {
           %>
           <%@include file="Header.jsp"%>
           <%
       }
       
    
%>

<head>
<s:head theme="ajax"/>
<link rel="stylesheet" href="css/abc.css"/>
<script>
        ctr=0;
    function validateForm()
    {
      var s=document.getElementById("abc");
       var r=document.getElementById("abc1");
        var b=document.getElementById("abc2");
      
            if(!r.checked && !s.checked && !b.checked )
            {
                 alert(' Please select the Property Category');
                 
            }
         
       
        

       var x=document.forms["search"]["property_type"].value;
       if (x==null || x=="")
       {
          alert(" Select the Property type  ");
          return false;
       }
         
       var z=document.forms["search"]["city_name"].value;
       if (z==null || z=="")
       {
           alert(" Select the state and city name ");
           return false;
       }
       var y=document.forms["search"]["start_price"].value;
       if (y==null || y=="")
       {
           alert(" please select the min price ");
           return false;
       }
       var marea=document.forms["search"]["start_area_in_feet"].value;
       if (marea==null || marea=="")
       {
          alert(" please select the min area ");
          return false;
       }
       var marea1=document.forms["search"]["end_area_in_feet"].value;
       if (marea1==null || marea1=="")
       {
          alert(" please select the max area ");
          return false;
       }
       var bed=document.forms["search"]["number_of_bedroom"].value;
       if (bed==null || bed=="")
       {
          alert(" please select the bedroom ");
          return false;
       }
    }
</script>
</head>
<body bgcolor="lightyellow">
    <div>
        <div style="float: left;margin-left: 50px;">
            <img src="images/searchp1.jpg" style="height: 300px;width: 350px;"/>
            </div>
        <div class="outer" style="margin-bottom: 10px;">
        
       <div align="center"> <h1>  Search Property</h1>
           <s:property value="msg"/>
           <s:form name="search" action="Search.action" onsubmit="return validateForm()">
         <s:hidden name="ctr" value="1"/>
          <%--<s:radio name="prop_category" id="radio" label="property catagary" list="{'Sale','Rent','Buy'}"/> --%>   
        <input type="radio" name="prop_category" id="abc" value="Sale"/>  Sale
       <input type="radio" name="prop_category" id="abc1" value="Rent"/>   Rent
          <input type="radio" name="prop_category" id="abc2" value="Buy"/> Buy
         <s:textfield name="start_price" value="" label="min price"/>
               <s:textfield name="end_price" value="" label="max price"/>
               <s:select name="number_of_bedroom"  value="" required="true" headerKey="" headerValue="select bedroom" label="Bedroom" list="{'1','2','3','4','5','6'}"/> 
               <s:select  name="state_name" required="true" headerKey="all" headerValue="all" label="State" list="stateList"/>
               <s:select name="city_name" id="cty" required="true" headerKey="all" headerValue="all" label="City" list="cityList"/>
               <s:textfield name="start_area_in_feet" value="" label="min area"/>
               <s:textfield name="end_area_in_feet" value="" label="max area"/>
               <s:select name="property_type" label="property type1" list="{'Residential','Commercial'}"/>          
               <s:submit value="Search"/>
     </s:form>
    </div>
    </div>
    </div>
         <%@include file="Footer.jsp"%>
 </body>