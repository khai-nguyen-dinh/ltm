<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flat-ui.min.css">
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,300italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css">
        <title>Edit</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">${user.fullname}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>

                                <div class=" col-md-9 col-lg-9 "> 
                                    <form:form action="editedprofile" method="post" modelAttribute="user">
                                        <table class="table table-user-information">
                                            <tbody>
                                                <tr>
                                                    <td>Username</td>
                                                    <td><form:input path="username" value="${u.username}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td><form:input path="password"/></td>
                                            </tr>
                                            <tr>
                                                <td>Fullname</td>
                                                <td><form:input path="fullname" value="${u.fullname}"/></td>
                                            </tr>
                                            <tr>
                                                <td>Address</td>
                                                <td><form:input path="address" value="${u.address}"/></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                            <input type="submit" class="btn btn-primary" value="Edit profile" />
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>