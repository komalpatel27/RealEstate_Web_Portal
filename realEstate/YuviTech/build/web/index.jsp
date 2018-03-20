<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<div style="background-image: url(images/backg.jpg)">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Real Estate</title>
<link rel="icon" href="images/img103.jpg"/>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="css/func.js"></script>
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery.simple_slider.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function(){
	jQuery('#test').simple_slider({
		'leftID': 'leftNav',
		'rightID': 'rightNav',
		'display': 4
	})
});
    var xmlHttp
    function showCity(str)
    {
      // xx = new XMLHttpRequest;
      if (window.ActiveXObject) // for Internet explorer
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      else //if (xx != "undefined") // for any browser excluding IE
        xmlHttp= new XMLHttpRequest(); // XML HTTP Request object design. 
      /*if (xmlHttp==null)
      {
        alert("Browser does not support XMLHTTP Request")
        return;
      }*/
      var url="city.jsp?t="+str;
      xmlHttp.onreadystatechange = myState;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
    }
    function myState()
    {
    //  alert(xmlHttp.readyState);  
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        document.getElementById("cty").innerHTML=xmlHttp.responseText
    }
    function showState()
    {
      // xx = new XMLHttpRequest;
      if (window.ActiveXObject) // for Internet explorer
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      else //if (xx != "undefined") // for any browser excluding IE
        xmlHttp= new XMLHttpRequest(); // XML HTTP Request object design. 
      /*if (xmlHttp==null)
      {
        alert("Browser does not support XMLHTTP Request")
        return;
      }*/
     var url="state.jsp";
      xmlHttp.onreadystatechange = state;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
    }
    function state()
    {
    //  alert(xmlHttp.readyState);      }

      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
        document.getElementById("state").innerHTML=xmlHttp.responseText;
    }
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
    <body onload="showState()">
        
                <%@page import="java.sql.*"%>  
<%@page import="java.util.*" %>
  
