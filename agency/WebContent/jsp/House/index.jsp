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
<form class="form-inline definewidth m20" action="<%=basePath%>productAction!getProducts.action" method="post">  
    商品名称：
    <input type="text" name="name" id="rolename"class="abc input-default" placeholder="" value="${name }">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增商品</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>是否轮播</th>
        <th>操作</th>
    </tr>
    </thead>
    <s:iterator value="productList" var="list">
	     <tr>
            <td>${list.PName }</td>
            <td>${list.PPrice }</td>
            <c:if test="${list.isLb == 1 }">
            <td>是</td>
            </c:if>
             <c:if test="${list.isLb == 0 }">
            <td>否</td>
            </c:if>
            <td>
            <a href="<%=basePath%>productAction!detail.action?productId=${list.productId}" >详情</a>
                  <a href="<%=basePath%>productAction!jumpEditProduct.action?productId=${list.productId}" >编辑</a>          
                  <a href="<%=basePath%>productAction!deleteProduct.action?productId=${list.productId}" onclick="del()">删除</a>
            </td>
        </tr>
     </s:iterator>
</table>
<div style="margin-left:354px;margin-top:20px;">${pageHtml}</div>
							<!-- 分页 end -->
						</div>
						
</body>
</html>
<script type="text/javascript">
$(function () {
	
	var session = '<%=session.getAttribute("admin")%>'
		if(session == 'null')
		{
			window.location.href="/jsp/Public/login.jsp";		
		}  
 


});
</script>
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
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="/jsp/Product/add.jsp";
		 });


    });

	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "index.html";
			
			window.location.href=url;		
		
		}
	
	
	
	
	}
</script>