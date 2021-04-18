<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/css/find.css">
<link rel="stylesheet" href="/css/findPw.css">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<jsp:include page="/jsp/header.jsp"></jsp:include>

	<div class="body_container">
		<div class="wrapper_find">
			<nav class="find_nav">
				<div class="unselect"
					onclick="location.href='/jsp/login/findId.jsp'">아이디 찾기</div>
				<div onclick="location.href='/jsp/login/findPw.jsp'">비밀번호 찾기</div>
			</nav>

			<form action="/findPw.do" method="POST" id="findPwForm">
				<div id="findPW">
					<p>
						아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다. <br>아이디가
						기억나지 않는다면 아이디를 먼저 찾아주세요.
					</p>
					<div class="veri_box pw_box">
						<input type="text" id="id" name="id"
							placeholder="비밀번호를 찾을 아이디를 입력하세요."> <br>
						<button type="button" onclick="pwSubmit()">다음</button>
					</div>

					<div class="mail">
						비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
					</div>
				</div>

			</form>
		</div>
	</div>
	<script src="/js/findPw.js"></script>
</body>

</html>