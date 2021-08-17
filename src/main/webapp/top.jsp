<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>   

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>약속해줘</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.me "><b>약속해줘</b></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    <c:if test="${loginUser.userid ne 'admin'}">
	                    <c:if test="${loginUser eq null}">
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/login.me">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/join.me">회원가입</a></li>
						</c:if>
						<c:if test="${loginUser ne null}">
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/yaksok.me">약속관리</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/myInfo.me">내정보</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/logout.me">로그아웃</a></li>
						</c:if>      
					</c:if>  
					
					<c:if test="${loginUser.userid eq 'admin'}">
						<li class="nav-item"><a class="nav-link" href="${myctx}/list.me">회원관리</a></li>
						<li class="nav-item"><a class="nav-link" href="#">약속관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${myctx}/logout.me">로그아웃</a></li>
					</c:if>
                    </ul>
                </div>
            </div>
        </nav>	
        	
       <%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.domain.*" %> --%>
    
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약속해줘</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>


<%	//컨텍츠명
	String myctx = request.getContextPath();

	//세션에 저장된 loginUser 꺼내기
	UserVO loginUser = (UserVO) session.getAttribute("loginUser");
	
	boolean isLogin =(loginUser==null)? false: true;//로그인 했다면 true
%>

<!-- navbar---------------------------------------------  -->
<nav class="navbar navbar-expand-sm bg-white navbar-white" id="top">

  <!-- Links -->
  <ul class="navbar-nav ml-auto">
  
<%
	//로그인일 경우
	if(isLogin){
%>	
    
    <li class="nav-item">
      <a class="nav-link" href="logout.me"><h3>로그아웃</h3></a>
    </li>
    
	<li class="nav-item">
      <a class="nav-link text-dark" href="#"><h4><%=loginUser.getUserid()%></h4>
      <%=loginTime %> 
      </a>
    </li>    
<%    
	//로그아웃일 경우
    }else{
%>	    	
	<li class="nav-item">
      <a class="nav-link" href="login.me"><h3>로그인</h3></a>
    </li>

    <li class="nav-item">
      <a class="nav-link" href="join.me"><h3>회원가입</h3></a>
    </li>    
<%    	
    }
%>  


  </ul>
</nav>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="main.me">약속해줘</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="yaksok.me">약속관리</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="myInfo.me">내 정보</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="list.me">회원목록</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="#">가이드 센터</a>
    </li>    
    
    <li class="nav-item">
      <a class="nav-link" href="#">고객센터</a>
    </li>
  </ul>
</nav>
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1>약속해줘</h1>
		<p>쉽고 빠르게 예약 하세요</p>
	</div>
<!--  ------------------------------------------------------ -->

<!--  container content------------------------------------- -->
<div class="container mt-5" style="height:700px;">
	<div class="row">
		<!-- <div class="col-md-8 "> --> --%>
		