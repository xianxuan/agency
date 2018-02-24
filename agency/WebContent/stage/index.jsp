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
<title>房屋中介</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> 
	
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
	<link rel="stylesheet" type="text/css" href="/agency/jsp/Css/main.css" />
	<!-- Modernizr JS -->
	<script src="/agency/stage/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/agency/stage/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<s:action name="indexAction" namespace="/" var="home"> </s:action>
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="#">房屋中介.</a></div>
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
				<c:choose>
				<c:when test="${session.hy==null}">
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
					<li><a href="<%=basePath%>hyAction!jumpLogin.action">登录</a></li>	
					<li><a href="<%=basePath%>hyAction!jumpRegister.action">注册</a></li>
					</ul>
				</div>
				</c:when>
				<c:otherwise>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
					<li><a href="<%=basePath%>hyAction!logout.action">注销</a></li>	
					<li><a href="<%=basePath%>hyAction.action">后台管理</a></li>
					</ul>
				</div>
				</c:otherwise>
				</c:choose>
			</div>
			
		</div>
	</nav>
	
	<aside id="fh5co-hero" class="js-fullheight">
		<div class="flexslider js-fullheight">
			<ul class="slides">
			<s:iterator value="#home.newPics" var="list">
		   	<li style="background-image: url(${list.url});">
		   		<div class="overlay-gradient"></div>
		   		<div class="container">
		   			<div class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
		   				<div class="slider-text-inner">
		   					<div class="desc">
		   						<h2>${list.news.title }</h2>
			   					<p><a href="<%=basePath%>indexAction!getNewById.action?id=${list.news.newid}" class="btn btn-primary btn-outline btn-lg">新闻详情</a></p>
		   					</div>
		   				</div>
		   			</div>
		   		</div>
		   	</li>
		   	</s:iterator>
		  	</ul>
	  	</div>
	</aside>
	
	<div id="fh5co-product">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<!-- <span>Cool Stuff</span> -->
					
				</div>
			</div>
			<div class="row">
				<s:iterator value="#home.housePics" var="list">
				<div class="col-md-4 text-center animate-box">
					<div class="product">
						<div class="product-grid" style="background-image:url(${list.url});">
							<div class="inner">
								<p>
								<a href="<%=basePath%>indexAction!getHouseById.action?id=${list.house.houseid}" class="icon"><i class="icon-eye"></i></a>
								</p>
							</div>
						</div>
						<div class="desc">
							<h3><a href="<%=basePath%>indexAction!getHouseById.action?id=${list.house.houseid}">${list.house.name }</a></h3>
							<span class="price">￥${list.house.price }</span>
						</div>
					</div>
				</div>
				</s:iterator>
				<%-- <div style="margin-left:480px;margin-top:20px;">
					<s:iterator value="#home.pageHtml" var="pageHtml">
					${pageHtml}
					</s:iterator>
					</div> --%>
							<!-- 分页 end -->
			</div>
		
            <!-- <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div> -->
			
						
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
<script type="text/javascript">
	function isNumber2(oNum) {
	if (!oNum)
		return false;
	var strP = /^\d+/;
	if (!strP.test(oNum))
		return false;
	try {
		if (parseFloat(oNum) != oNum)
			return false;
	} catch (ex) {
		return false;
	}
	return true;
} 
	</script>
	</body>
	
</html>

