<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SC Data</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">

<header style="min-height: 5%;">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="/">SC Data</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#">Username</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/">Log out</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>

<div class="panel" style="margin-left: 10%">
    <div class="row">
        <div class="col-md-2">
    <h2>Build notion</h2>

    <div class="notion-form">
        <div class="notion-id">
            <span>Идентификатор: </span>
            <input id="notion-id" type="text" placeholder="Значение">
        </div>
        <div class="notion-attr-row">
            <div class="rel-caption">Русский идентификатор:</div>
            <input class="rel-key" type="hidden" value="nrel_main_idtf:">
            <input class="rel-value" type="text" placeholder="Значение">
        </div>
        <c:forEach var="relation" items="${relationList}">
            <div class="notion-attr-row">
                <div class="rel-caption">${relation.rus}:</div>
                <input class="rel-key" type="hidden" value="${relation.nodeName}">
                <input class="rel-value" type="text" placeholder="Значение">
            </div>
        </c:forEach>
    </div></div>

    <div class="scs-preview-panel col-md-2" style="margin-top: 3%;width: 70%">
        <textarea id="scs-preview" style="width: 70%; height: 50%"></textarea> <br>
        <div>
            <button class="btn btn-default btn-xl wow tada" id="redirect-to-upload-form">Перейти к созданию нового понятия</button>
            <button class="btn btn-default btn-xl wow tada" id="make-preview">Создать понятие</button>
            <button class="btn btn-default btn-xl wow tada" id="save-into-scs">Сохранить в Scs</button>
        </div>
    </div>

        </div>
</div>

<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2>Our course project is completely open and you can look at the source code!</h2>
            <i class="fa fa-github fa-3x wow bounceIn"></i>
            <a href="#" class="btn btn-default btn-xl wow tada">Source code!</a>
        </div>
    </div>
</aside>

<section id="contact" style="padding: 60px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Let's Get In Touch!</h2>
                <hr class="primary">
                <p>If you have any ideas , comments , questions, or you want to help us with the project contact us! Write us in skype or send us an email and we will get back to you as soon as possible!</p>
            </div>
            <div class="col-lg-4 col-lg-offset-2 text-center">
                <i class="fa fa-skype fa-3x wow bounceIn"></i>
                <p>maxgergalov</p>
                <p>teranik1994</p>
            </div>
            <div class="col-lg-4 text-center">
                <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                <p><a href="mailto:your-email@your-domain.com">maxgergalov@gmail.com</a></p>
                <p><a href="mailto:your-email@your-domain.com">alexanderterekhow.by@gamil.com</a></p>
            </div>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="resources/js/jquery.easing.min.js"></script>
<script src="resources/js/jquery.fittext.js"></script>
<script src="resources/js/wow.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="resources/js/creative.js"></script>

<script src="/resources/scripts/jquery-2.1.4.min.js" ></script>
<script src="/resources/scripts/notion-builder.js" ></script>

</body>

</html>