<div id="wrapper" align="center">
 <div id="container" align="center"  style="background-color:white;">
    <div id="headTop" style="background-color:whitesmoke;">
      <div style="float:left; margin:0 0 0 10px; padding:0; height:20px; font-size:13px;">Yuvitech Developer : Indian Property - The leading Indian Real Estate  site</div>
      <div style="float:right; margin:0 10px 0 0; padding:0; height:20px; font-size:13px;"><a href="Login.action">Login</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="AddStu.action">Register</a> </div>
    </div>
     <div id="clear"></div>
     <div id="header">
        <div id="logo"><img src="images/y.png" height="100px" width="250px" /></div>
        <div style="float:right; margin:10px; padding:0; width:auto"><img src="images/image12.gif" /> <img src="images/image34.gif" /></div>
        <div id="menu">
            <ul id="saturday">
                <li><a href="index.jsp" title="">&nbsp;&nbsp;Home&nbsp;&nbsp;</a></li>
            <li><a href="Search.action" title="">&nbsp;Search&nbsp;Property&nbsp;</a></li>
            <li><a href="ViewPList.jsp" title="">&nbsp;List&nbsp;Property&nbsp;</a></li>
            <li><a href="sendquotation.action" title="">&nbsp;Post&nbsp;Requirement&nbsp;</a></li>
            <li><a href="Upcoming.jsp" title="">Upcoming&nbsp;Project</a></li>
            <li><a href="Feedback.action" title="">Feedback</a></li>
            <li><a href="" title="">About&nbsp;Us</a></li>
            <li><a href="" title="" id="last">Contact&nbsp;Us</a></li>
          </ul>
        </div>
        <div id="circles">
          <ul>
            <li><a href="viewSearch2.jsp?t=0">Greater Noida</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=1">Noida</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=2">Delhi</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=3">Rajnagar</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=4">Rajnagar Extension</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=5">Ghaziabad</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=6">Gurgaon</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=7">Meerut</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=8">Hapur</a></li>
            <li>|</li>
            <li><a href="viewSearch2.jsp?t=8"><b><blink> New Offer</blink></b></a></li>
            
          </ul>
        </div>
      </div>
     <div id="content">
        <div id="search">
            <div id="searchMenu">
              <ul>
                  <li class="current"  id="li1" style="margin-left: 105px;">Search Property</li>
                         </ul>
          </div>
            <div id="search1" >
            <div id="box1" style="display:block;height:365px;">
                <s:form action="Search.action" name="search" onsubmit="return validateForm()" theme="simple" >
                    <s:hidden name="ctr" value="1"/>
                    <s:hidden name="type" value="Residential"/>
                    <table cellpadding="0" cellspacing="1" border="0" style="margin-left:305px;margin-top: -4px;">
                        <tr>
                            <td>
                                <%-- &nbsp;&nbsp;&nbsp;<s:radio name="prop_category" list="{'Buy','Rent','Sale'}" theme="simple"/>--%>
                                   &nbsp;&nbsp;&nbsp;  <input type="radio" name="prop_category" id="abc" value="Sale"/><b>Sale</b>
                                   <input type="radio" name="prop_category" id="abc1" value="Rent"/><b>Rent</b>
                                                       <input type="radio" name="prop_category" id="abc2" value="Buy"/><b>Buy</b>
     
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;<s:select name="property_type" headerKey="" headerValue="Select Property Type" list="{'Residential','Commercial'}" theme="simple"/>
                            </td>
                       </tr>
                       <tr colspan="2">

                           <td>
                              <table border="0" align="left" width="200">
                                  <tr>
                                      <td align="left">
                          
                                          <div id="state">
                                          </div>                                         
                                     </td>
                                  </tr>
                                  <tr>
                                      <td align="left">
                                          <div id="cty" style="margin-left:11px;">
                                                <s:select name="city_name" headerKey="" headerValue="Select City" list="{}" theme="simple"/>
                                          </div>
                                      </td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                      <tr>
                          <td>
                                <table>
                                    <tr>
                                      <td>
                                          &nbsp;&nbsp;&nbsp;<s:select name="start_price" headerKey="" headerValue="Min Prize" list="{'100','1000000','1500000','2000000','3000000','4000000','5000000','6000000','7500000','15000000'}" theme="simple"/>
                                      </td>
                                      <td>
                                          &nbsp;To&nbsp;
                                      </td>
                                      <td>
                                          <s:select name="end_price" headerKey="" headerValue="Max Prize" list="{'1000000','1500000','2000000','3000000','4000000','5000000','6000000','7500000','15000000'}" theme="simple"/>
                                      </td>
                                  </tr>
                                </table>
                        </td>
 
                    </tr>
                                      <tr>
                                          <td>
                                              <table>
                                    <tr>
                                      <td>
                                          &nbsp;&nbsp;&nbsp;<s:select name="start_area_in_feet" headerKey="" headerValue="Min Area" list="{'100','300','400','500','600','700','800','900','1000'}" theme="simple"/>
                                      </td>
                                      <td>
                                          &nbsp;To&nbsp;
                                      </td>
                                      <td>
                                          <s:select name="end_area_in_feet" headerKey="" headerValue="Max Area" list="{'500','600','700','800','900','1000','1100','1200','1300','1400','1500'}" theme="simple"/>
                                      </td>
                                  </tr>
                                </table>
                                          </td>
                                      </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;<s:select name="number_of_bedroom" id="bed" headerKey="" headerValue="Select Bedrooms" list="{'1','2','3','4','5'}" theme="simple"/>
                            &nbsp;<s:submit value="Search"   theme="simple"/>
                        </td>
                    </tr>
              </table>                    
            </div>
		
          </div>
        </div>
		 </s:form>
		<div id="buy">
		<table cellpadding="0" cellspacing="0" border="0" width="250" align="center">
		<tr><td align="center" style="font-size:18px; color:#336666; font-family:Arial, Helvetica, sans-serif; font-weight:bold">Have a house to </td></tr>
		<tr><td align="center" style="font-size:28px; color:#599bdc; font-family:Arial, Helvetica, sans-serif; font-weight:bold">Sell/Rent?</td></tr>
		<tr><td height="20"></td></tr>
		<tr><td align="center" style="font-size:14px; color:#336666; font-family:Arial, Helvetica, sans-serif; font-weight:bold">List your property now</td></tr>
		<tr><td align="center" style="font-size:18px; color:#000000; font-family:Arial, Helvetica, sans-serif; font-weight:bold">& </td></tr>
		<tr><td style="font-size:14px; color:#000000; font-family:Arial, Helvetica, sans-serif; font-weight:bold">get contacted by genuine buyers</td></tr>
		<tr><td height="20"></td></tr>
                <tr><td align="center"><a href="sendquotation.action"><input type="button" value="List Now" class="button focus" /></a></td></tr>
		</table>
		
		</div>
          
		<div id="clear"></div>
		
		<div id="feature" class="builder">
		<h1>Featured Builders</h1>
		<div style="float:left; margin:0; padding:0; width:958px">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr><td colspan="5" height="20"></td></tr>
               <tr align="center"><td><a href="http://www.ansalapi.com/index.aspx"><img src="images/gnoida.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></a></td>
                    <td><a href="http://www.ahinshavatika.in/"><img src="images/delhi.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></a></td>
                    <td><a href="http://www.kdpmgicity.co.in/"><img src="images/rajnagar1.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></a></td>
                    <td><img src="images/rajexten2.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></td></tr>
		<tr align="center"><td>Greater Noida</td><td>Delhi</td><td>Rajnagar</td><td>Rajnagar Extension</td></tr>
		<tr><td colspan="5" height="10"></td></tr>
                <tr align="center"><td><img src="images/ghz1.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></td>
                    <td><a href=" http://www.dlfthecrestgurgaon.in/"><img src="images/gurgaon.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></a></td>
                    <td><a href=" http://wavecitygzbflats.in/"><img src="images/wave.jpg" width="185" height="75" style="border:3px solid lightblue;"/></a></td>
                    <td><a href="http://www.evershedsinfratech.com/"><img src="images/noida.jpg" width="185" height="75" style="border: 3px solid lightblue;"/></a></td></tr>
		<tr align="center"><td>Ghaziabad</td><td>Gurgaon</td><td>Wave City</td><td>Noida</td></tr>		
		</table></div>
		</div>
		
		<div id="clear"></div>
		<div id="feature">
		<h1>Featured Project</h1>
		<div style="float:left; margin:0; padding:0; width:958px; height:auto">
		

