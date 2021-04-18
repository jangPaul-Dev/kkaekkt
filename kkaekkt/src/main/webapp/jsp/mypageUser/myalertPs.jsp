<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<link rel="stylesheet" href="/css/myalert.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/head0.css">
<link rel="stylesheet" href="/css/sidebar.css">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>

<body>
    <jsp:include page="/jsp/headerPs.jsp"></jsp:include>
    <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <div id="alertHeader">
                <div id="headerLeft">
                    <button id="total" class="selected">전체</button>
                    <button id="check">결제</button>
                    <button id="complete">완료</button>
                    <button id="reply">답글</button>
                    <button id="cancel">취소</button>
                </div>
                <div id="headerRight">
                    <button id="readDelBtn">읽은 알림 삭제</button>
                    <button id="totalDelBtn">모두 삭제</button>
                    <i class="fas fa-redo-alt"></i>
                </div>
            </div>
            <hr>
            <div id="alertListBox">
            </div>
        </div>
    </div>
    <script src="/js/myalert.js"></script>
</body>
</html>