<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<body onload="f()">
				<div class="drop-navigation drop-navigation">
				  <ul class="nav nav-sidebar">
					<li id="li1"><a href="main.action" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
				  </ul>
				  <!-- script-for-menu -->
						<script>
							$( ".top-navigation" ).click(function() {
							$( ".drop-navigation" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
							function f(){
							var url=window.location.href;
							var i=0;
							if(url.indexOf("movies")!=-1){
							i=1;
							}
							switch(i){
							case 0: {$('#li1').addClass("active");break;}
							case 1: {$('#li2').addClass("active");break;}
							}
							}
						</script>
					<div class="side-bottom">
						<div class="side-bottom-icons">
							<ul class="nav2">
								<li><a href="#" class="facebook"> </a></li>
								<li><a href="#" class="facebook twitter"> </a></li>
								<li><a href="#" class="facebook chrome"> </a></li>
								<li><a href="#" class="facebook dribbble"> </a></li>
							</ul>
						</div>
						<div class="copyright">
							<p>Copyright &copy; 2017.MovieSystem All rights reserved. <a href="" target="_blank" title=""></a></p>
						</div>
					</div>
				</div>
				</div>
				</body>