<a class="left" id='leftNav'></a>
<a class="right" id='rightNav'></a>
<div id="clientlist">
	<span id='test'>
            <a href="http://www.innovativelegendheights.com/"><img src='images/property1.gif' title="Space Station Hyderabad" alt="Space Station Hyderabad" /></a>
            <a href="http://bankeybiharisharnam.com/"><img src='images/property2.gif' title="2" alt="2" /></a>
            <a href="http://www.neemranaone.co.in/"><img src='images/property3.gif' title="3" alt="3" /></a>
            <a href="http://www.ajnarapanorama.co.in/"><img src='images/property4.gif' title="4" alt="4" /></a>
            <a href="http://www.mahagunindia.com/"><img src='images/property5.gif' title="5" alt="5" /></a>
            <a href="http://www.kwsrishti.com/"><img src='images/property6.gif' title="6" alt="6" /></a>
            <a href=" http://www.pareenatheeliteresidences.com/"><img src='images/property7.gif' title="7" alt="7" /></a>
            <a href=" http://www.vardhmans.com/i-valley/"><img src='images/property8.gif' title="8" alt="8" /></a>
            <a href="http://www.worldtradecenternoida.in/"><img src='images/property9.gif' title="9" alt="9" /></a>
            <a href="http://www.eros-sampoornam.in/"><img src='images/property10.gif' title="10" alt="10"/></a>
            <a href="http://www.eros-sampoornam.in/"><img src='images/property11.gif' title="11" alt="11" /></a>
            <a href="http://www.sarepetioles.com/"><img src='images/property12.gif' title="12" alt="12" /></a>
            <a href="http://www.supernovanoida.in/"><img src='images/property13.gif' title="13" alt="13" /></a>
            <a href="http://property.magicbricks.com/microsite/buy/moti-residency/"><img src='images/property14.gif' title="14" alt="14" /></a>
            <a href="http://www.supertecharavillegurgaon.co.in/"><img src='images/property15.gif' title="15" alt="15" /></a>
            <img src='images/property16.gif' title="16" alt="16" />
            <a href="http://www.tulipspectragurgaon.in/"><img src='images/property17.gif' title="17" alt="17" /></a>
            </span>

