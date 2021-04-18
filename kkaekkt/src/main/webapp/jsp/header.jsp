<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link rel="stylesheet" href="/css/all.css">
	<link rel="stylesheet" href="/css/header.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"rel="stylesheet">
	<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"charset="utf-8"></script>
	<script src="/js/login.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
	<header class="head_container">
	<div id="mask"></div>		
		<nav class="head">
			<div class="menu">
				<ul>
					<li><a href="/showMap.do?type=1">일반세탁소</a></li>
					<li><a href="/showMap.do?type=2">코인세탁소</a></li>
				</ul>
			</div>
			<div class="head_logo">
				<div class="logo">
					<a href="/index.do"> <img id="logoImg" src="/img/logo.png" alt="">
					</a>
				</div>
			</div>
			<div class="head_right">
				<ul>
					<li><a href="/jsp/join/joinTerms.html">회원가입</a></li>
					<li><a id="modal_show">로그인</a></li>
					<li><a href="/jsp/faq.jsp">FAQ</a></li>
				</ul>
			</div>
		</nav>
		
		<div id="modal_container">
			<button id="modal_close">
				 <i class="fas fa-times"></i>
			</button>
			<div id="modal_bodycont">
				<form>
					<div id="modal_head">
						<h2>로그인</h2>
					</div>
					<div id="modal_foot">
						<form action="/login.do" method="post">
							<div class="login_box">

								<input type="text" name="id" id="id" placeholder=" 아이디" /> <input type="password"
									name="password" id="password" placeholder=" 비밀번호" /> <input type="button" id="login"
									value="로그인" />
							</div>
						</form>
						<div class="finds">
							<a href="/jsp/login/findId.jsp">아이디 찾기</a> <a href="/jsp/login/findPw.jsp">비밀번호 찾기</a>
						</div>
						<hr>
						<div class="the_others">
							<!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
							<p>다른 계정으로 로그인</p>
							<form id="snsForm" action="/loginSNS.do" method="POST">
								<input type="hidden" id="snsMail" name="email">

								<div class="login_API">
									<a onclick="kakaoLogin()"><img id="kakao" src="/img/kakao.png"></a>
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
		<script src="/js/kakaoLogin.js"></script>
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


	</header>