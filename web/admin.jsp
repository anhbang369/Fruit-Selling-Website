<%-- 
    Document   : admin
    Created on : Jun 26, 2022, 4:13:41 PM
    Author     : 84348
--%>

<%@page import="java.util.List"%>
<%@page import="admin.AdminProduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <form action="MainController">
            <input type="text" name="search" placeholder="Name Product...">
            <input type="submit" name="action" value="Search">
        </form>
        <form action="MainController">
            <input type="submit" name="action" value="Logout">
        </form>
        <%
            List<AdminProduct> listProduct = (List<AdminProduct>) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Import Date</th>
                    <th>Using Date</th>

                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (AdminProduct list : listProduct) {
                %>
            <form action="MainController" name="UpdateP" onsubmit="UpdatePUpdateProductA()">
                <tr>
                    <td>
                        <%= count++%>
                    </td>
                    <td>
                        <%= list.getProductID()%>
                        <input type="hidden" name="productID" value="<%= list.getProductID()%>"/>
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= list.getProductName()%>"/>
                    </td>
                    <td>
                        <input type="hidden" name="image" value="<%= list.getImage()%>" readonly=""/>
                        <img src="<%= list.getImage()%>" width="100px" height="100px">
                    </td>
                    <td>
                        <input type="number" name="price" value="<%= list.getPrice()%>"/>
                    </td>
                    <td>
                        <input type="number" name="quantity" value="<%= list.getQuantity()%>"/>
                    </td>
                    <td>
                        <input type="text" name="categoryID" value="<%= list.getCategoryID()%>"/>
                    </td>
                    <td>
                        <input type="text" name="importDate" value="<%= list.getImportDate()%>"/>
                    </td>
                    <td>
                        <input type="text" name="usingDate" value="<%= list.getUsingDate()%>"/>
                    </td>
                    <input type="hidden" name="status" value="<%= list.getStatus()%>"/>
                    <td>
                        <input type="hidden" name="action" value="UpdateProduct"/>
                        <input type="submit" value="Update"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Delete Product"/>
                    </td>
                    
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        }
    %>
    
    
    
    <a href="create.jsp">Create</a>
</body>
</html>
