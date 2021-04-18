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
<title>Document</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css">
</head>

<body>
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
	<jsp:include page="/jsp/header.jsp"></jsp:include>

	<div class="body_container">
		<div class="content">
			<div class="login">
				<form action="/login.do" method="post">
					<a href="http://developers.kakao.com/logout"><h2 class="loginTitle">로그인</h2></a>
					<hr>
					<div>
						<input type="text" name="id" id="id" placeholder="아이디" />
					</div>
					<div>
						<input type="password" name="password" id="password"
							placeholder="비밀번호" />
					</div>
					<input type="button" id="login" value="로그인" />
				</form>
				<div>
					<div>
						<a href="/jsp/login/findId.jsp">아이디 찾기</a> 
						<a href="/jsp/login/findPw.jsp">비밀번호 찾기</a>
					</div>
					<hr>
					<div>
						<!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
						<p>다른 계정으로 로그인</p>
						<form id="snsForm" action="/loginSNS.do" method="POST">
							<input type="hidden" id="snsMail" name="email"> <a
								onclick="kakaoLogin()"><img id="kakao" src="/img/kakao1.png"></a>
							<!-- 네이버아이디로로그인 버튼 노출 영역 -->
							<div id="naver_id_login"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 바디콘테이너 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("kEvFCZyOPXmysr20FrkK",
				"http://localhost:8080/jsp/login/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 40);
		naver_id_login.setDomain("/jsp/index.jsp");
		naver_id_login.setState(state);
		/*  naver_id_login.setPopup();*/
		naver_id_login.init_naver_id_login();
	</script>
</body>
<script src="/js/kakaoLogin.js"></script>
<script src="/js/login.js"></script>
</html>