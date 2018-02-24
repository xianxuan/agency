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
    <script type="text/javascript" src="/mkv/jsp/Js/bootstrap.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/ckform.js"></script>
    <script type="text/javascript" src="/mkv/jsp/Js/common.js"></script>
    <script type="text/javascript" src="/mkv/jsp/assets/js/imgUp.js"></script>

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
<script type="text/javascript" src="/mkv/jsp/jquery.min.js"></script>
</head>
<body>
<form onsubmit="return onSubmit()" action="<%=basePath%>companyAction!editCompany.action" method="post" class="definewidth m20"enctype ="multipart/form-data" >  
    <input type="hidden" id="companyId" name=company.companyId value="${company.companyId}"/>
    <table class="table table-bordered table-hover definewidth m10" style="height:100%;">
        <tr>
            <td width="10%" class="tableleft">公司名称</td>
            <td><input type="text" id="CName" name="company.CName" value="${company.CName }"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">公司电话</td>
            <td><input type="text" id="CPhone" name="company.CPhone" value="${company.CPhone }"/></td>
        </tr>
        <tr>
        <td class="tableleft">公司邮箱</td>
        <td>
        	<input type="text" id="CEmail" name="company.CEmail" value="${company.CEmail }"/>       
        </td>
    	</tr>
    	<tr>
            <td width="10%" class="tableleft">公司地址</td>
            <td><input type="text" id="CAddress" name="company.CAddress" value="${company.CAddress }"/></td>
        </tr>
        <tr>
            <td class="tableleft">公司描述</td>
            <td ><textarea rows="20" cols="100" style="width: 80%;" name="company.CDescribe">${company.CDescribe }</textarea></td>
        </tr>
        
        <tr>
            <td class="tableleft">公司图片</td>
            <td >
            	<div id='upload' >
            		<div id="del1"><!-- 
            		<img src='/mkv/jsp/Images/delete.jpg' id="delImg1"  onclick="del(1)" style="display:none;height:20px;weight:20px;margin-left:289px;margin-top:10px;position:absolute; z-index:99">
            		 --><a class='pro_img' id='a1' onclick="deleteImg(1)" > 
            		 		 
					<input type='file' id='file1'  accept='image/*' multiple='multiple' name='myFile' onchange='t1(1,this)'/>
					<img src='/mkv/jsp/Images/upload.jpg' id='img1' style="height:100%;"></a>
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
<input type = "hidden" id="flag" value="${flag }">
</body>
<script type="text/javascript">
$(function () {
	
	if($("#flag").val() != '' && $("#flag").val() != null)
	{
		alert($("#flag").val()); 
	}
	var session = '<%=session.getAttribute("admin")%>'
		if(session == 'null')
		{
			window.location.href="/jsp/Public/login.jsp";		
		}  

	$('#backid').click(function(){

		window.location.href="<%=basePath%>companyAction.action";
 });


});
function onSubmit()
{
	
	if($("#CName").val() == null || $("#CName").val() == '')
	{
		alert("名称不能为空");
		return false;
	}
	if($("#CPhone").val() == null || $("#CPhone").val() == '')
	{
		alert("电话不能为空");
		return false;
	}
	if($("#CEmail").val() == null || $("#CEmail").val() == '')
	{
		alert("邮箱不能为空");
		return false;
	}
	if($("#CAddress").val() == null || $("#CAddress").val() == '')
	{
		alert("地址不能为空");
		return false;
	} 	
	return true;
}
</script>
</html>
