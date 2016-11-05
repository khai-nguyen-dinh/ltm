<%-- 
    Document   : signin
    Created on : Oct 28, 2016, 11:08:43 PM
    Author     : khai
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flat-ui.min.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,300italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <title>Login</title>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="text-center" style="color: #2ecc71" id="site-header">${message}</h1>
            <form:form action="checkSignin" method="post" modelAttribute="user">
                <div id="login">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="text" path="username"  placeholder="Email/Username" class="form-control" id="name" />

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="password" path="password"   placeholder="Password" class="form-control" id="password" />

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="seperator"></div>
                        </div>
                    </div>
                    <div class="row" id="action">
                        <div class="col-md-3 col-md-offset-3">
                            <input type="submit" class="btn btn-block btn-lg" id="login-btn" value="Sigin" /></br>
                        </div>
                        <div class="col-md-3">
                            <a href="${pageContext.request.contextPath}/signup" class="btn btn-block btn-lg btn-primary">Register</a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" id="social">
                            <h2>Or login using:</h2>
                            <a class="fa fa-facebook fa-2x" id="first"></a>
                            <a class="fa fa-twitter fa-2x"></a>
                            <a class="fa fa-google-plus fa-2x"></a>
                        </div>
                    </div>
                </div>
            </form:form>
            <!-- END LOGIN -->
        </div>
    </body>
</html>

