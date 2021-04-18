<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="com.kkaekkt.biz.user.PersonVO" %>
		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document</title>
			<link rel="stylesheet" href="/css/join.css">
			<link rel="stylesheet" href="/css/joinPerson.css">
			<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
		</head>

		<body>
			<jsp:include page="/jsp/header.jsp"></jsp:include>


			<div class="body_container">
				<div class="wrapper_joinInfo">
					<!-- <h2>회원가입</h2> -->
					<div class="join_seq">
						<div class="join_numBox">
							<ul>
								<li class="num">01</li>
								<li>약관동의</li>
							</ul>
						</div>
						<div>
							<i class="fas fa-chevron-right fa-3x"></i>
						</div>
						<div class="join_numBox">
							<ul>
								<li class="num">02</li>
								<li>회원유형선택</li>
							</ul>
						</div>
						<div>
							<i class="fas fa-chevron-right fa-3x"></i>
						</div>
						<div class="join_numBox numBox_select">
							<ul>
								<li class="num">03</li>
								<li>정보입력</li>
							</ul>
						</div>
						<div>
							<i class="fas fa-chevron-right fa-3x"></i>
						</div>
						<div class="join_numBox">
							<ul>
								<li class="num">04</li>
								<li>가입완료</li>
							</ul>
						</div>
					</div>
				</div>


				<div class="wrapper_select">
					<hr>
					<div class="wrapper_joinCnt">
						<div class="join_form">
							<h3>개인 회원</h3>
							<form action="/joinPs.do" method="POST" id="joinPerson" name="joinPerson">
								<div>
									<p>아이디</p>
									<input type="text" placeholder="" name="id" id="id" value="" minlength="6"
										maxlength="15">
									<!-- <button type="button" id="id_btn" class="idchk" id="idchk" onclick="fn_idchk()"
										value="N">중복확인</button> -->
									<br><label id="id_label"></label>


								</div>

								<div>
									<p>비밀번호</p>
									<!-- <label for="pw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
											id="pw" minlength="8" maxlength="16">
									</label> -->
									<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" id="pw"
										minlength="8" maxlength="16">
									<br><label id="pw_label"></label>

									<p>비밀번호 확인</p>
									<!-- <label for="repw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
											name="password" id="repw" minlength="8" maxlength="16">
									</label> -->
									<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
										name="password" id="repw" minlength="8" maxlength="16">
									<br><label id="repw_label"></label>

									<!-- <p style="font-size: smaller;"> </p> -->
								</div>
								<br> <br>

								<div>
									<p>이름</p>
									<input type="text" name="name" id="name" value="" minlength="2">
								</div>
								<!-- <div>
									<p>이메일</p>
									<input name="email" type="email" value="" id="email" class="mail_input">
									<button type="button" id="btn_checkemail" class="mail_check_button"
										onclick="fn_emailchk()">인증번호
										전송</button><label id="checkemail" value=""></label></br>
									<input class="mail_code_input" id="mail_code" disabled="disabled">
									<span id='timeout'></span>
									<button type="button" id="mail_check">인증하기</button>
									<br><label id="reqinput"></label>
								</div> -->


								<div>
									<p>이메일</p>
									<!-- <input type="email" name="email" id="email" disabled> -->
									<input name="email" type="email" value="" id="email" class="mail_input">
									<button type="button" id="btn_checkemail" class="mail_check_button"
										onclick="fn_emailchk()">인증번호
										전송</button><label id="checkemail" value=""></label></br>
									<div id="mailChkDiv">
										<input class="mail_check_input" id="mail_check_input_box_false"
											disabled="disabled">
										<button type="button" id="mail_check">확인하기</button>
										<span id='timeout'></span>
									</div>
									<br><label id="reqinput" style="color: var(--key-color);"></label>
								</div>

								<div class="phoneBox">
									<p>연락처</p>
									<input type="tel" placeholder="010-1234-5678" name="phone" id="phone">
									<!-- <input id="phone1" type="text" maxlength='3' name="ph"> -
									<input id="phone2" type="text" maxlength='4' name="ph"> -
									<input id="phone3" type="text" maxlength='4' name="ph">
									<input name="phone" type="tel" id="phone" value="" hidden> -->
									<br><label id="phone_label"></label>
								</div>

								<div>
									<p>생년월일</p>
									<input type="text" placeholder="YYYYMMDD" name="birth" id="birth" value=""
										maxlength="8">
									<br><label id="birth_label"></label>
								</div>

								<div>
									<p>주소</p>
									<!-- <input type="text" name="address" id="ad"> -->
									<input type="text" id="postcode" placeholder="우편번호" disabled>
									<button type="button" onclick=execDaumPostcode() id="btn_address">우편번호
										찾기</button><br>
									<input type="text" id="roadAddress" placeholder="도로명주소" disabled><br>
									<!-- <span id="guide" style="color:#999;"></span><br> -->
									<input type="text" id="detailAddress" placeholder="상세주소">
									<input type="text" id="extraAddress" placeholder="" disabled>
									<span id="guide" style="display:none"></span><br>
									<input type="hidden" name="address" id="address" value="">
									<!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->

									<script
										src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script src="/js/adress.js"></script>
								</div>



								<div class="join_btn">
									<button type="reset" name="reset">다시입력</button>
									<button type="button" name="join" id="join_submit"
										style="background-color: var(- -key-color);">가입하기</button>
									<!-- <input type="reset" name="reset" value="다시입력">
                        <input type="submit" name="join" value="가입하기"> -->
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- <footer>
					<p>
						<img src="img/logo-nowater.png" alt="" style="width: 100px;">
					</p>
					kkækkt <br> info@kkækkt.com <br> Copyright © 2021 All right
					Reserved.

					<div>고객센터 전화문의 1833-3429 평일 오전 9시 ~ 오후 6시 (주말. 공휴일 휴무) 제휴문의 :
						business@lifegoeson.kr</div>
				</footer> -->
			</div>
			<script src="/js/joinPs.js"></script>
		</body>

		</html>