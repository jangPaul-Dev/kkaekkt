<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/coinspec.css">
</head>
<body>
	<jsp:include page="/jsp/headerBs.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_coin.jsp"></jsp:include>
		<div class="content">
			<div id="coinspec_title">설비관리</div>
			<hr>
			<div class="coinLaundry">
				<form action="/updateSpec.do" method="POST">
					<!-- float left -->
					<div id="coinspec_left">
						<!--세탁기 사양-->
						<div id="card">
							세탁기 사양
							<hr>
						
								<table class="equip" id="coinLaundry">
								<th>용량 </th>
								<th>개수</th>
								<th>이용금액(분당)</th>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" name="equip" value=1 /> <span class="checkbox-icon">
										</span>
									</span> 중(20kg미만)</td>
									<td id="selectbox">
									<select>										
											<option value="1">1대</option>
											<option value="2">2대</option>
											<option value="3">3대이상</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" name="equip" value=2 /> <span class="checkbox-icon"></span>
									</span> 대(20kg~40kg미만)</td>
									<td id="selectbox">
									<select>
											<option value="1">1대</option>
											<option value="2">2대</option>
											<option value="3">3대이상</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" name="equip" value=3 /> <span class="checkbox-icon"></span>
									</span> 특대(40kg이상)</td>
									<td id="selectbox">
									<select>
											<option value="1">1대</option>
											<option value="2">2대</option>
											<option value="3">3대이상</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
							 <input type="hidden" name="equipment" >
						</div>
						<!--부가서비스-->
						<div id="card">
							부가서비스
							<hr>
							<table id="etc">
								<th>품목</th>
								<th>추가금액</th>
								<tr>
									<td><span class="checkbox checkbox-circle"> 
										<input type="checkbox" id="etc" value=1 /> <span class="checkbox-icon"></span>
									</span> 향균세탁</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> 
									<input type="checkbox" id="etc" value=2 /> <span class="checkbox-icon"></span>
									</span> 특수세제(울/유아용등)</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> 
									<input type="checkbox" id="etc" value=3 /> <span class="checkbox-icon"></span>
									</span> 섬유유연제</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> 
									<input type="checkbox" id="etc" value=4 /> <span class="checkbox-icon"></span>
									</span> 픽업봉투</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
							</table>
							 <input type="hidden" name="etc" >
						</div>
					</div>

					<!-- float right -->
					<div id="coinspec_right">
						<!--건조기-->
						<div id="card">
							건조기
							<hr>
							<table class="equip" id="dry">
								<td>개수</td>
							<input type="checkbox" name="equip" value=4 hidden  checked/>
								<td id="selectbox">
								<select>
										<option value="1">1대</option>
										<option value="2">2대</option>
										<option value="3">3대이상</option>
								</select></td>
								<td>이용금액</td>
								<td><input id="won" type="text" placeholder="받아온 정보"
									disabled> 원(분당)</td>

							</table>
						</div>
						<!--운영시간-->
						<div id="card">
							운영시간
							<hr>
							<div id="week">
								<button type="button" id="week_1">월</button>
								<button type="button" id="week_2">화</button>
								<button type="button" id="week_3">수</button>
								<button type="button" id="week_4">목</button>
								<button type="button" id="week_5">금</button>
								<button type="button" id="week_6">토</button>
								<button type="button" id="week_7">일</button>
								<button type="button" id="week_8" class="two">매일</button>
								<button type="button" id="week_9" class="two">평일</button>
								<button type="button" id="week_10" class="two">주말</button>
							</div>

							<div id="weekBox">
								<ul>

								</ul>
								<input type="hidden" name="schedule" >
							</div>
						</div>
					</div>
					<div id="btn_update">
						<button type="button" onclick="" id="updateSpec">수정하기</button>
						<div id="btn_change">
							<button type="reset" onclick="" id="resetSpec">돌아가기</button>
							<button type="button" onclick="" id="submitSpec">수정완료</button>
						</div>
					</div>
					<input type="text" name="bno" hidden>
					<input type="text" name="bizType" value="0" hidden>
				</form>
			</div>
			<!-- container -->

	
			</div>
		</div>
		<script>
		var pageObj={//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
                bno:'${sessionScope.user.bno}'//더미번호 (추후 세션에서 받아올 예정)
            };
	</script>
	<script src="/js/coinspec.js"></script>
	
</body>
</html>