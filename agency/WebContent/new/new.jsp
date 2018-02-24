<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻</title>
    <link href="/agency/new/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/agency/new/css/main.css">
    <script src="/agency/new/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="/agency/new/js/jquery-accordion-menu.js" type="text/javascript"></script>
    <script src="/agency/new/js/ajax.js" type="text/javascript"></script>

</head>
<body>
    <div class="big">
        <!--左边的导航-->
      <s:include value="/new/adminLeft.jsp" />

        <!--右边的内容-->
        <div class="right">
        	<div style="margin-top:80px;margin-bottom:10px;">
        	
        	</div>
            <%-- <div class="right_top">
                <span>图书管理系统</span>
                <a href="http://localhost:54436/zhuxiao.ashx">退出系统</a>
            </div> --%>
            <%-- <div class="search-content" style="margin-top:10px;margin-bottom:10px;margin-left:200px;">
				<form id = "form1"
					action="<%=basePath%>bookAction!getBooks.action"
					method="post">
					<label>图书类别：</label> 
					<select name="mySelect" id="mySelect" style="height:25px;width:100px;">
							<option value="-1" >全部</option>
						<s:iterator value="cls" var="cl">
						
							<option value="${cl.clid }" <c:if test="${mySelect eq cl.clid}" >selected = "selected"</c:if>>${cl.clNum }</option>					
						
						
						</s:iterator>
					</select> 
					<label style="margin-left:80px;">图书名称：</label><input id="num" type="text" class="w150" name="num"
						value="${num }"  style="height:25px;"> 
				  <input type="button" id="TJ" value="查询"style="margin-left:80px;height:25px;width:80px;"> 
					 <c:if test="${upBooks == null || fn:length(upBooks) == 0}">
               			<a href="<%=basePath%>bookAction!toNewLogin.action?bookId=-1&isJy=缺书"style="margin-left:80px;height:25px;width:80px;">缺书登记</a>  					
               		</c:if>
				</form>
			</div> --%>
           <div class="search-content" style="margin-top:10px;margin-bottom:10px;margin-left:200px;">
				<form id = "form1"
					action="<%=basePath%>newAction!getNewsByTitle.action"
					method="post">
					<label style="margin-left:80px;">新闻标题：</label><input id="num" type="text" class="w150" name="title"
						value="${title }"  style="height:25px;"> 
				  <input type="button" id="TJ" value="查询"style="margin-left:80px;height:25px;width:80px;"> 
               	<a href="javascript:void(0);" onclick="window.location.href='/agency/jsp/New/add.jsp'"style="margin-left:80px;height:25px;width:80px;">添加新闻</a>  					               
				</form>
			</div>
          
            <table class="tb04" id="TId">
                <tr>
                	<th class="w10">新闻标题</th>
                    <th class="w10">新闻类型</th>
                    <th class="w10">是否显示</th>
                    <th class="w10">操作</th>
                </tr>
               <s:iterator value="newList" var="n">
                <tr>
                 <td>
                       <a href="<%=basePath%>newAction!detailNew.action?newId=${n.newid}"><span class="w40">${n.title }</span></a>
                    </td>
                    
                    <td>
                        <span class="">${n.type }</span>
                    </td>
                    <td>
                        <span class="">${n.status }</span>
                    </td>
                    <td>
                     	<a href="<%=basePath%>newAction!jumpEditNew.action?newId=${n.newid}"><span class="w40">编辑</span></a> 
                     	<c:if test="${n.status == '否' }">
                     	<a href="<%=basePath%>newAction!showNew.action?newId=${n.newid}"onclick="return show()"><span class="w40">显示</span></a>
                     	</c:if>
                     	<c:if test="${n.status == '是' }">
                     	<a href="<%=basePath%>newAction!hideNew.action?newId=${n.newid}"onclick="return hide()"><span class="w40">隐藏</span></a>
                     	</c:if>
                     	<a href="<%=basePath%>newAction!deleteNew.action?newId=${n.newid}"onclick="return del()"><span class="w40">删除</span></a>                  
                    </td>
                </tr>
               </s:iterator>
            </table>
            <div class="sum-btn">
			<div class="page">${pageHtml}</div>
        </div>
    </div>
</body><script type="text/javascript">
    $("#TJ").click(function () {
    	if(($("#num").val() == null || $("#num").val() == ''))
    	{
    		alert("填写新闻标题");
    	}
    	else
    	{
    		
    		$("#form1").submit();
    	}
    	

    });
    
</script>
<script type="text/javascript">

function del(){ 
if(!confirm("确认要删除？")){ 
window.event.returnValue = false; 
} 
} 
</script>
<script type="text/javascript"> 
function show(){ 
if(!confirm("确认要显示？")){ 
window.event.returnValue = false; 
} 
} 
</script>
<script type="text/javascript"> 
function hide(){ 
if(!confirm("确认要隐藏？")){ 
window.event.returnValue = false; 
} 
} 
</script>
</html>