</div>

		</div></div>
		
		<div id="clear"></div>

<div id="feature" style="width:650px; height:auto;">
<ul  style="width:100%"><li class="current">Real Estate Discussions</li><!--<li>Post Your Requirement</li><li>List Your Property</li>--></ul>
<div id="clear"></div>
<div style="margin:0; padding:0; width:650px; height:auto; float:left;">
<table cellpadding="0" cellspacing="0" border="0" width="95%" style="border-bottom:1px solid #000" align="center">
<tr><td width="65%">
<ol>
<li><a href="#">Hi, i am looking for plots for rs. 2 lac around kodung...</a></li>
<li><a href="#"> We need 2 bhk flat or apartment for rent</a></li>
<li><a href="#">What are the current fsi & legal st& duty amount & proc...</a></li>
<li><a href="#">Anyone interested in buying residential flats in mulund...</a></li>
<li><a href="#">Hai, i looking for rent/lease of 1bhk near vallooor kot...</a></li></ol>
</td>

<td valign="top" width="35%"><table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><td colspan="2">Have a real estateissue</td></tr>
<tr><td><img src="images/dummy.gif" /></td><td style="font-size:16px"><a href="#">Start a discussion</a></td></tr></table>

</td></tr></table>
</div>
<div style="margin:0; padding:0; width:650px; height:auto; float:left">
<table cellpadding="0" cellspacing="0" width="95%" align="center">
<tr><td style="font-size:14px; font-weight:bold">Discuss</td></tr>
<tr><td><a href="#">Home Buying</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Home Selling</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Renting</a>&nbsp; |&nbsp;&nbsp;<a href="#">Home Loan</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Rules & Regulations</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">New Projects</a></td></tr>
<tr><td><a href="#">Home Improvements</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Legal Formalities</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Commercial</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">NRIs/PIOs</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">PG</a></td></tr></table>

</div>
</div>

<div id="feature" style="float:right; width:280px; height:250px; ">
<h1>&nbsp;</h1>
<div id="clear"></div>
<table cellpadding="0" cellspacing="0" border="0" width="90%" align="center">
<tr><td><strong>Bangalore</strong></td></tr>
<tr><td><a href="#">- Mahaveer Lakes</a></td></tr>
<tr><td><strong>Bullet Delhi / NCR</strong></td></tr>
<tr><td><a href="#">- Propertree</a></td></tr>
<tr><td><a href="#">- Tulip Infratech Pvt. Ltd.</a></td></tr>
<tr><td><strong>Bullet Mumbai</strong></td></tr>
<tr><td><a href="#">- Mahaavir Universal Homes</a></td></tr>
<tr><td><a href="#">- Mohak Group</a></td></tr>

</table>
</div>

<div id="clear"></div>
<div id="feature" style="width:650px; height:200px;">
<ul style="width:630px; ">
    <li id="fli1" onclick="feature('1',this)" class="current">Greater Noida</a></li>
