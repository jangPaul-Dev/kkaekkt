<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
*:focus {
    outline: none;
}
hr {
height: 1px;
border: none;
background-color: var(--gray-color);
/* border: solid 0.5px var(--gray-color); */
width: 85%;
margin: 10px 0 20px 0;
}
.content {
float:left;
width: 65vw;
height: 100vh;
padding: 10px 0px 30px 250px;
font-size: 14px;
color: var(--text-gray);
}
#salesManage_title {
    font-size:17px;
    font-weight: bold;
    color: var(--text-gray);
}
</style>


</head>
<body>
	<jsp:include page="/jsp/headerBs.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_bs.jsp"></jsp:include>
		<div class="content">
            <hr>
			<jsp:include page="daygrid-views.html"></jsp:include>

		</div>
	</div>
	<script>
		$(document).ready(function () {
			$(".side_sub").hide();
			$('.side button').eq(3).addClass("side_select");
		});
		var date = new Date();
		var startDt =new Date(date.getFullYear(), date.getMonth(), 1);
		var endDt = new Date(date.getFullYear(), date.getMonth(), date.getDate());
		var pageObj={//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
                bno:'${user.bno}',//더미번호 (추후 세션에서 받아올 예정)
				startDt:startDt,
				endDt:endDt
            };
	</script>
</body>
</html>