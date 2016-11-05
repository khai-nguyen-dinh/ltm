<%-- 
    Document   : showpost
    Created on : Oct 29, 2016, 2:27:06 AM
    Author     : khai
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Note for you </title>
        <link href='http://fonts.googleapis.com/css?family=Reenie+Beanie' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/m.css" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    </head>
    <body>
        <select runat="server" id="select">
            <option value="A" style="background-color: white;">White</option>
            <option value="B" style="background-color: red;">Red</option>
            <option value="C" style="background-color: yellow;">Yellow</option>
            <option value="D" style="background-color: green;">Green</option>
        </select>
        <script>
            $('#select').change(function(){
                if($(this).val() == 'A'){
                    $("body").css('background-color', 'white');
                }
                if ($(this).val() == 'B') {
                    $("body").css('background-color', 'red');
                }
                if ($(this).val() == 'C') {
                    $("body").css('background-color', 'yellow');
                }
                if ($(this).val() == 'D') {
                    $("body").css('background-color', 'green');
                }
            });
        </script>
        <div id="headers">
            <form action="" method="get" name="Log out">
                <b><INPUT TYPE="button" id="index" value="Home" onClick="parent.location = '${pageContext.request.contextPath}/showpost'"></b>
                <b> <INPUT TYPE="button" id="indexs"value="Log out"  onClick="parent.location = '${pageContext.request.contextPath}/logout'"></b>
                <b> <INPUT TYPE="button" id="indexs"value="${name}"  onClick="parent.location = '${pageContext.request.contextPath}/profile'"></b>
            </form>
        </div>
        <div id="header">
            <form:form action="addPost" method="post" modelAttribute="po">
                <form:input maxlength="254" class="add-input" id="form" placeholder="I need to..." type="text"  path="content"/>
                <input class="add-btn" id="btn" type="submit" name="submit" value="ADD NOTE" />
            </form:form>
        </div>

        <h1><center><strong style="color: #00619a"> You've got <u style="color: #5bc0de">${size}</u> to do</strong></center></h1>
        <c:forEach var="p" items="${list}">

        <ul>

            <li>
                <a href="${pageContext.request.contextPath}/menu?id=${p.id}" class="about">
                    <h4> ${p.content} </h4>
                    <h5>${p.postedAt}</h5>
                </a>
            </li>

        </ul>

        </c:forEach>
    </body>

</html