<li id="fli2" onclick="feature('2',this)">Wave City</a></li>
<li id="fli3" onclick="feature('3',this)">Rajnagar Extension</a></li>
<li id="fli4" onclick="feature('4',this)">Noida</a></li>
<li id="fli5" onclick="feature('5',this)">Ghaziabad</a></li>
<li id="fli6" onclick="feature('6',this)">Meerut</a></li>
<li id="fli7" onclick="feature('7',this)">Hapur</a></li></ul>
<div id="clear"></div>
<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px" id="featch1">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Tax: You can claim HRA and home loan benefits</a></li>
<li><a href="#">How interest rates impact your eligibility?</a></li>
<li><a href="#">How interest rates impact your eligibility?</a></li>
<li><a href="#">Home buyers optimistic on the outcome of Union Budget 2013 -	A research.</a></li>
<li><a href="#">Renting a Commercial Property in India</a></li>
<li><a href="#">8 Tips to secure your dream home.</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch2">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Property prices in Wave City dropped by 4.74% in November 2011 - says ..</a></li>
<li><a href="#">Property prices in Wave City dropped by 3.2% in December 2011 - says M..</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">Property market overview December 2011 - Wave City</a></li>
<li><a href="#">Property prices in Wave City drop by 7.8% - says yuvitechdevelopers.co.in Property</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch3">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Property prices in Rajnagar Extension remained stable in November 2011</a></li>
<li><a href="#">Property prices in Rajnagar Extension remain stable in December 2011</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">Property prices in Rajnagar Extension appreciates by 9.1%</a></li>
<li><a href="#">Property prices in Rajnagar Extension appreciate by 5% in September 2011</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch4">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">DDA raises budget estimates for housing.</a></li>
<li><a href="#">Property prices in Noida dropped by 3.84% in November 2011</a></li>
<li><a href="#">Property prices in Noida remained stable in December 2011</a></li>
<li><a href="#">Home buyers optimistic on the outcome of Union Budget 2012 -	A research.</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">The Realty Expo gears up for another success.</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch5">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Property prices in Ghaziabad dropped by 4.37% in November 2011</a></li>
<li><a href="#">Property prices in Ghaziabad dropped by 4.5% in December 2011</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">Property market overview December 2011 - Ghaziabad</a></li>
<li><a href="#">Property prices in Ghaziabad drop by 21.6%</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch6">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Property prices in Meerut increased by 3.35% in November 2011</a></li>
<li><a href="#">Property prices in Meerut remained stable in December 2011</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">12th Mega Property Exhibition Meerut</a></li>
<li><a href="#">UP Government innovative scheme to boost Public Housing</a></li>
</ol>
</td>
</tr></table>
</div>

<div style="margin:0; padding:0 0 0 150px; width:500px; height:auto; float:right; background:url(images/prop-news.jpg) no-repeat 10px 30px; display:none" id="featch7">
<table cellpadding="0" cellspacing="0" border="0" width="95%" align="center">
<tr><td>
<ol>
<li><a href="#">Property prices in Hapur dropped by 5.67% in November 2011</a></li>
<li><a href="#">Property prices in Hapur remained stable in December 2011</a></li>
<li><a href="#">India property market forecast 2013, Real Estate forecast 2013</a></li>
<li><a href="#">Hapur ideal for Residential projects</a></li>
<li><a href="#">Property prices in Hapur appreciates by 12.4%</a></li>
</ol>
</td>
</tr></table>
</div>

</div>

<div id="feature" style="float:right; width:280px; height:auto; "><h1>Opening Poll</h1>
<div style="margin:0; padding:8px; float:left; width:260px">
   <s:form action="OP.action" method="post">
       <%
          String s=(String)session.getAttribute("m");
          if(s!=null)
              out.println(s);
       %>
    <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
        <s:hidden name="counter" value="13"/>
        <tr><strong><s:label name="ques" value="Do you think it's a good time for end users to invest in property?"/></strong></tr>
       <tr><s:radio name="vote" list="{'Yes, prices are stable'}"/></tr>
       <tr><s:radio name="vote" list="{'No, wait for prices to fall further'}"/></tr>
       <tr><s:radio name="vote" list="{'Cant say'}"/></tr>
       <tr><s:submit align="center" value="Vote Now"/></tr>
   </table>
   </s:form>
</div></div>
     <style>
        #mainfoot{
            
        }
        #footimg1,#foot1{
            position: relative;
            float:left;
        }
        #foot1{
            width:750px;
            margin-top: 10px;
            color:#292945;
        }
        #footimg1{
            margin-left: 12px;
        }
    </style>

    <div id="footer" style=" background-color: white; width:880px;">
        <table cellpadding="0" cellspacing="0" border="0" width="980" style="margin-left:-30px;">
            <tr>
                <td><img id="footimg1" src="images/pic8.jpg" width="200" height="100"/><div id="foot1"><strong>www.yuvitechdeveloper.com </strong>&nbsp;fastest growing property website in India was established with the mission to connect relevant buyers and sellers of real estate , massively increasing the propensity of transactions. The website is committed to help it's users make wise and profitable decisions relating to buying, selling, renting and leasing of properties in India and key global geographies.</div></td>
            </tr>
            <tr>
                <td height="10"></td>
            </tr>
            <tr align="center" style="height:35px;">
                <td>Copyright © 2013 Agile Softech Pvt Ltd. - Real Estate India - Property - Properties in India - All Rights Reserved.</td>
            </tr>
        </table>
    </div>
 </div>
</div>
</body>
</html>
</div>