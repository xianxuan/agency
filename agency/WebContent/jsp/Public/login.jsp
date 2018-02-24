<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="/mkv/stage/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/style.css" />
    <script type="text/javascript" src="/mkv/jsp/Js/jquery.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/bootstrap.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/ckform.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/common.js"></script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }

    </style>  
</head>
<body>
<div class="container">

    <form class="form-signin" method="post" onsubmit="return login()" action="<%=basePath %>loginOutAction!checkLogin.action">
        <h2 class="form-signin-heading">登录系统</h2>
        <input type="text" id="username"name="username" class="input-block-level" placeholder="账号">
        <input type="password" id="password"name="password" class="input-block-level" placeholder="密码">
       	<input type="hidden" id="flag" value="${flag}"/>
        <p><button class="btn btn-large btn-primary" type="submit">登录</button></p>
    </form>

</div>
</body>
<script type="text/javascript">
function login(){
	if($("#username").val() == null || $("#username").val() == '')
		{
			alert("账号不能为空");
			return false;
		}
	if($("#password").val() == null || $("#password").val() == '')
		{
			alert("密码不能为空");
			return false;
		} 
	return true;
}
$(function () {
    var flag  = $("#flag").val();
    if(flag == "emptyUsername")
    	{
    		alert("账号不能为空");
    	}
    if(flag == "emptyPassword")
	{
		alert("密码不能为空");
	}
    if(flag == "errorUsername")
	{
		alert("账号不存在");
	}
    if(flag == "errorPassword")
	{
		alert("密码错误");
	}


});
</script>
</html>