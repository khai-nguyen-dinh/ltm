<%-- 
    Document   : menu
    Created on : Oct 29, 2016, 5:01:11 AM
    Author     : khai
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>

        <meta charset="utf-8">

        <title>Menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styless.css">

        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="login">

            <h2 class="text-center">MENU</h2>
            <fieldset>
                <form action="" >
                    <p class="text-center"><a href="${pageContext.request.contextPath}/edit" class="btn btn-block btn-lg btn-primary">Edit</a></p>
                </form>
                <form action="" method="POST">
                    <p class="text-center"><a href="${pageContext.request.contextPath}/delete?id=${id_book}" class="btn btn-block btn-lg btn-primary">Delete</a></p>
                </form>
                <form action="" method="POST">
                    <p class="text-center"><a href="${pageContext.request.contextPath}/share" class="btn btn-block btn-lg btn-primary">Share</a></p>
                </form>
            </fieldset>
        </div> <!-- end login -->

    </body>
</html>
