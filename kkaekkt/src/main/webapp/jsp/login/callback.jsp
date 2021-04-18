<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("kEvFCZyOPXmysr20FrkK",
				"http://localhost:8080/jsp/login/callback.jsp");
		// 접근 토큰 값 출력
		console.log(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			var naver = naver_id_login.getProfileData;
			var userEmail = naver('email');

			console.log(userEmail);

			$.ajax({
				url : '/loginSNS.do',
				type : 'POST',
				data : {
					email : userEmail,
				},
				success : function(result) {
					if (result == "fail") {
						alert("회원정보 없음");
					} else {
						location.href = "/index.do";
					}
				}
			}); // 
			ajax
		}
	</script>
</body>
</html>
