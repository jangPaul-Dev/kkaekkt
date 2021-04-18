<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kkaekkt.biz.user.PersonVO"%>
<%@ page import="com.kkaekkt.biz.reservation.ReservationListVO"%>
<%@ page import="com.kkaekkt.biz.comm.LaundryVO"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mypagePs.css">
</head>
<body>
	<jsp:include page="/jsp/headerPs.jsp" ></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_ps.jsp"></jsp:include>
		<div class="content">
			<p class="content_header">진행중 주문</p>
			<hr>
			<div class="rsvList">
			</div>
			<div class="page_btn_container">
				<ul class="page_btn">
					<!-- 맨처음으로 버튼 -->
					<li class="page_prevBlock"><i class="fas fa-angle-double-left"></i></li> 
					<!-- 이전 -->
					<li class="page_prev">
						<i class="fas fa-angle-left"></i>
					</li>
					<!-- 다음버튼 -->
					<li class="page_next">
						<i class="fas fa-angle-right"></i>
					</li>
					<!-- 맨마지막으로 버튼 -->
					<li class="page_nextBlock"><i class="fas fa-angle-double-right"></i></li>
				</ul>
			</div>
		</div>
	</div>
	<script src="https://kit.fontawesome.com/2fc57dd2db.js"
		crossorigin="anonymous"></script>
	<script>
            var pageObj={//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
                mno:${sessionScope.user.mno},
				mname:`${sessionScope.user.name}`,
				currentPageNum:1,
				listType:1,
                state:1
            };
			var likeObj={mno:${sessionScope.user.mno}};
    </script>
    <script src="/js/mypagePs.js"></script>
</body>
</html>