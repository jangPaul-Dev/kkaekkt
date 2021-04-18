<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kkaekkt.biz.comm.CommListVO"%>
<%@ page import="com.kkaekkt.biz.comm.CommVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매장관리</title>
    <link rel="stylesheet" href="/css/reviewMg.css">
    <script src="https://kit.fontawesome.com/2fc57dd2db.js"
        crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<div id="mask"></div>
    <jsp:include page="/jsp/headerBs.jsp" ></jsp:include>
    <div class="body_container">
        <jsp:include page="sidebar_bs.jsp"></jsp:include>
            <div class="content">
				<div class="content_header">
					<p>전체 개수 : <span></span> 개</p>
					<div class="searchBox">
						<select>
							<option value="1">이름</option>
                            <option value="3">평점</option>
							<option value="2">주문번호</option>
						</select>
						<i class="fas fa-search"></i>
						<input type="text" class="search" value="" onkeypress="enter()">
					</div>
				</div>
				<hr>
                <div class="process">
					<div class="order">
						<p>전체 리뷰</p>
						<div class="selectbox">
							<label class="select">ㅤ최신순ㅤ</label>
							<select>
								<option value=1>ㅤ최신순ㅤ</option>
								<option value=2>평점높은순</option>
								<option value=3>평점낮은순</option>
							</select>
						</div>
					</div>
					<table class="reviewHeader">
						<tr>
                            <!-- 번호 내용 별점 이름 등록일 주문번호  -->
							<th class="cell1">번호</th>
							<th class="cell2">내용</th>
							<th class="cell3">평점</th>
							<th class="cell4">이름</th>
							<th class="cell5">주문번호</th>
							<th class="cell6">등록일</th>
							<th class="cell7">상태 및 변경</th>							
						</tr>
					</table>
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
				<button id="modal_close">x</button>
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
	</div>
	<script>
		var pageObj = {
			bno:${sessionScope.user.bno},
			depth:1,
			order:1
		};
	</script>
	<script src="/js/reviewMg.js"></script>
</body>
</html>