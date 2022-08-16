<%-- 
    Document   : login
    Created on : Jun 26, 2022, 4:13:30 PM
    Author     : 84348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="333798910403-saqnm3ea23s7fu5i2dk0mc7r2s5529ee.apps.googleusercontent.com">
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <link rel="stylesheet" href="css/styleLogin.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Login Page</title>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Login Form -->
                <form action="MainController">
                    <input type="text" id="login" class="fadeIn second" name="userID" placeholder="User Name">
                    <input type="text" id="password" class="fadeIn third" name="password" placeholder="Password">
                    <div style="margin-left: 70px;" class="g-recaptcha" data-sitekey="6Led5sYeAAAAAI4VKBUfBXGyzPe5ivRi1VtP9YnX"></div></br>
                    <input type="submit" name="action" class="fadeIn fourth" value="Login">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                </div>

            </div>
            <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <h2><%=error%></h2>
        </div>
        
    </body>
</script>
</html>

