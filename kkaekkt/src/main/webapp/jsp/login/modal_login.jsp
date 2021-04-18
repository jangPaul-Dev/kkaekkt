<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
	<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
	<script src="/js/login.js"></script>
<title>Document</title>

</head>
<%
String clientId = "kEvFCZyOPXmysr20FrkK";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://localhost:8080/jsp/login/callback2.jsp", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
%>
<body>
	<div class="word">
		<a id="modal_show">로그인</a>

		<div id="modal_container">
			<button id="modal_close">x</button>
			<div id="modal_bodycont">
			<form>
				<div id="modal_head">
					<h2>로그인</h2>
				</div>
				<div id="modal_foot">
					<form action="/login.do" method="post">
						<div class="login_box">

							<input type="text" name="id" id="id" placeholder=" 아이디" /> <input
								type="password" name="password" id="password"
								placeholder=" 비밀번호" />
						<input type="button" id="login" value="로그인" />
						</div>
					</form>
					<div class="finds">
						<a href="/jsp/login/findId.jsp">아이디 찾기</a> <a
							href="/jsp/login/findPw.jsp">비밀번호 찾기</a>
					</div>
						<hr>
					<div class="the_others">
						<!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
						<p>다른 계정으로 로그인</p>
						<form id="snsForm" action="/loginSNS.do" method="POST">
							<input type="hidden" id="snsMail" name="email">

							<div class="login_API">
								<a onclick="kakaoLogin()"><img id="kakao"
									src="/img/kakao.png"></a>
								<div id="naver_id_login" style="display: none;"></div>
								<a class="img_naver"
									onclick="document.getElementById('naver_id_login_anchor').click();"><img
									id="naver" src="/img/naver.png"></a>
							</div>
						</form>
					</div>
					<!-- the others -->
					<hr>
					<div class="login_foot">
						<p>©깨끝 All copyrights reserved.</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("kEvFCZyOPXmysr20FrkK",
				"http://localhost:8080/jsp/login/callback.jsp");
		var state = naver_id_login.getUniqState();
		// naver_id_login.setButton("green", 4, 45);
		naver_id_login.setDomain("/jsp/index.jsp");
		naver_id_login.setState(state);
		/*  naver_id_login.setPopup();*/
		naver_id_login.init_naver_id_login();
	</script>
</body>
<script src="/js/kakaoLogin.js"></script>


</html>