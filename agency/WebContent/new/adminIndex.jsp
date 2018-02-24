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
    <title>精品房屋</title>
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
					action="<%=basePath%>houseAction!getAdminHouseByName.action"
					method="post">
					<label style="margin-left:80px;">房屋名称：</label><input id="num" type="text" class="w150" name="name"
						value="${name }"  style="height:25px;"> 
				  <input type="button" id="TJ" value="查询"style="margin-left:80px;height:25px;width:80px;"> 
               	<a href="javascript:void(0);" onclick="window.location.href='/agency/jsp/House/add.jsp'"style="margin-left:80px;height:25px;width:80px;">添加图书</a>  					               
				</form>
			</div>
          
            <table class="tb04" id="TId">
                <tr>
                <th class="w10">房屋名称</th>
                    <th class="w10">房屋价格</th>
                    <th class="w10">房屋面积</th>
                    <th class="w10">房屋地址</th>
                    <th class="w10">是否精品</th>
                    <th class="w10">是否出租</th>
                    <th class="w10">操作</th>
                </tr>
               <s:iterator value="houses" var="house">
                <tr>
                 <td>
                       <a href="<%=basePath%>houseAction!detailHouse.action?houseId=${house.houseid}"><span class="w40">${house.name }</span></a>
                    </td>
                    <td>
                        <span class="">${house.price }</span>
                    </td>
                    <td>
                        <span class="">${house.area }</span>
                    </td>
                    <td>
                        <span class="">${house.addre }</span>
                    </td>
                    <td>
                        <span class="">${house.isgood }</span>
                    </td>
                    <td>
                        <span class="">${house.isrent }</span>
                    </td>
                    <td>
                        <c:if test="${house.isgood == '否' }">
                     	<a href="<%=basePath%>houseAction!setGoodHouse.action?houseId=${house.houseid}"onclick="return set()"><span class="w40">设为精品</span></a>
                     	</c:if>
                     	<c:if test="${house.isgood == '是' }">
                     	<a href="<%=basePath%>houseAction!cancleGoodHouse.action?houseId=${house.houseid}"onclick="return cancle()"><span class="w40">取消精品</span></a>
                     	</c:if>
                     <a href="<%=basePath%>houseAction!adminDeleteHouse.action?houseId=${house.houseid}"onclick="return del()"><span class="w40">删除</span></a>                  
            
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
    		alert("填写房屋名称");
    	}
    	else
    	{
    		
    		$("#form1").submit();
    	}
    	

    });
    
</script>
<script type="text/javascript">


function set(){ 
if(!confirm("确认设置为精品？")){ 
window.event.returnValue = false; 
} 
} 
</script>
<script type="text/javascript"> 
function cancle(){ 
if(!confirm("确认取消精品？")){ 
window.event.returnValue = false; 
} 
} 
</script>
<script type="text/javascript"> 
function del(){ 
if(!confirm("确认要删除？")){ 
window.event.returnValue = false; 
} 
} 
</script>
</html>
