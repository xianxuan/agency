<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>房屋详情</title>

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/agency/stage/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/agency/stage/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/agency/stage/css/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="/agency/stage/css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="/agency/stage/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/agency/stage/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="/agency/stage/css/style.css">

	<!-- Modernizr JS -->
	<script src="/agency/stage/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/agency/stage/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="http://120.27.21.186/">房屋中介.</a></div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
						<li class="has-dropdown">
							<a href="http://localhost:8080/agency/">房屋信息</a>
						</li>
						<li><a href="<%=basePath%>indexAction!getNew.action">最新房屋</a></li>						
						<li><a href="<%=basePath%>indexAction!getGood.action">精品房屋</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(${picUrl});">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>房屋详情</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div id="fh5co-product">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
					<div class="owl-carousel owl-carousel-fullwidth product-carousel">
						<s:iterator value="photos" var="list">
						
						<div class="item">
							<div class="active text-center">
								<figure>
									<img src='${list.url }' >
								</figure>
							</div>
						</div>
						</s:iterator>
					
					</div>
					<div class="row animate-box">
						
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box" style="text-align:center">
						
						<a href="#" data-tab="1" ><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">房屋详情</span></a>
						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">

							<div class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div class="col-md-10 col-md-offset-1">
								<span class="price">￥${house.price}</span>
									<h2>${house.name }</h2>
									<p>地址：${house.addre }
									   户型：${house.type }
									        面积：${house.area }
									</p>

								
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="/agency/stage/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/agency/stage/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/agency/stage/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/agency/stage/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="/agency/stage/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="/agency/stage/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="/agency/stage/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="/agency/stage/js/main.js"></script>

	</body>
</html>

