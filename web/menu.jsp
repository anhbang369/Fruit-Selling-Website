
<%@page import="java.util.List"%>
<%@page import="user.UserProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">
        <script src="js/fo.js"></script>

        <title> Feane </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        

    </head>

    <body class="sub_page">

        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="">
            </div>
            <!-- header section strats -->
            <header class="header_section">
                <div class="container">
                    <nav class="navbar navbar-expand-lg custom_nav-container ">
                        <a class="navbar-brand" href="index.html">
                            <span>
                                Anh Bang Store
                            </span>
                        </a>

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class=""> </span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav  mx-auto ">
                                <li class="nav-item">
                                    <a class="nav-link"></a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link"><span class="sr-only">(current)</span> </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link"></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link"></a>
                                </li>
                            </ul>
                            <div class="user_option">
                                
                                <form class="form-inline" style="margin-right: 50px;" action="MainController" name="Search" onsubmit="SearchProduct()">
                                    <input style="border-radius: 5px;" type="text" name="searchProduct">
                                    <input type="hidden" name="action" value="SearchProduct">
                                    <input style="border-radius: 5px;color: white;background-color: #ffbe33;" type="submit" name="action" value="Search">
                                </form>
                                <a href="index.jsp" class="order_online">
                                    View Cart
                                </a>
                                <a href="MainController?action=Logout" class="order_online">
                                    Logout
                                </a>
                                
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- end header section -->
        </div>

        <!-- food section -->
        <%
            List<UserProduct> listProductr = (List<UserProduct>) request.getAttribute("LIST_PRODUCT");
            if (listProductr != null) {
                if (listProductr.size() > 0) {
        %>

        <section class="food_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Our Fruit
                    </h2>
                </div>



                <div class="filters-content">
                    <div class="row grid">
                        <%
                            for (UserProduct list : listProductr) {
                        %>
                        <form action="MainController" name="Add" onsubmit="AddProduct()">
                            <div class="col-sm-6 col-lg-4 all pizza">
                            <div class="box">
                                <div>
                                    <div class="img-box">
                                        <img src="<%= list.getImage() %>" alt="">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            <%= list.getProductName()%>
                                        </h5>
                                        <p>
                                            Import Date: <%= list.getImportDate()%></br>
                                            Export Date: <%= list.getUsingDate()%></br>
                                        </p>
                                        <div class="options">
                                            <h6>
                                                <%= list.getPrice() %>
                                            </h6>
                                            <input type="hidden" name="productID" value="<%= list.getProductID() %>">
                                            <input type="hidden" name="productName" value="<%= list.getProductName()%>">
                                            <input type="hidden" name="image" value="<%= list.getImage()%>">
                                            <input type="hidden" name="price" value="<%= list.getPrice()%>">
                                            <input type="hidden" name="quantity" value="<%= list.getQuantity()%>">
                                            <input type="hidden" name="categoryID" value="<%= list.getCategoryID()%>">
                                            <input type="hidden" name="importDate" value="<%= list.getImportDate()%>">
                                            <input type="hidden" name="usingDate" value="<%= list.getUsingDate()%>">
                                            <input type="hidden" name="status" value="<%= list.getStatus()%>">
                                            <input type="hidden" name="action" value="AddCart">
                                            <input type="submit" value="Add">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>

                        <%
                            }
                        %>


                    </div>
                </div>
            </div>
        </section>

        <%
                }
            }
        %>

        <!-- end food section -->

        <!-- footer section -->
        <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="" class="footer-logo">
                                Feane
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                            </p>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <h4>
                            Opening Hours
                        </h4>
                        <p>
                            Everyday
                        </p>
                        <p>
                            10.00 Am -10.00 Pm
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://html.design/">Free Html Templates</a><br><br>
                        &copy; <span id="displayYear"></span> Distributed By
                        <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                    </p>
                </div>
            </div>
        </footer>
        <!-- footer section -->

        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->

    </body>

</html>