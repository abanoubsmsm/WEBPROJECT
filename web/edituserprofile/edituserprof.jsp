<%-- 
    Document   : edituserprof
    Created on : Feb 7, 2018, 9:26:24 PM
    Author     : abanoub samy
--%>

<%@page import="dtos.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Super Market an Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Registered :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font-awesome icons -->
        <link href="../css/font-awesome.css" rel="stylesheet"> 
        <!-- //font-awesome icons -->
        <!-- js -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- //js -->
        <link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
    </head>

    <body>
        <!-- header -->
        <div class="agileits_header">
            <div class="container">
                <div class="w3l_offers">
                    <p>SALE UP TO 70% OFF. USE CODE "SALE70%" . <a href="products.html">SHOP NOW</a></p>
                </div>
                <div class="agile-edit-help">
                    <ul>

                        <li><a href="contact.html">Help</a></li>
                        

                    </ul>
                </div>
                <div class="product_list_header">  
                    <form action="#" method="post" class="last"> 
                        <input type="hidden" name="cmd" value="_cart">
                        <input type="hidden" name="display" value="1">
                        <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                    </form>  
                </div>
            
            </div>
        </div>

        <div class="logo_products">
            <div class="container">
                <div class="w3ls_logo_products_left1">
                    <ul class="phone_email">
                        <li><i class="fa fa-phone" aria-hidden="true"></i>Order online or call us : (+0123) 234 567</li>

                    </ul>
                </div>
                <div class="w3ls_logo_products_left">
                    <h1><a href="../HomeServlet">super Market</a></h1>
                </div>


                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //header -->
        <!-- navigation -->
        <div class="navigation-agileits">
            <div class="container">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">

                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- //navigation -->
        <!-- breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="../HomeServlet"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Profile Page</li>
                </ol>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <!-- register -->
        <div class="register">
            <div class="container">
                <h2>Edit Profile</h2>
                <div class="login-form-grids">
                    <h5>profile information</h5>

                    <%

                        User u = (User) session.getAttribute("logedInUser");


                    %>
                    <form action="../EditUserProfile" method="post">


                        <input type="text" placeholder="Name..."  name="userName" value="<%=u.getUserName()%>" >
                        <input type="text" placeholder="Address..."  name="userAddress" value="<%=u.getUserAddress()%>">
                        <input type="text" placeholder="Jop..."  name="userJop" value="<%=u.getUserJop()%>">
                        <br>
                        <input type="text" placeholder="Credit..."  name="userCredit"value="<%=u.getUserCredit()%>" >
                        <br>
                        <%

                            if (u.getUserGender().equals("male")) {

                                out.println("<input type=radio name=userGender value=male checked > male");
                                out.println("<br><br>");
                                out.println("<input type=radio name=userGender value=female > female");
                            } else {

                                out.println("<input type=radio name=userGender value=male  > male");
                                out.println("<br><br>");
                                out.println("<input type=radio name=userGender value=female checked > female");
                            }

                        %>





                        <h6>Change Password</h6>
                        <input type="hidden"  name="userEmail" value=<%=u.getUserEmail()%>>

                        <input type="password"  name ="userPassword" value=<%=u.getUserPassword()%> >
                        <input type="password"  required=" " value=<%=u.getUserPassword()%>>

                        <input type="submit" value="Save">
                    </form>
                </div>

            </div>
        </div>
        <!-- //register -->
       <jsp:include page="/footer/footerpage.html"/>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- top-header and slider -->
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <!-- //here ends scrolling icon -->
        <script src="js/minicart.min.js"></script>
        <script>
            // Mini Cart
            paypal.minicart.render({
                action: '#'
            });

            if (~window.location.search.indexOf('reset=true')) {
                paypal.minicart.reset();
            }
        </script>
        <!-- main slider-banner -->
        <script src="js/skdslider.min.js"></script>
        <link href="css/skdslider.css" rel="stylesheet">
        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('#demo1').skdslider({'delay': 5000, 'animationSpeed': 2000, 'showNextPrev': true, 'showPlayButton': true, 'autoSlide': true, 'animationType': 'fading'});

                jQuery('#responsive').change(function () {
                    $('#responsive_wrapper').width(jQuery(this).val());
                });

            });
        </script>	
        <!-- //main slider-banner --> 

    </body>
</html>