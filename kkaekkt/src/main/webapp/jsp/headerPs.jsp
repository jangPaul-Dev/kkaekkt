<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link rel="stylesheet" href="/css/all.css">
	<link rel="stylesheet" href="/css/header.css">
	<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var alertObj = {
			sender: ${ sessionScope.user.mno },
			senderName: `${sessionScope.user.name}`,
			mtype: ${ sessionScope.user.mtype }
			};
		var chatObj={
			sender:alertObj.sender,
			mtype:alertObj.mtype		
		};
	</script>
	<script src="/js/header.js"></script>
	<script src="/js/index.js"></script>

	<header class="head_container">
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
					<li>
						<span>${sessionScope.user.name}</span>님
					</li>
					<li>
						<div id="bellBox">
							<i class="fas fa-bell"></i>
							<span class="alertDot"></span>
							<div id="noticeBox">
								<ul id="noticeUl"></ul>
								<button>내 알림 전체보기</button>
							</div>
						</div>
					</li>
					<li>
						<div id="chatBox">
							<i class="fas fa-comments"></i>
							<!-- <i class="far fa-comment-dots fa-lg"></i> -->
							<span class="chatDot chatDotPs"></span>
							<div id="chatCont">
								<div class="chatHeader">
										<p>💬 채팅상담</p>
								</div>
								<div class="chatfooter">
								</div>
							</div>
						</div>
					</li>
					<li><a href="/jsp/mypageUser/mypagePs.jsp">마이페이지</a></li>
					<li><a href="/logout.do">로그아웃</a></li>
					<li><a href="/jsp/faq.jsp">FAQ</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<ul class="chatContainer"></ul> <!-- 채팅방 들어갈 ul -->