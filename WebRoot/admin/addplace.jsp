<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.film.bean.UserOrderBean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<UserOrderBean> order = (List<UserOrderBean>)request.getAttribute("order");
%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <sx:head/>
    <title>场次信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
    
 %>
<jsp:include page="../quote_css.jsp"></jsp:include>

<jsp:include page="../quote_js.jsp"></jsp:include>
  </head>
  
  <body>
   
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="user/index.jsp"><h1><img src="resource/images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right">
					<!--<input type="text" class="form-control" placeholder="搜索...">-->
					<input type="submit" value=" ">
				</form>
			</div>
			<jsp:include page="../account.jsp" flush="true"></jsp:include>
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="top-navigation">
				<div class="t-menu">MENU</div>
				<div class="t-img">
					<img src="resource/images/lines.png" alt="" />
				</div>
				<div class="clearfix"> </div>
			</div>
				<jsp:include page="../menu.jsp" flush="true"></jsp:include>
				
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3></h3>
					</div>
					<!-- Menu -->
						<table class="table table-condensed table-bordered" style="width: 90%; text-align: center;">
      <thead>
      <tr>
           <th style="text-align: center;"><a href="admin!composite?type=0">电影管理</a></th>
            <th style="text-align: center;"><a href="admin!composite?type=1">用户管理</a></th>
            <th style="text-align: center;"><a href="admin!userPayOrder">支付订单查询</a></th>
        <th style="text-align: center;"><a href="admin!userOrder">电影票购买查询</a></th>
          <th style="text-align: center;"><a href="admin!loadPlace">电影场次</a></th>
          <th style="text-align: center;"><a href="admin/addfilm.jsp">添加电影</a></th>
      </tr>
   </thead>
    </table>
					
					
					
					
					
	<!-- Main -->			<div style="overflow-y:auto">
					<table class="table table-hover">
	<caption>场次信息</caption>
   <thead>
      <tr>
         <th>电影ID</th> 
         <th>放映日期</th>
         <th>放映开始时间</th>
         <th>放映结束时间</th>
          <th>操作</th>
      </tr> 
   </thead> 
   <tbody>  
   <s:iterator value="#request.place" id="place">
   <tr class="success"> 
        <td><s:property value="filmid"/></td>
        <td><s:property value="placeid"/></td>
        <td><s:property value="begintime"/></td>
        <td><s:property value="endtime"/></td>
        <td><a href="admin!deletePlace?placeid=<s:property value="placeid"/>">删除</a></td>
      </tr>
</s:iterator>
        </tbody>
    </table>
    	</div> </div>
    	    	<label style="font-size: 15px;">查询场次</label>
    	<form action="admin!findPlace">
    	
    	放映厅:<select name="placeroomid"><s:iterator value="#request.placerooms" id="placerooms"><option value="<s:property value="placeroomid"/>"><s:property value="placeroom"/></option></s:iterator></select><br>
    	
    	&nbsp;<br>
    	日期:<sx:datetimepicker name="date" displayFormat="yyyy-MM-dd"/><br>
        &nbsp;<br>
        <input type="submit" value="查询">
    	</form>
    	<div class="clearfix"> </div>  
    	<label style="font-size: 15px;">添加场次</label>
    	<form action="admin!addPlace">
    	
    	放映厅:<select name="placeroomid"><s:iterator value="#request.placeroom" id="placeroom"><option value="<s:property value="placeroomid"/>"><s:property value="placeroom"/></option></s:iterator></select><br>
    	
    	&nbsp;<br>
    	电影:<select name="filmid"><s:iterator value="#request.film" id="film"><option value="<s:property value="filmid"/>"><s:property value="filmname"/></option></s:iterator></select><br>
    	&nbsp;<br>
    	日期:<sx:datetimepicker name="date" displayFormat="yyyy-MM-dd"/><br>
        &nbsp;<br>
        开始时间:<sx:datetimepicker name="begintime" displayFormat="HH:mm:ss" type="time" language="ZH_CN"/><br>
        <input type="submit" value="添加">
    	</form>
					<div class="clearfix" style="margin-bottom: 280px;"> </div>  
				</div>
				
			<div style="bottom:0px; position: fixed; width: 100%; ">
			<jsp:include page="../footer.jsp" flush="true"></jsp:include>	
			</div>	
		<div class="clearfix"> </div>
	<div class="drop-menu">
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
		  <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
		</ul>
	</div>
  </body>
</html>
 
