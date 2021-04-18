<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kkaekkt.biz.user.BusinessVO"%>
<%@ page import="com.kkaekkt.biz.reservation.ReservationListVO"%>
<%@ page import="com.kkaekkt.biz.comm.LaundryVO"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장관리</title>
<link rel="stylesheet" href="/css/mypageBs_com.css">
</head>

<body>
	<div id="mask"></div>
	<jsp:include page="/jsp/headerBs.jsp"></jsp:include>
	<div class="body_container">
			<jsp:include page="sidebar_bs.jsp"></jsp:include>
			<div class="content">
				<div class="content_header">
					<p>전체 개수 <span></span>개</p>
					<div class="searchBox">
						<select>
							<option value="1">이름</option>
							<option value="2">주문번호</option>
						</select>
						<i class="fas fa-search"></i>
						<input type="text" class="search" value="" onkeypress="enter()">
					</div>
				</div>
				<hr>
				<div class="process">
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
			<div id="modal_container">
				<button id="modal_close"><i class="fas fa-times"></i></button>
				<div id="modal_bodycont">
						<div id="modal_foot">
							<p style="text-align: center;"></p>
							<div id="review_btn">
								<button id="closeBtn">돌아가기</button>
								<button id="ok"></button>
							</div>                
						</div>
				</div>
			</div>
			<div id="modal_userInfo">
				<button id="modal_close" onclick="modalClose()"><i class="fas fa-times"></i></button><br>
				<h2>고객정보</h2>
				<hr>
				<div id="userInfo_bodycont">
				
				</div>
				<div id="modal_foot">
					<p style="text-align: center;"></p>
					<div id="review_btn">
						<button id="closeBtn" onclick="modalClose()">돌아가기</button>
					</div>                
				</div>			 
			</div>
		</div>
	<script src="https://kit.fontawesome.com/2fc57dd2db.js"
		crossorigin="anonymous"></script>
	<script>
            var pageObj={//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
                bno:${sessionScope.user.bno},
				currentPageNum:1,
				listType:4
            };
			var rsvObj={};
    </script>
	<script src="/js/mypageBs_com.js"></script>
</body>
</html>