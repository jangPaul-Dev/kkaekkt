<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link rel="stylesheet" href="/css/find.css">
		<link rel="stylesheet" href="/css/findPw.css">
		<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	</head>

	<body>
		<jsp:include page="/jsp/header.jsp"></jsp:include>

		<div class="body_container">
			<div class="wrapper_find">
				<nav class="find_nav">
					<div class="unselect" onclick="location.href='/jsp/login/findId.jsp'">아이디 찾기</div>
					<div onclick="location.href='/jsp/login/findPw.jsp'">비밀번호 찾기</div>
				</nav>

				<div id="findPW">
					<form action="/updatePw.do" method="POST" id="pwChgForm">
						<div id="sendMail">
							<p>
								<span>${userPw.id}</span>님, 해당 아이디에 등록된 이메일로 인증 후 비밀번호 변경이
								가능합니다.
							</p>
							<div class="veri_box" style="text-align: center;">
								<div id="mail_box">
									<p>
										<span id="emailValue">${userPw.email}</span>
										<br>로 인증 메일을 전송하시겠습니까?
									</p>
									<button type="button" id="btn_checkemail" class="mail_check_button"
										onclick="fn_emailchk()">인증번호 전송</button>
									<!-- <label id="checkemail" value=""></label></br> -->

									<div hidden>
										<input name="id" type="test" value="${userPw.id}" id="id" placeholder="id">
										<input name="email" type="email" value="${userPw.email}" id="email"
											class="mail_input" placeholder="email">
									</div>
								</div>
								<div id="code_box" style="display: none;">
									<div id="mailChkDiv">
										<input class="mail_check_input" id="mail_check_input_box_false"
											disabled="disabled">
										<br>
										<button type="button" id="mail_check">인증하기</button>
										<span id='timeout'></span>
									</div>
								</div>
							</div>
						</div>
						<div id="verify" style="display: none;">
							<p>
								변경할 비밀번호를 입력해 주세요.
							</p>
							<div class="veri_box newPw_box">
								<div class="newPw_input">
									<ul>
										<li>
											새 비밀번호
										</li>
										<li>
											<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
												id="pw" minlength="8" maxlength="16">
											<br><label id="pw_label"></label>
										</li>
									</ul>
									<ul>
										<li>
											새 비밀번호 확인
										</li>
										<li>
											<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
												name="password" id="repw" minlength="8" maxlength="16">
											<br><label id="repw_label"></label>
										</li>
									</ul>
								</div>
								<button type="button" id="pw_btn" onclick="pwChgSubmit()">변경하기</button>

							</div>
						</div>
					</form>
					<!-- mail 안내사항 -->
					<div class="mail">
						<br> 비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
					</div>
				</div>

			</div>
		</div>
		<script src="/js/findPw.js"></script>
	</body>

	</html>