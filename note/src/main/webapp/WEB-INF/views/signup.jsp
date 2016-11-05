<%-- 
    Document   : signup
    Created on : Oct 28, 2016, 11:29:29 PM
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
        <title>SignUp</title>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="text-center" style="color: #cb2028" id="site-header">${result}</h1>
            <form:form action="checkSignup" method="post" modelAttribute="user">
                <div id="login">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="text" path="username" value="" placeholder="Email/Username" class="form-control" id="name" />

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="password" path="password" value=""  placeholder="Password" class="form-control" id="password" />

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="text" path="fullname" value=""  placeholder="FullName" class="form-control" id="password"/>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <div id="login-form" >
                                <div class="form-group">
                                    <form:input type="text" path="address" value=""  placeholder="Address" class="form-control" id="password" />

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="action">
                        <div class="col-md-3 col-md-offset-3">
                            <input type="submit" class="btn btn-block btn-lg" id="login-btn" name="submit" value="SignUp" /></br>
                        </div>
                        <div class="col-md-3">
                            <a href="${pageContext.request.contextPath}/signin" class="btn btn-block btn-lg btn-primary">SignIn</a>
                        </div>
                    </div>

                    <!-- END LOGIN -->

                </div>
            </form:form>
        </div>

    </body>
</html>
