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
<title>Document</title>
<link rel="stylesheet" href="/css/mypagePs.css">
</head>
<body>
	<jsp:include page="/jsp/headerPs.jsp" ></jsp:include>
	<div class="body_container">
			<jsp:include page="sidebar_ps.jsp"></jsp:include>
			<div class="content">
				<p class="content_header">완료된 주문</p>
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
			<div id="modal_container">
				<i class="fas fa-times"></i>
				<div id="modal_bodycont">
						<div id="modal_head">
							<p>만족도를 평가해주세요</p>
								<input id="starVal" value="5">
								<div class="rating-group" value="">
									<label aria-label="1 star" class="rating__label" for="rating-1">
									<i class="rating__icon rating__icon--star fa fa-star"></i></label> 
									<input class="rating__input" name="rating" id="rating-1" value="1" type="radio" checked> 
						
									<label aria-label="2 stars"   class="rating__label" for="rating-2">
									<i   class="rating__icon rating__icon--star fa fa-star"></i></label>             
									<input class="rating__input" name="rating" id="rating-2" value="2" type="radio" checked>
						
									<label aria-label="3 stars" class="rating__label" for="rating-3">
										<i class="rating__icon rating__icon--star fa fa-star"></i></label> 
									<input class="rating__input" name="rating" id="rating-3" value="3" type="radio" checked>
						
									<label aria-label="4 stars" class="rating__label" for="rating-4">
										<i class="rating__icon rating__icon--star fa fa-star"></i></label>            
									<input class="rating__input" name="rating" id="rating-4" value="4" type="radio" checked>
									
									<label aria-label="5 stars" class="rating__label" for="rating-5">
										<i class="rating__icon rating__icon--star fa fa-star"></i></label>                
									<input class="rating__input" name="rating" id="rating-5" value="5" type="radio" checked>
								</div>
						</div>
						<hr style="width: 80%; margin-top: 40px; border: 1px solid #E5E5E5;">
						<div id="modal_foot">
							<p style="text-align: center;">업체의 서비스는 어떠셨나요?</p>
                            <textarea id="review_text" maxlength="300"  placeholder="최대 300자까지 작성할 수 있습니다."></textarea>
                            <div id="review_sub">
                                <span id="review_texter">0</span><span> / 300</span>
                            </div>
                            <div id="review_btn">
                                <button id="closeBtn">돌아가기</button>
                                <button id="regit">등록하기</button>
                            </div>
						</div>
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
                state:3
            };
			var likeObj={mno:${sessionScope.user.mno}};
			var commObj={};
    </script>
    <script src="/js/mypagePs_com.js"></script>
</body>
</html>