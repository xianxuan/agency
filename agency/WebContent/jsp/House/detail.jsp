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

<link rel="shortcut icon" href="/agency/stage/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/agency/jsp/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/agency/jsp/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="/agency/jsp/Css/style.css" />
    <script type="text/javascript" src="/agency/jsp/Js/jquery.js"></script>
    <script type="text/javascript" src="/agency/jsp/Js/bootstrap.js"></script>
    <script type="text/javascript" src="/agency/jsp/Js/ckform.js"></script>
    <script type="text/javascript" src="/agency/jsp/Js/common.js"></script>
    <script type="text/javascript" src="/agency/jsp/assets/js/imgUp.js"></script>

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
<!-- 上传图片的样式和js -->
<style>
.pro_img{ margin-left:10px;margin-top:10px;width:300px;height: 300px;background-color: black; --border-radius:999em;  overflow:hidden;float:left; --margin:5% 35%;position: relative;}
.pro_img img{ position: absolute;left: 50%;top:50%;   transform: translate(-50%,-50%);width: 100%
}
.pro_img {position:relative}
.pro_img input{position: absolute;width: 100%;height: 100%;margin:0;opacity:0;z-index: 100;}

</style>
<script type="text/javascript" src="/agency/jsp/jquery.min.js"></script>
</head>
<body>
     <input type="hidden" id="name" name="house.houseid" value="${house.houseid }"/>
    <table class="table table-bordered table-hover definewidth m10" style="height:100%;">
        <tr>
            <td width="10%" class="tableleft">房屋名称</td>
            <td><input type="text" id="name"disabled="disabled" name="house.name" value="${house.name }"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">房屋价格</td>
            <td><input type="text" id="price"disabled="disabled" name="house.price" value="${house.price }"/></td>
        </tr>
        <tr>
        <td class="tableleft"></td>
        <tr>
            <td width="10%" class="tableleft">房屋地址</td>
            <td><input type="text" id="addre"disabled="disabled" name="house.addre" value="${house.addre }"/></td>
        </tr>
         <tr>
            <td width="10%" class="tableleft">房屋面积</td>
            <td><input type="text" id="area"disabled="disabled" name="house.area" value="${house.area }"/></td>
        </tr>
   		 <tr>
            <td width="10%" class="tableleft">房屋户型</td>
            <td><input type="text" id="type"disabled="disabled" name="house.type" value="${house.type }"/></td>
        </tr>
        <tr>
            <td class="tableleft">商品图片</td>
            <td >
            	<div id='upload' >
            	 <s:iterator value="photos" var="photo">
            		<img src='${photo.url }' id='img1' style="height:100px;weight:100px;"></a>
				</s:iterator>
				</div>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</body>
<script type="text/javascript">
$('#backid').click(function(){
	window.location.href="<%=basePath%>houseAction.action";
});


</script>
</html>

