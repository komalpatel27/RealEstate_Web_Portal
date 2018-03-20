<style>
    .sidemenu>ul>li{
        list-style: none;
        width:242px;
        height:30px;
        background-color:white;
        border-left: 1px solid black;
        border-right:1px solid black;
        border-top:1px solid black;
    }
    .sidemenu>ul{
        width:230px;
        height:inherit;
        margin-top: 20px;
    }
    #last{
        border-bottom:1px solid black;
        margin-left: 0px;
    }
    .sidemenu>ul>li>a{
        text-decoration:none;
        margin-left:6px;
        color:#2e3ab0;
        font-size:19px;
        margin-top:5px;
        position: relative;
        float:left;
    }
    .sidemenu>ul>li>a:hover{
        color:#151839;
        font-weight: normal;
    }
    #main{
        width:240px;
        height:38px;
        border-left: 3px solid black;
        border-right:3px solid black;
        border-top:3px solid black;
        border-bottom:1px solid black;
        background-image: url(images/fill.gif) ;
    }
    li>div{
       color:white;
       font-size:21px;
       font-weight:normal;
       margin-top:6px;
    }
    li>ul{
        height:20px;
        margin-left: 204px;
        margin-top: 5px;
        position:absolute;
        z-index: 10;
    }
    li>ul>li{
        display:none;
        background-color:white;
        height:30px;
        width:150px;
        font-size:19px;
        border-left: 1px solid black;
        border-right: 1px solid black;
        border-top: 1px solid black;
    }
    .sidemenu li>a{
        text-decoration: none;
        color: #2e3ab0;
    }
    .sidemenu li>a:hover{
        text-decoration: none;
        font-weight:normal;
        color:#151839;
    }
    li:hover>ul>li{
        display:block;
    }
    #last1{
        border-bottom: 1px solid black;
    }
    li>img{
       margin-top: -10px;
       display:none;
       position: relative;
       float:left;
    }
    li:hover img{
        display:block;
    }
    li>ul>li>img{
    width:0px;
    height:0px;
    }
    li>ul>li:hover>img{
    width:46;
    height:40;
    }
</style>
<div class="sidemenu">
    <ul style="z-index:5;">
        <li id="main"><div align="center">Admin Section</div></li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Property</a>
            <ul>
                <li>&nbsp;&nbsp;<a href="ARCP.jsp">Add Property</a></li>
                <li>&nbsp;&nbsp;<a href="URPF.action">Update RP</a></li>
                <li>&nbsp;&nbsp;<a href="UCPF.action">Update RC</a></li>
                <li>&nbsp;&nbsp;<a href="DelProp.action">View R/Delete</a></li>
                <li id="last1">&nbsp;&nbsp;<a href="DelCommProp.action">View C/Delete</a></li>
            </ul>
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Customer</a>
            <ul>
                <li id="last1">&nbsp;&nbsp;<a href="ViewCustomer.jsp">View/Delete</a></li>
            </ul>
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Builder</a>
            <ul>
                <li id="last1">&nbsp;&nbsp;<a href="ViewBuilder.jsp">View/Delete</a></li>
            </ul>
        </li>
       
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Employee</a>
            <ul>
                <li>&nbsp;&nbsp;<a href="Emp.action">Registration</a></li>
                <li>&nbsp;&nbsp;<a href="#">Update</a></li>
                <li id="last1">&nbsp;&nbsp;<a href="ViewEmp.jsp">View/Delete</a></li>
            </ul>
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Offer</a>
            <ul>
                <li>&nbsp;&nbsp;<a href="offer.action">Add</a></li>
                <li>&nbsp;&nbsp;<a href="update.action">Update</a></li>
                <li id="last1">&nbsp;&nbsp;<a href="DelOffer.action">View/Delete</a></li>
            </ul>
        </li>
        <li><img src="images/arrow.png" width="46" height="40"/><a href="#">Company</a>
            <ul>
                <li>&nbsp;&nbsp;<a href="company.action">Register</a></li>
                <li>&nbsp;&nbsp;<a href="update1.action">Update</a></li>
                <li id="last1">&nbsp;&nbsp;<a href="view1.action">View/Delete</a></li>
            </ul>
        </li>
        <li id="last"><img src="images/arrow.png" width="46" height="40"/><a href="#">Report</a>
            <ul>
                <li id="last1">&nbsp;&nbsp;<a href="#">View All</a></li>
            </ul>
        </li>
    </ul>
</div>