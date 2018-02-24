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
<title>后台管理</title>

<link rel="shortcut icon" href="/mkv/stage/images/favicon.ico" type="image/x-icon" />
 <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/style.css" />
    <link rel="stylesheet" type="text/css" href="/mkv/jsp/Css/main.css" />
    <script type="text/javascript" src="/mkv/jsp/Js/jquery.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/bootstrap.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/ckform.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/common.js"></script>

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20"  action="<%=basePath%>adminAction!getAdmins.action" method="post" >    
   	用户名称：
    <input type="text" name="username" id="username"class="abc input-default" placeholder="" value="${username }">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增管理员</button> 
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>用户名称</th>
        <th>用户账号</th>
        <th>用户电话</th>
        <th>操作</th>
    </tr>
    </thead>
    <s:iterator value="adminList" var="list">
	     <tr>
            <td>${list.AName}</td>
            <td>${list.AAccount }</td>
            <td>${list.APhone }</td>
            
            <td>
                <a href="<%=basePath%>adminAction!jumpEditAdmin.action?adminId=${list.adminId}">编辑</a>
                <c:if test="${session.admin.adminId != list.adminId }">
                <a href="<%=basePath%>adminAction!deleteAdmin.action?adminId=${list.adminId}" onclick="del()">删除</a>                
            	 </c:if>
            </td>
        </tr>
     </s:iterator>	
</table>
						<div style="margin-left:354px;margin-top:20px;">${pageHtml}</div>
							<!-- 分页 end -->
						</div>
						
</body>

<script type="text/javascript">
$(function () {
	
 var session = '<%=session.getAttribute("admin")%>'
	if(session == 'null')
	{
		window.location.href="/jsp/Public/login.jsp";		
	}  


});
</script>
</html>
<script> 
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
$(function () {
    
	$('#addnew').click(function(){

			window.location.href="/jsp/Admin/add.jsp";
	 });
	
	
	


});
function del()
{
	
	
	if(confirm("确定要删除吗？"))
	{
	
		var url = "index.html";
		
		window.location.href=url;		
	
	}




}

	
</script>
