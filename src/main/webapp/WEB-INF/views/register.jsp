<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0 ,user-scalable=no ,target-densitydpi=medium-dpi" />
<title>개인프로젝트</title>
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/join.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="shortcut icon" href="resources/img/favicon.ico">

</head>

<body>
	<div class="join">
		<div class="title">회원가입</div>
		<hr>
		
		<fieldset>
			<div class="number">
				<input type="hidden" id="email1" value="" />
				<div>이메일</div>
				<input type="text" placeholder="이메일을 입력해주세요" id="email"
					style="display: inline-block; width: 48%;">
				<button id="emailcheck">중복확인</button>
			</div>
			<!--.email-->
		</fieldset>
		<fieldset>
			<div class="name">
				<div>이름</div>
				<input type="text" placeholder="이름을 입력해주세요" id="name">
			</div>
			<!--.name-->
		</fieldset>
			

		<div id="popup_mask"></div>
		<!-- 팝업 배경 DIV -->

		<div id="popupDiv">
			<!-- 팝업창 -->
			<div class="modal-content">
				<div class="title">회원가입</div>
				<hr>
				<fieldset>
					<div class=certify>
						<div>인증번호</div>
						<input type="text" placeholder="인증번호 6자리를 입력해주세요" id="num_check">
					</div>
					<!--.email-->
					<button id="popCloseBtn">확인</button>
				</fieldset>
			</div>
		</div>

		<fieldset>
			<div class=pw>
				<div>비밀번호</div>
				<input type="password"
					placeholder="최소 8자리 숫자, 소문자 또는 대문자, 특수문자 각각 1개 이상" id="pw">
			</div>
			<!--.pw-->
		</fieldset>
		<fieldset>
			<div class=pwConfirm>
				<div>비밀번호 확인</div>
				<input type="password"
					placeholder="최소 8자리 숫자, 소문자 또는 대문자, 특수문자 각각 1개 이상" id="pwConfirm">
			</div>
			<!--.pwConfirm-->
		</fieldset>
		
		
		<div id="joins">
			<button id="register" onclick="mybtn()">회원가입</button>
		</div>
	</div>
	<!--.loginBox-->
</body>
<script src="resources/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	
	function mybtn(){
		
		var check = $('#check30').val();
		var email = $('#email').val();
		var name = $('#name').val();
		var pw = $('#pw').val();
		var pwcheck = $('#pwConfirm').val();
		
		var getCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);
		var getpw = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
		var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var blank_pattern = /[\s]/g;
		
		// 이메일 공백확인
		if($('#email').val() == ""){
			alert("이메일을 입력해주세요");
			$('#email').focus();
			return false;
		}
		// 이메일 유효성 검사
		if(!getMail.test($('#email').val())){
			alert("이메일형식에 맞게 입력해주세요");
			$('#email').val("");
			$('#email').focus();
			return false;
		}
		if( blank_pattern.test($('#email').val()) == true){
			alert('공백은 사용할 수 없습니다.');
			return false;
			
		}
		if($('#name').val() == ""){
			alert("사용하실 이름을 입력해주세요.");
			$('#name').focus();
			return false;
		}
		
		if ($("#pw").val() == "") {
			$("#pw").focus();
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (!getpw.test($("#pw").val())) {
			$("#pw").focus();
			alert("비밀번호는 8~12자리 영어대소문자, 숫자  조합으로 사용해주세요.");
			return false;
		}

		//비밀번호 확인란 공백 확인
		if ($("#pwConfirm").val() == "") {
			$("#pwConfirm").focus();
			alert("비밀번호 확인란을 입력하세요.");
			return false;
		}

		if ($("#pwConfirm").val() != ($("#pw")
				.val())) {
			alert("비밀번호가 서로 맞지않습니다.");
			$("#pwConfirm").val("");
			$("#pwConfirm").focus();
			return false;
		}
		
		if (confirm("회원가입을 하시겠습니까?")) {
			 if($('#email1').val() == ""){
				alert('이메일 중복확인을 해주세요');
				return false;
			}
			if($('#email1').val() == "false"){
				alert('이미사용중인 이메일입니다');
				return false;
			}
			if (idck == 0 || email.length == 0) {
				alert('이메일을 확인해주세요.');
				return false;
			} else { 
					var allData = JSON
							.stringify({
								email : email,
								password : pw,
								name : name,
									
							});
						console.log(allData);
						// "{ \"email\":"+"\""+email+"\""+"}";
				
						$('#joins').html('<button id= "register" disabled="disabled"  onclick="mybtn()" >회원가입</button>');
						
						$
								.ajax({
									url : "rest_register",
									type : 'POST',
									dataType : "json",
									data : allData,
									contentType : "application/json; charset=UTF-8",
									success : function(
											data) {
										
										if (data.result == "200") {
											alert("개인프로젝트에 오신것을 환영합니다.");
											window.location.href = 'login';
											
										} else {
											alert('이미 존재하는 이메일이거나 공백이 들어있는지 확인해주세요');
											$('#joins').html('<button id= "register" onclick="mybtn()" >회원가입</button>');
										}

									},
									error : function(
											jqXHR,
											textStatus,
											errorThrown) {
										$('#joins').html('<button id= "register" onclick="mybtn()" >회원가입</button>');
										alert('이미 존재하는 이메일이거나 공백이 들어있는지 확인해주세요');
									}

								});
					
				
			}
		}
		
	}

	
	$('#check1').click(function(){
		var check = $('#check10').text();
	
		$('#check30').val(check);
	});
	$('#check2').click(function(){
		var check = $('#check20').text();
	
		$('#check30').val(check);
	});
	
	$("#emailcheck").click(function(){
		var input_email = $('#email').val();
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		
		var allData = JSON.stringify({
			email : input_email,
			
		});
		
		$.ajax({
			url : "email_check",
			type : "POST",
			dataType : "json",
			data : allData,
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				var getCheck = RegExp(/^[a-zA-Z0-9]{6,12}$/);
			
				if (data.result == false) {
				alert('이미사용중인 이메일입니다');
				
				idck = 0;
				$('#email1').val('false');
					return false;
				} else {
					if (!getMail.test($("#email").val())) {
						alert('이메일 형식이 잘못되었습니다');
						
						$("#email").focus();
						$('#email1').val('false');		
						
						return false;
					} else {
						alert('사용가능한 이메일입니다');
						$('#email1').val('true');
						idck = 1;
					}
				}
				
			}
		},'json');
	});
		
	
	</script>
</html>