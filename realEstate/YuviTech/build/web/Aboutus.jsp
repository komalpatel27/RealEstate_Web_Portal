<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Real Estate</title>
<link rel="icon" href="images/img103.jpg"/>
<link href="css/style-ui.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" src="css/func.js"></script>


<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery.simple_slider.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
.toggler { width: 800px; height: 500px; position: relative; }
#button { padding: .5em 1em; text-decoration: none; }
#effect { width: 1000px; height: 350px; padding: 0.4em; position: relative; }
#effect h3 { margin: 0; padding: 0.4em; text-align: center; }
.ui-effects-transfer { border: 2px dotted gray; }
</style>
<script>
$(function() {
// run the currently selected effect
function runEffect() {
// get effect type from
var selectedEffect = $( "#effectTypes" ).val();
// most effect types need no options passed by default
var options = {};
// some effects have required parameters
if ( selectedEffect === "scale" ) {
options = { percent: 0 };
} else if ( selectedEffect === "transfer" ) {
options = { to: "#button", className: "ui-effects-transfer" };
} else if ( selectedEffect === "size" ) {
options = { to: { width: 200, height: 60 } };
}
// run the effect
$( "#effect" ).effect( selectedEffect, options, 500, callback );
};
// callback function to bring a hidden box back
function callback() {
setTimeout(function() {
$( "#effect" ).removeAttr( "style" ).hide().fadeIn();
}, 1000 );
};
// set effect from select menu value
$( "#button" ).click(function() {
runEffect();
return false;
});
});
</script>
</head>
<body>
    <div class="toggler">
    
        <div id="effect"  class="ui-widget-content ui-corner-all">
            <h3 class="ui-widget-header ui-corner-all">About Us</h3>
        <pre>yuvitechdevelopers.co.in is an internet portal dedicated to meet every aspect of the consumers needs in the real estate industry. 
It is a forum where buyers, sellers and brokers can exchange information, quickly, effectively and inexpensively.
At yuvitech denelopers, you can advertise a property, search for a property, browse through properties,
 build your own property Microsite, and visit other Indian and International sites.
yuvitechdevelopers.co.in is part of the naukri.com group-Indias No.1 job portal.
 Our parent company Info Edge, funded by ICICI Ventures, started in 1989 and became Info Edge(India) Ltd. 
on May 1, 1995. Since inception, Info Edge has provided project, marketing and management 
consulting services to a number of clients in India and abroad.
Info Edge long toyed with the idea of providing job information to the public independently 
but was unable to identify a financially viable technology backbone to do so. 
This changed when Internet entered India.
The rest as they say is History.
Naukri.com, Info Edges first venture revolutionized the concept of e- recruitment in India. 
Today it is Indias No.1 job site and amongst the top 15 job sites as per Alexa rankings. 
It services 6000 organisations and is almost a one-stop clearing house for jobs and careers for Indians.
A few years down the line, Info Edge demonstrated their understanding of e- business once again 
with the success of Jeevansathi.com - their matrimonial site. Jeevansathi.com with over 500,000 profiles 
on site, is today one of Indias leading matrimonial sites .With the real estate industry in India witnessing 
a boom, the online property market holds considerable opportunities. This is the potential that Info Edge 
is now targeting with the 99acres.com.Info Edge aims to develop this portal into one of the leading sites 
for buying, selling or leasing any type of property, anywhere in the country.        </pre>
    </div>
    </div>
<select name="effects" id="effectTypes">
<option value="blind">Blind</option>
<option value="bounce">Bounce</option>
<option value="clip">Clip</option>
<option value="drop">Drop</option>
 <option value="explode">Explode</option>
<option value="fade">Fade</option>
<option value="fold">Fold</option>
<option value="highlight">Highlight</option>
<option value="puff">Puff</option>
<option value="pulsate">Pulsate</option>
<option value="scale">Scale</option>
<option value="shake">Shake</option>
<option value="size">Size</option>
<option value="slide">Slide</option>
<option value="transfer">Transfer</option>
</select>
<a href="#" id="button" class="ui-state-default ui-corner-all">Run Effect</a>
</body>