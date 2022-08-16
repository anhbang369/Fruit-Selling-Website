<%@page import="cart.ViewCart"%>
<%@page import="cart.CartDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="index/css/style.css">
    </head>
    <body>
        <main class="page">
            <section class="shopping-cart dark">
                <div class="container">
                    <div class="block-heading">
                        <h2>Shopping Cart</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quam urna, dignissim nec auctor in, mattis vitae leo.</p>
                    </div>

                    <%
                        ViewCart cart = (ViewCart) session.getAttribute("CART");
                        if (cart != null) {
                            if (cart.getCart().size() > 0) {
                    %>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-12 col-lg-8">
                                <div class="items">

                                    <%
                                        double total = 0;
                                        for (CartDTO tm : cart.getCart().values()) {
                                            total += tm.getPrice() * tm.getQuantityUser();
                                    %>


                                    <form action="MainController">
                                        <div class="product">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <img class="img-fluid mx-auto d-block image" src="<%= tm.getImage()%>">
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="info">
                                                        <div class="row">
                                                            <div class="col-md-5 product-name">
                                                                <div class="product-name">
                                                                    <a href="#"><%= tm.getProductName()%></a>
                                                                    <div class="product-info">
                                                                        <div>Import Date: <span class="value"><%= tm.getImportDate()%></span></div>
                                                                        <div>Using Date <span class="value"><%= tm.getUsingDate()%></span></div>
                                                                        <!--                                                                    <div>Memory: <span class="value">32GB</span></div>-->
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 quantity">
                                                                <label for="quantity">Quantity:</label>
                                                                <input id="quantity" type="number" name="quantity" value ="<%= tm.getQuantity()%>" class="form-control quantity-input" required="">
                                                            </div>
                                                            <div class="col-md-3 price">
                                                                <span><%= tm.getPrice()%></span>

                                                            </div>

                                                            <div class="col-md-1">
                                                                <input type="hidden" name="productID" value="<%= tm.getProductID() %>">
                                                                <input type="submit" name="action" value="Delete">
                                                                <input type="submit" name="action" value="Update">

                                                            </div>




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
                            <div class="col-md-12 col-lg-4">
                                <div class="summary">
                                    <h3><%= total%></h3>
                                    <div class="summary-item"><span class="text">Subtotal</span><span class="price">$360</span></div>
                                    <div class="summary-item"><span class="text">Discount</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Shipping</span><span class="price">$0</span></div>
                                    <div class="summary-item"><span class="text">Total</span><span class="price"><%= total%></span></div>

                                    <form action="MainController">
                                        <input type="hidden" name="total" value="<%= total%>">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block" name="action" value="Checkout">Checkout</button>
                                    </form>
                                </div>
                            </div>
                        </div> 
                    </div>

                    <%
                            }
                        }
                    %>

                </div>
            </section>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
