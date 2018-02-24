 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!--左边的导航-->
<div class="content">
    <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
        <div class="jquery-accordion-menu-header" id="form"> 
        <a href="http://localhost:8080/agency"><i class="fa fa-home"></i>返回首页</a>
       <a href="<%=basePath%>adminAction!logout.action"><i class="fa fa-home"></i>注销</a>
        </div>
        <!--<ul id="demo-list">
            <li class="active">
                <a href="http://localhost:54436/student.ashx?Action=Search"><i class="fa fa-home"></i>学生管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/student.ashx?Action=add">添加学生</a></li>
                </ul>
            </li>
            
            <li class="active">
                <a href="http://localhost:54436/teacher.ashx?Action=Search"><i class="fa fa-home"></i>老师管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/html/addTeacher.html">添加老师</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="http://localhost:54436/banji.ashx?Action=Search"><i class="fa fa-home"></i>班级管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/banji.ashx?Action=add">添加班级</a></li>
                </ul>
            </li>
        </ul>
          <ul id="demo-list">
            <li class="active">
                <a href="http://localhost:54436/student.ashx?Action=Search"><i class="fa fa-home"></i>学生管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/student.ashx?Action=add">添加学生</a></li>
                </ul>
            </li>
            
            <li class="active">
                <a href="http://localhost:54436/teacher.ashx?Action=Search"><i class="fa fa-home"></i>老师管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/html/addTeacher.html">添加老师</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="http://localhost:54436/banji.ashx?Action=Search"><i class="fa fa-home"></i>班级管理 </a>
                <ul class="submenu">
                    <li><a href="http://localhost:54436/banji.ashx?Action=add">添加班级</a></li>
                </ul>
            </li>
        </ul>-->






          <ul id="demo-list">
            <li class="active">
                <a href="<%=basePath%>houseAction!getAdminNewHouses.action"><i class="fa fa-home"></i>最新发布</a>
                
            </li>
            <li class="active">
                <a href="<%=basePath%>houseAction!getAdminHouses.action"><i class="fa fa-home"></i>房屋管理</a>
                
            </li>
            <li class="active">
                <a href="<%=basePath%>houseAction!getAdminGoodHouses.action"><i class="fa fa-home"></i>精品房屋</a>
                
            </li>
            <li class="active">
                <a href="<%=basePath%>newAction.action"><i class="fa fa-home"></i>新闻/广告管理</a>
                
            </li>
           
            
        </ul>
        <!--下边的框框-->
        <div class="jquery-accordion-menu-footer"></div>
    </div>
</div>