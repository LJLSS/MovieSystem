<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心首页</title>
    
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
 <style type="text/css">
 label{font-size: 16px;}
 </style>
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
					
					
					
					
					
	<!-- Main -->		
	<div>
	
  
<br><label>添加电影</label>
<form action="admin!addFilm" enctype="multipart/form-data" method="post">
<div class="form-group">
    <label for="name">电影名</label>
    <input type="text" class="form-control" name="film.filmname" style="width: 15%;" >
  </div>
<div class="form-group">
    <label for="name">电影详情</label>
    <input type="text" class="form-control" name="film.filminfo" style="width: 15%;" >
  </div>
<div class="form-group">
    <label for="name">演员</label>
    <input type="text" class="form-control" name="film.filmactor" style="width: 15%;" >
  </div>
  
  <div class="form-group">
    <label for="name">电影评分</label>
    <input type="text" class="form-control" name="film.filmstar" style="width: 15%;" >
  </div>
  <div class="form-group">
    <label for="name">售价</label>
    <input type="text" class="form-control" name="film.price" style="width: 15%;" >
  </div>
  <div class="form-group">
    <label for="name">图片</label>
    <input type="file" class="form-control" name="myfile" style="width: 15%;" >
  </div>
  <div class="form-group">
    <label for="name">电影类型</label>
    <input type="text" class="form-control" name="film.filmtype" style="width: 15%;" >
  </div>
  <div class="form-group">
    <label for="name">电影时长</label>
    <input type="text" class="form-control" name="film.filmtime" style="width: 15%;" >
  </div>
  <input type="submit" class="btn btn-default" value="提交">
</form>
    	
		</div>	</div></div>				 
					<div class="clearfix" style="margin-bottom: 280px;"> </div>  
			
				
			<div style="bottom:0px; position: fixed; width: 100%;">
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
 