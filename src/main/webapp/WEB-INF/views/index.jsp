<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <meta name="twitter:site" content="@metroui">
    <meta name="twitter:creator" content="@pimenov_sergey">
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="Metro 4 Components Library">
    <meta name="twitter:description" content="Metro 4 is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with responsive grid system, extensive prebuilt components, and powerful plugins  .">
    <meta name="twitter:image" content="https://metroui.org.ua/images/m4-logo-social.png">

    <meta property="og:url" content="https://metroui.org.ua/v4/index.html">
    <meta property="og:title" content="Metro 4 Components Library">
    <meta property="og:description" content="Metro 4 is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with responsive grid system, extensive prebuilt components, and powerful plugins  .">
    <meta property="og:type" content="website">
    <meta property="og:image" content="https://metroui.org.ua/images/m4-logo-social.png">
    <meta property="og:image:secure_url" content="https://metroui.org.ua/images/m4-logo-social.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:image:width" content="968">
    <meta property="og:image:height" content="504">

    <meta name="author" content="Sergey Pimenov">
    <meta name="description" content="The most popular HTML, CSS, and JS library in Metro style.">
    <meta name="keywords" content="HTML, CSS, JS, Metro, CSS3, Javascript, HTML5, UI, Library, Web, Development, Framework">

    <link rel="shortcut icon" href="../../favicon.ico" type="image/x-icon">
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <link href="resources/css/metro-all.css?ver=4" rel="stylesheet">
    <link href="resources/css/start.css?ver=3" rel="stylesheet">
	
    <title>개인프로젝트</title>
    
    <style>
    
 @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}


    </style>
</head>

<body class="bg-dark fg-white h-vh-100 m4-cloak">

    <div class="container-fluid start-screen h-100">

        <div class="tiles-area clear" style="width:1000px; margin:0 auto;">
     		<c:if test="${sessionScope.SNAME != null }">
            <div class="tiles-grid tiles-group size-2 fg-white" data-group-title="${sessionScope.SNAME}님 어서오세요">
            
                <a href="transactions" data-role="tile" class="bg-indigo fg-white">
                    <img src="resources/images/puzzle.png" class="icon">
                    <span class="branding-bar">게시판</span>
                    
                </a>
           
                <a href="chat_login" data-role="tile" class="bg-cyan fg-white">
                
                    <img src="resources/images/love.png" class="icon">
                    <span class="branding-bar">채팅</span>
                   
                </a>
               
                <div data-role="tile" class="bg-green fg-white" class="icon">
                <a href="logout" data-role="tile" class="bg-green fg-white">
                	<img src="resources/images/windows.png" class="icon">
                    <span class="branding-bar">로그아웃</span>
                </a>
                </div>
                
               <a href="http://192.168.7.2:3000" data-role="tile" class="bg-red fg-white">
                    <img src="resources/images/debit-card.png" class="icon">
                    <span class="branding-bar">Shop</span>
                   
                </a>
            </div>
			</c:if>
			<c:if test="${sessionScope.SNAME == null }">
            <div class="tiles-grid tiles-group size-2 fg-white" data-group-title="guest님 어서오세요">
            
                <a href="transactions" data-role="tile" class="bg-indigo fg-white">
                    <img src="resources/images/puzzle.png" class="icon">
                    <span class="branding-bar">게시판</span>
                    
                </a>
           
                <a href="chat_login" data-role="tile" class="bg-cyan fg-white">
                
                    <img src="resources/images/love.png" class="icon">
                    <span class="branding-bar">채팅</span>
                   
                </a>
               
                <div data-role="tile" class="bg-green fg-white" class="icon">
                <a href="login" data-role="tile" class="bg-green fg-white">
                	<img src="resources/images/windows.png" class="icon">
                    <span class="branding-bar">로그인</span>
                </a>
                </div>
                
               <a href="http://192.168.7.2:3000" data-role="tile" class="bg-red fg-white">
                    <img src="resources/images/debit-card.png" class="icon">
                    <span class="branding-bar">Shop</span>
                   
                </a>
            </div>
			</c:if>
        </div>
    </div>

    <script src="resources/js/metro.js"></script>
    <script src="resources/js/start.js"></script>
    <script src="resources/js/jquery-3.3.1.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript">	

	window.onload = function(){
		
	}
	</script>
</body>
</html>