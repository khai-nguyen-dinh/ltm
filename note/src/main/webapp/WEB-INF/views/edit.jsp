<%-- 
    Document   : edit
    Created on : Oct 29, 2016, 10:20:32 AM
    Author     : khai
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>

        <meta charset="utf-8">

        <title>Edit Note</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styless.css">

    </head>

    <body>

        <div id="login">

            <h2 class="text-center"></span>Edit Note</h2>

            <form:form action="/SpringMvcJdbcTemplate/edited" method="post" commandName="po">

                <fieldset>
                    <form:input path="content" value="${note.content}" rows="5" cols="34"/>
                    <form:hidden path="id" value="${note.id}"/>
                    <form:hidden path="id" value="${note.postedAt}"/>
                    <form:hidden path="id" value="${note.author_id}"/>

                    <p class="text-center"><input type="submit" value="Edit" class="btn btn-success" id="submit"></p>

                </fieldset>

            </form:form>

        </div> <!-- end login -->

    </body>
</html>