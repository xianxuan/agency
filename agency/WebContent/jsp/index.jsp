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
<title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/mkv/jsp/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="/mkv/jsp/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    
<link rel="shortcut icon" href="/mkv/stage/images/favicon.ico" type="image/x-icon" />
<link href="/mkv/jsp/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您,<span class="dl-log-user">${session.admin.AName }</span><a href="<%=basePath %>loginOutAction!logout.action" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">后台管理</div></li>		
          <!--   <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li> -->
			
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
</div>
<script type="text/javascript" src="/mkv/jsp/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="/mkv/jsp/assets/js/bui-min.js"></script>
<script type="text/javascript" src="/mkv/jsp/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="/mkv/jsp/assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
        var config = [{
        		  id:'1',
        		  menu:
        		      [{
        			text:'系统管理',
        			items:
        			     [{
        				id:'1',
        				text:'用户管理',
        				href:"<%=basePath%>adminAction.action"
        			       },
        			      {
        				id:'2',
        				text:'商品管理',
        				href:'<%=basePath%>productAction.action'
        			       },
        			      {
        				id:'3',
        				text:'公司管理',
        				href:'<%=basePath%>companyAction.action'
        			       },
        			      {
        				id:'4',
        				text:'服务管理',
        				href:'<%=basePath%>serviceAction.action'
        			       },
        			      {
           				id:'5',
           				text:'反馈管理',
           				href:'<%=basePath%>contactAction.action'
               			       }]
        			    }]
        		}];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
<div style="text-align:center;">
	
</div>
</body>
<script type="text/javascript">
$(function () {
	var session = '<%=session.getAttribute("admin")%>'
	if(session == 'null')
	{
		window.location.href="/mkv/jsp/Public/login.jsp";		
	} 
	

});
</script>
</html>