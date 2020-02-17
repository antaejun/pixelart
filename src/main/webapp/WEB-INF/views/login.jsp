<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0 ,user-scalable=no ,target-densitydpi=medium-dpi" />
<title>개인 프로젝트</title>
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/login.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="resources/img/favicon.ico">
<script src="resources/js/sweetalert2.js"></script>
</head>

<body>
	<div class="loginBox">
		<div class="title">환영합니다</div>
		<div class="subTitle">로그인 해주세요.</div>
		<hr>
		<fieldset>
			<div class=email>
				<div>이메일</div>
				<input type="text" placeholder="이메일을 입력해주세요" value="" id="email">
			</div>
			<!--.email-->
		</fieldset>
		<fieldset>
			<div class=pw>
				<div>비밀번호</div>
				<input type="password" placeholder="비밀번호를 입력해주세요" value="" id="pw">
			</div>
			<!--.pw-->
		</fieldset>
		<button id="login">로그인</button>
		<div class="more">
			<!-- <div class="find">
				<a href="pass_find">비밀번호 찾기</a>
			</div> -->
			<div class="signup">
				<a href="register">회원가입</a>
			</div>
		</div>
	</div>
	<!--.loginBox-->
</body>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(function(){
		$('#login').click(function(){
			var input_id = $('#email').val();
			var input_pw = $('#pw').val();
		
			 var allData = JSON.stringify({email:input_id,password:input_pw});
			 
			$.ajax({
				url : "login",
				type : 'POST',
				dataType : "json",
				data : allData,
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					var res = data.result;
					console.log(res);
					if(res == "200"){
						$(function(){
						       swal({
						         type:'success',
						         title: '로그인',
						         showConfirmButton : false,
						         timer:1000
						       }).then((result)=>{
						          //if(result.value){
						          window.location.href='index';
						          //}
						       });
						    });
			
					}else{
						$(function(){
						       swal({
						         type:'error',
						         title: '이메일 또는 패스워드를 확인해주세요',
						         showConfirmButton : false,
						         timer:2500
						       }).then((result)=>{
						     
						       });
						    });
					}
				}

			});
		});
	});
</script>
</html>