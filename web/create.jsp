<%-- 
    Document   : create
    Created on : Jun 26, 2022, 4:14:02 PM
    Author     : 84348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Create Page</title>
    </head>
    <body>
        <div class="row" style="background-color: #92badd;width: 50%;margin-left: 24%;margin-top: 10%;">
            <form action="MainController" method="POST" class=" box-container">
                <div style="text-align: center">
                    Product ID<input type="text" name="productID" required=""/></br>
                Product Name<input type="text" name="productName" required=""/></br>
                Image<input type="text" name="image" required=""/></br>
                Price<input type="number" name="price" min="1" max="500" required=""/></br>
                Quantity<input type="number" name="quantity" min="1" max="500" required=""/></br>
                Category ID<input type="text" name="categoryID" required=""/></br>
                Import Date<input type="date" name="importDate" required=""/></br>
                Using Date<input type="date" name="usingDate" required=""/></br>
                <input type="hidden" name="status"/>
                <input type="submit" name="action" value="Insert"/>
                <input type="reset" value="Reset"/>     
                </div>
            </form>
        </div>

    </body>
</html>
