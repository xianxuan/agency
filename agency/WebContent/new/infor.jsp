<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>信息管理</title>
<link href="/agency/new/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<script src="/agency/new/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/agency/new/js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function () {
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
});

$(function(){	
	//顶部导航切换
	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active")
		$(this).addClass("active");
	})	
})	
</script>
</head>
<body>
    <div class="big">
        <!--左边的导航-->
        <s:include value="/new/left.jsp" />

        <!--右边的内容-->
        <div class="right">
            <div class="right_top">
               <%--  <span>学生信息管理系统</span>
                <a href="http://localhost:54436/zhuxiao.ashx">退出系统</a> --%>
            </div>
            <div class="right_addnew">
                <h2>信息管理</h2>
            </div>
             <form id="form1" action="<%=basePath%>hyAction!editInfor.action" method="post">
             <input type="hidden" id ="Name" name="user.userid" value ="${user.userid }"/>
                <div class="name">
                    <label>姓名<input type="text" id ="Name" name="user.name" value ="${user.name }"/></label><label id="Name1" style="color:#ff0000; margin-left:0px"></label>
                </div>
                
                <div class="name">
                    <label>电话<input type="text" id ="Phone" name="user.phone" value ="${user.phone }"/></label><label id="High1" style="color:#ff0000; margin-left:0px"></label>
                </div>
                <div class="name">
                    <label>邮箱<input type="text" id ="email" name="user.mail" value ="${user.mail }"/></label><label id="High1" style="color:#ff0000; margin-left:0px"></label>
                </div>
                <div class="name">
                    <label>密码<input type="password" id ="Psw" name="user.psw" value ="${user.psw }"/></label><label id="High1" style="color:#ff0000; margin-left:0px"></label>
                </div>
                <div class="name">
                    <label>确认<input type="password" id ="Psw2" name="check" value =""/></label><label id="High1" style="color:#ff0000; margin-left:0px"></label>
                <div class="right_addchengyuanbtn">
                    <a class="chengyuanbtn01" href="#" id="TJ">确定</a>
                    
                    <a class="chengyuanbtn02" href="#">取消</a>
                </div>
                 	<input type="hidden" id="flag" value="${flag}"/>
                </form>
            </div><!--right-->
    </div>
<script type="text/javascript">
    $("#TJ").click(function () {
    	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
    	 var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
    	if($("#Name").val() == null || $("#Name").val() == '' )
    	{
    		alert("姓名不能为空");
    		
    	}
    	else if($("#Phone").val() == null || $("#Phone").val() == '' )
    	{
    		alert("电话不能为空");
    		
    	}
    	else if(!myreg.test($("#Phone").val()) )
    	{
    		alert("电话格式错误");
    		
    	}
    	else if($("#email").val() == null || $("#email").val() == '' )
    	{
    		alert("邮箱不能为空");		
    	}
    	else if(!reg.test($("#email").val()))
    	{ 
    	　　　　alert("邮箱格式错误!");
    	}
    	else if($("#Psw").val() == null || $("#Psw").val() == '' )
    	{
    		alert("密码不能为空");
    	}
    	else if($("#Psw2").val() == null || $("#Psw2").val() == '' )
    	{
    		alert("密码确认不能为空");
    	}
    	else if($("#Psw").val() != $("#Psw2").val())
    	{
    		alert("两次输入密码不一致");
    	}
    	else
    	{
    		$("#form1").submit();
    	}
    	

    });
    $(function () {
        var flag  = $("#flag").val();
        if(flag == "editInforError")
        	{
        		alert("邮箱已存在");
        	}


    });
</script>
</body>
</html>