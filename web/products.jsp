<%@page import="dtos.Item"%>
<%@page import="java.io.Console"%>
<%@page import="dtos.User"%>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    <head>
        <title>Super Market an Ecommerce Online Shopping Category Flat Bootstrap Responsive Website Template | Products :: w3layouts</title>
        <!-- for-mobile-apps -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.css">
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
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
                <div class="agile-login">
                    <ul>


                        <%
                            User u = (User) session.getAttribute("logedInUser");
                            String checkLogedIn = request.getParameter("logedIn");
                            String admin = request.getParameter("admin");
                            

                            if (checkLogedIn != null && checkLogedIn.equals("true")) {

                                out.print("<li><a href=edituserprofile/edituserprof.jsp>");
                                out.print(u.getUserName());
                                out.print("</a></li>");

                                if (admin != null) {
                                    pageContext.setAttribute("admin", "true");
                                    out.print("<li><a href=AdminShowUsers>");
                                    out.print("Show All Users ");
                                    out.print("</a></li>");
                                    
                                    out.print("<li><a href=itemAdd.jsp>");
                                    out.print("Add Item ");
                                    out.print("</a></li>");

                                }

                            } else {
                                out.println(" <li><a href=regesterpage/registered.jsp> Create Account </a></li>");
                                out.println("<li><a href=loginpage/login.jsp>Login</a></li>");
                            }

                        %>

                        <li><a href="contact.html">Help</a></li>

                    </ul>
                </div>
                <div class="product_list_header">  

                    <button class="w3view-cart" type="button" name="submit" value="" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>

                </div>
                <div class="clearfix"> </div>
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
                    <h1><a href="index.html">super Market</a></h1>
                </div>
                <div class="w3l_search">
                    <form action="SearchProduct" method="post">
                        <input type="search" name="Search" placeholder="Search for a Product..." required="">
                        <button type="submit" class="btn btn-default search" aria-label="Left Align">
                            <i class="fa fa-search" aria-hidden="true"> </i>
                        </button>
                        <div class="clearfix"></div>
                    </form>
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
                            <li class="active"><a href="index.html" class="act">Home</a></li>	
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Groceries<b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>All Groceries</h6>
                                                <li><a href="groceries.html">Dals & Pulses</a></li>
                                                <li><a href="groceries.html">Almonds</a></li>
                                                <li><a href="groceries.html">Cashews</a></li>
                                                <li><a href="groceries.html">Dry Fruit</a></li>
                                                <li><a href="groceries.html"> Mukhwas </a></li>
                                                <li><a href="groceries.html">Rice & Rice Products</a></li>
                                            </ul>
                                        </div>	

                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Household<b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>All Household</h6>
                                                <li><a href="household.html">Cookware</a></li>
                                                <li><a href="household.html">Dust Pans</a></li>
                                                <li><a href="household.html">Scrubbers</a></li>
                                                <li><a href="household.html">Dust Cloth</a></li>
                                                <li><a href="household.html"> Mops </a></li>
                                                <li><a href="household.html">Kitchenware</a></li>
                                            </ul>
                                        </div>


                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Personal Care<b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>Baby Care</h6>
                                                <li><a href="personalcare.html">Baby Soap</a></li>
                                                <li><a href="personalcare.html">Baby Care Accessories</a></li>
                                                <li><a href="personalcare.html">Baby Oil & Shampoos</a></li>
                                                <li><a href="personalcare.html">Baby Creams & Lotion</a></li>
                                                <li><a href="personalcare.html"> Baby Powder</a></li>
                                                <li><a href="personalcare.html">Diapers & Wipes</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Packaged Foods<b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>All Accessories</h6>
                                                <li><a href="packagedfoods.html">Baby Food</a></li>
                                                <li><a href="packagedfoods.html">Dessert Items</a></li>
                                                <li><a href="packagedfoods.html">Biscuits</a></li>
                                                <li><a href="packagedfoods.html">Breakfast Cereals</a></li>
                                                <li><a href="packagedfoods.html"> Canned Food </a></li>
                                                <li><a href="packagedfoods.html">Chocolates & Sweets</a></li>
                                            </ul>
                                        </div>


                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Beverages<b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>Tea & Coeffe</h6>
                                                <li><a href="beverages.html">Green Tea</a></li>
                                                <li><a href="beverages.html">Ground Coffee</a></li>
                                                <li><a href="beverages.html">Herbal Tea</a></li>
                                                <li><a href="beverages.html">Instant Coffee</a></li>
                                                <li><a href="beverages.html"> Tea </a></li>
                                                <li><a href="beverages.html">Tea Bags</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                </ul>
                            </li>
                            <li><a href="gourmet.html">Gourmet</a></li>
                            <li><a href="offers.html">Offers</a></li>
                            <li><a href="contact.html">Contact</a></li>
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
                    <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active">Products</li>
                </ol>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <!--- products --->
        <div class="products">
            <div class="container">
                <div class="col-md-4 products-left">
                    <div class="categories">
                        <h2>Categories</h2>
                        <ul class="cate">
                            <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Fruits And Vegetables</a></li>
                            <ul>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Cuts & Sprouts</a></li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Flowers</a></li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Fresh Herbs & Seasonings</a></li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Fresh Vegetables</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>International Vegetables</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Organic Fruits & Vegetables</a></li>
                            </ul>
                            <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Grocery & Staples</a></li>
                            <ul>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Dals & Pulses</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Dry Fruits</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Edible Oils & Ghee</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Flours & Sooji</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Masalas & Spices</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Organic Staples</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Rice & Rice Products</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Salt, Sugar & Jaggery</a></li>
                            </ul>
                            <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>PersonalCare</a></li>
                            <ul>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Baby Care</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Cosmetics</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Deos & Perfumes</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Skin Care</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Sanitary Needs</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Oral Care</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Personal Hygiene</a> </li>
                                <li><a href="products.html"><i class="fa fa-arrow-right" aria-hidden="true"></i>Shaving Needs</a></li>
                            </ul>
                        </ul>
                    </div>																																												
                </div>
                <div class="col-md-8 products-right">
                    <div class="products-right-grid">
                        <div class="products-right-grids">
                            <div class="sorting">
                                <select id="country" onchange="change_country(this.value)" class="frm-field required sect">
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Default sorting</option>
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Sort by popularity</option> 
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Sort by average rating</option>					
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Sort by price</option>								
                                </select>
                            </div>
                            <div class="sorting-left">
                                <select id="country1" onchange="change_country(this.value)" class="frm-field required sect">
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Item on page 9</option>
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Item on page 18</option> 
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>Item on page 32</option>					
                                    <option value="null"><i class="fa fa-arrow-right" aria-hidden="true"></i>All</option>								
                                </select>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <c:forEach items="${list}" var ="row">
                        <div class="agile_top_brands_grids">
                            <c:forEach items="${row.elements}" var = "item">
                                <div class="col-md-4 top_brand_left">
                                    <div class="hover14 column">
                                        <div class="agile_top_brand_left_grid">

                                            <div class="agile_top_brand_left_grid1">
                                                <figure>
                                                    <div class="snipcart-item block">
                                                        <div class="snipcart-thumb">
                                                            <a href="single.html"><img title=" " alt=" " src="GetImage?name=${item.item_id}"width="100" height="100"></a>		
                                                            <p>${item.item_name}</p>
                                                            <h4>"${item.item_price}"</h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">



                                                            <input type="button" name="submit" value="Add to  cart" class="button" onclick="addItem('${item.item_name}',${item.item_price},${item.item_quntity})" >
                                                            <br><br>

                                                            <c:set var ="ad" value="${admin}"/>
                                                          
                                                            <c:if  test="${ad}" > 
                                                                <c:url var='tempLink' value='DeleteItem'>
                                                                <c:param name='itemId' value='${item.item_id}' />
                                                            </c:url>
                                                                
                                                                 <c:url var='tempLink2' value='itemtoedit'>
                                                                <c:param name='itemId' value='${item.item_id}' />
                                                            </c:url>
                                                                
                                                            <a href = '${tempLink}'>DELETE
                                                                <br><br>
                                                            <a href = '${tempLink2}'>EDIT
                                                                
                                                            </c:if>



                                                        </div>
                                                    </div>
                                                </figure>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="clearfix"> </div>
                        </div>
                    </c:forEach>

                    <nav class="numbering">
                        <ul class="pagination paging">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--- products --->
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
                                                                function addItem(itemName, itemPrice, ItemQuntity)
                                                                {
                                                                    //console.log(itemName + itemPrice + ItemQuntity);
                                                                    var para = document.createElement("div");
                                                                    para.id = "div";
                                                                    para.className = "form-group row";
                                                                    var name = document.createElement("label");
                                                                    name.id = "name";
                                                                    name.className = "col-sm-2 col-form-label";
                                                                    var node = document.createTextNode(itemName);
                                                                    name.appendChild(node);
                                                                    var price = document.createElement("label");
                                                                    price.id = "price";
                                                                    price.className = "col-sm-2 col-form-label";
                                                                    node = document.createTextNode(itemPrice.toString());
                                                                    price.appendChild(node);
                                                                    var quntity = document.createElement("label");
                                                                    quntity.id = "quntity";
                                                                    quntity.className = "col-sm-2 col-form-label";
                                                                    node = document.createTextNode(1);
                                                                    var buttonIncrement = document.createElement("button");
                                                                    buttonIncrement.className = "col-sm-2 col-form-label";
                                                                    buttonIncrement.style.width = "30px";
                                                                    buttonIncrement.style.height = "30px";
                                                                    var plus = document.createElement("img");
                                                                    plus.src = "images/plus.png";
                                                                    plus.style.width = "30px";
                                                                    plus.style.height = "30px";
                                                                    buttonIncrement.appendChild(plus);
                                                                    buttonIncrement.onclick = function () {
                                                                        increment(this.parentNode);
                                                                    };
                                                                    var buttonDecrment = document.createElement("button");
                                                                    buttonDecrment.onclick = function () {
                                                                        decrement(this.parentNode);
                                                                    };
                                                                    buttonDecrment.className = "col-sm-2 col-form-label";
                                                                    buttonDecrment.style.width = "30px";
                                                                    buttonDecrment.style.height = "30px";
                                                                    var plus = document.createElement("img");
                                                                    plus.src = "images/munis.png";
                                                                    plus.style.width = "30px";
                                                                    plus.style.height = "30px";
                                                                    buttonDecrment.appendChild(plus);
                                                                    quntity.appendChild(node);
                                                                    var buttonclose = document.createElement("button");
                                                                    buttonclose.className = "col-sm-2 col-form-label";
                                                                    buttonclose.style.width = "30px";
                                                                    buttonclose.style.height = "30px";
                                                                    var plus = document.createElement("img");
                                                                    plus.src = "images/delete.png";
                                                                    plus.style.width = "30px";
                                                                    plus.style.height = "30px";

                                                                    buttonclose.appendChild(plus);
                                                                    buttonclose.onclick = function () {
                                                                        removeItem(this.parentNode);
                                                                    };
                                                                    var hPrice = document.createElement("label");
                                                                    node = document.createTextNode(itemPrice);
                                                                    hPrice.hidden = "true";
                                                                    hPrice.id = "RealPrice";
                                                                    hPrice.appendChild(node)
                                                                    para.appendChild(name);
                                                                    para.appendChild(quntity);
                                                                    para.appendChild(hPrice);
                                                                    para.appendChild(price);
                                                                    para.appendChild(buttonIncrement);
                                                                    para.appendChild(buttonDecrment);
                                                                    para.appendChild(buttonclose);

                                                                    document.getElementById("card").appendChild(para);

                                                                }
                                                                function removeItem(item)
                                                                {
                                                                    document.getElementById("card").removeChild(item);
                                                                }
                                                                function increment(b)
                                                                {
                                                                    var label = b.childNodes.item(1);
                                                                    var Realprice = b.childNodes.item(2);
                                                                    var price = b.childNodes.item(3);
                                                                    var x = new XMLHttpRequest();
                                                                    x.open("POST", "ShopCard", true);
                                                                    x.send();
                                                                    var count = label.textContent;
                                                                    price.textContent = (parseInt(Realprice.textContent) * (parseInt(count) + 1));
                                                                    console.log(count);
                                                                    label.textContent = (parseInt(count) + 1) + "";
                                                                }
                                                                function decrement(b)
                                                                {
                                                                    var label = b.childNodes.item(1);
                                                                    var count = label.textContent;
                                                                    console.log(count);
                                                                    if (parseInt(count) > 0)
                                                                    {
                                                                        var Realprice = b.childNodes.item(2);
                                                                        var price = b.childNodes.item(3);
                                                                        label.textContent = (parseInt(count) - 1) + "";
                                                                        price.textContent = (parseInt(Realprice.textContent) * (parseInt(count) - 1));
                                                                    }

                                                                }
        </script>	
        <!-- //main slider-banner --> 
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Shopping Card</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body" id = "card">
                        <div class="form-group row">
                            <label  class="col-sm-2 col-form-label">Name</label>
                            <label  class="col-sm-2 col-form-label">Quntity</label>
                            <label  class="col-sm-2 col-form-label">Price</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>