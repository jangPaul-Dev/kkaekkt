<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/mybio.css">
<link rel="stylesheet" href="/css/delete.css">

</head>

<body>
	<jsp:include page="/jsp/headerPs.jsp"></jsp:include>

	<div class="body_container">
	<div id="mask"></div>
		<jsp:include page="sidebar_ps.jsp"></jsp:include>
		<div class="content">
			<form action="/updatePs.do" method="POST" name="mybio">
				<h2 id="mybio_title">내 정보</h2>
				<button type="button" id="btn_mybio">수정하기</button>
				<div id="btn_mybioClick">
					<button type="button" id="btn_mybiofin">수정완료</button>
					<button type="button" id="btn_back">돌아가기</button>
				</div>
				<hr>
				<div id="mybio_info">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="read" name="id" readonly></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" id="read" name="mname" readonly></td>
						</tr>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input name="password" type="password" id="curpwd">
								<button type="button" id="btn_checkpwd">수 정</button> <label
								id="checkpwd"></label></td>
						</tr>
						<div id="btn_mybiopwd">
							<tr>
								<td>새 비밀번호</td>
								<td><input type="password" id="pwd"><label
									id="checkval"></label></td>
							</tr>
							<tr>
								<td>새 비밀번호 확인</td>
								<td><input type="password" id="newpwd">
									<button type="button" id="btn_updatepwd">변경하기</button> <label
									id="match"></label></td>
							</tr>
						</div>
						<tr>
							<td><input type="hidden" name="mno" value="" id="mno">
								<!-- 회원번호 -->
						</tr>
					</table>
					<div id="mybioPhone">
						연락처<br> <input id="phone1" type='text' maxlength='3'>
						- <input id="phone2" type="text" maxlength='4'> - <input
							id="phone3" type="text" maxlength='4'> <input
							name="phone" type="tel" id="phone" value="" hidden>
					</div>
					<div id="mybioBirth">
						생년월일<br> <input name="birth" type="text" id="input2 birth"
							value=""><label id="checkbirth" value=""></label>
					</div>
					<div>
						이메일<br> <input name="email" type="email" value="" id="email"
							class="mail_input">
						<button type="button" id="btn_checkemail"
							class="mail_check_button">이메일인증</button>
						<label id="checkemail" value=""></label></br>
						<div id="mailChkDiv">
							<input class="mail_check_input" id="mail_check_input_box_false"
								disabled="disabled"><span id='timeout'></span>
							<button type="button" id="mail_check">확인</button>
							</td>
							<br>
						</div>
					</div>
					<div id="mybioAddress">
						주소<br> <input type="text" id="postcode" placeholder="우편번호">
						<button type="button" onclick=execDaumPostcode() id="btn_address">우편번호
							찾기</button>
						<br> <input type="text" id="roadAddress" placeholder="도로명주소"><br>
						<!-- <span id="guide" style="color:#999;"></span><br> -->
						<input type="text" id="detailAddress" placeholder="상세주소">
						<input type="text" id="extraAddress" placeholder="참고항목">
						<span id="guide" style="color: #999; display: none"></span><br>
						<input type="hidden" name="address" id="address" value="">
						<!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->

						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script src="/js/adress.js"></script>

					</div>
				</div>

			</form>
			<!-- 모달부분 -->
			<div class="word">
				<input type="button" id="modal_show" value="회원탈퇴" /> <input
					type="hidden" class="DUorderChk" value="${reservation.count}" />

				<div id="modal_container">
					<button id="modal_close">
						<i class="fas fa-times"></i>
					</button>
					<div id="modal_bodycont">
						<!--  <form action="/deletePs.do" name=form method="POST">-->
						<div id="modal_head">
							<p>
								<input name="name" id="name"
									value="${sessionScope.user.name}님 탈퇴 하시겠어요?" readonly />
							</p>
							<p></p>
							<hr>

							<p>탈퇴하면 모든 정보가 지워집니다.</p>
							<p>정말 탈퇴하시겠어요?</p>
							<p>
								<input id="deleteid" name="id" value="${sessionScope.user.id}"
									readonly />
							</p>
							<input type="password" name="password" id="deletepwd" placeholder="비밀번호">
						</div>
						<br>
						<div id="modal_foot">
							<input id="yes" type="button" value="예" onclick="cheekpwd()" />
							<input id="nope" type="button" value="아니오" />
						</div>
						<!--  </form> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var pageObj = {//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
			mno : '${person.mno}',
			id : '${person.id}',
			name : '${person.name}',
			password : '${person.password}',
			phone : '${person.phone}',
			birth : '${person.birth}',
			email : '${person.email}',
			address : '${person.address}',

		};
	</script>
	<script src="/js/mybio.js"></script>
	<script src="/js/delete.js"></script>




</body>
</html>
