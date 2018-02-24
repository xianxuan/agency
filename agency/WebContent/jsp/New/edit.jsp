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
<form onsubmit="return onSubmit()" action="<%=basePath%>newAction!editNew.action" method="post" class="definewidth m20"enctype ="multipart/form-data" >  
     <table class="table table-bordered table-hover definewidth m10" style="height:100%;">
     <input type="hidden" id="name" name="news.newid" value="${news.newid }"/>
         <tr>
            <td width="10%" class="tableleft">新闻标题</td>
            <td><input type="text" id="name" name="news.title" value="${news.title }"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">新闻类型</td>
            <td><input type="text" id="price" name="news.type" value="${news.type }"/></td>
        </tr>
       <tr>
        <td class="tableleft">是否显示</td>
        <td>
        <c:if test="${news.status=='否' }">
        	<input type="radio" name="news.status" value="是" /> 是
            <input type="radio" name="news.status" value="否" checked/> 否
        </c:if>
        <c:if test="${news.status=='是' }">
        	<input type="radio" name="news.status" value="是"  checked/> 是
            <input type="radio" name="news.status" value="否"/> 否
        </c:if>
        </td>
    	</tr>
        <tr>
        <tr>
            <td class="tableleft">新闻内容</td>
            <td ><textarea id="neirong"rows="20" cols="100" style="width: 80%;" name="news.content">${news.content }</textarea></td>
        </tr>
        <tr>
            <td class="tableleft">房屋图片</td>
            <td >
            	<div id='upload' >
            		<div id="del1"><!-- 
            		<img src='/agency/jsp/Images/delete.jpg' id="delImg1"  onclick="del(1)" style="display:none;height:20px;weight:20px;margin-left:289px;margin-top:10px;position:absolute; z-index:99">
            		 --><a class='pro_img' id='a1' onclick="deleteImg(1)" > 
            		 		 
					<input type='file' id='file1'  accept='image/*' multiple='multiple' name='myFile' onchange='t1(1,this)'/>
					<img src='/agency/jsp/Images/upload.jpg' id='img1' style="height:100%;"></a>
					<img  id='hidden1' style='display:none;'>
					</div>
				</div>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
function onSubmit()
{
	var file =document.getElementsByName("myFile");
	if($("#name").val() == null || $("#name").val() == '')
	{
		alert("新闻标题不能为空");
		return false;
	}
	if($("#price").val() == null || $("#price").val() == '')
	{
		alert("新闻类型不能为空");
		return false;
	}
	if($("#neirong").val() == null || $("#neirong").val() == '')
	{
		alert("新闻内容不能为空");
		return false;
	}
	if(file[0].value ==null || file[0].value == '')
	{
		alert("文件不能为空");
		return false;
	}
 	return true;
}
$('#backid').click(function(){
	window.location.href="<%=basePath%>houseAction.action";
});




</script>
</html>
