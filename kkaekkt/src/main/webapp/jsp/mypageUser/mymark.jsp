<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mymark.css">
</head>
<body>
    <div id="mask"></div>
	<jsp:include page="/jsp/headerPs.jsp"></jsp:include>
	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p id="mymark_title">내가찜한세탁소</p>
            <hr>
        </div>
    </div>
    <div id="modal_container">
        <button id="modal_close">x</button>
            <p class="modal_Header">예약 하기</p>
            <!-- <p>취급품목</p> -->
	        <hr>
	        <table id="single_option">
            </table>
            <div id="modal_footer">
                <p class="modal_Header">결제 정보</p>
                <hr>
                <div class="userInfo">
                    <p>예약자: <span id="name">${userDetail.name}</span></p>
                    <p>연락처: <span id="phone">${userDetail.phone}</span></p>
                    <p>주소: <span id="address">${userDetail.address}</span></p>
                </div>
                <div class="bsInfo">
                    <p>예약 업체: <span class="bname"></span></p>
                    <p>마감 예정일자: <span id="dDay"></span></p>
                </div>
                <div class="termsInfo">
                    <p id="terms">개인정보 수집, 제공 &nbsp;</p>
                    <div id="agreement">
                        <div id="agreementTop">
                            <span>개인정보 수집 동의</span><i value="0" class="fas fa-chevron-down"></i>
                        </div>
                        <div class="termsText">
<개인정보 수집 동의><br><br>
1. 기본수집항목: [필수] kkaekkt 아이디, 이름, 전화번호, 주소<br>
※ 추가 수집하는 필수항목<br>
- 배송, 방문 등이 필요한 상품 구매 시 : 주소<br>
- 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 성별, 
생년월일, 이메일주소, 카카오톡ID, 동행 아동정보(여권상 영문명, 생년월일, 신장)<br>
- 병원을 이용하는 경우: 생년월일<br>
<br>
2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존<br>
<br>
3. 보관기간<br>
- 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관<br>
- 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 <br>
  법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요<br>
  한 경우에는 해당 기간 동안 보관함<br>
  <br>
4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br>
<br>
                        </div>
                        <div id="agreementBottom">
                            <span>개인정보 제공 동의</span><i value="1" class="fas fa-chevron-down"></i>
                        </div>
                        <div class="termsText">
<span>1. 개인정보를 제공받는 자 : <span  class="bname"></span>
<br>
<br>
2. 제공하는 기본 개인정보 항목:  [필수] kkaekkt 아이디, 이름, (휴대)전화번호, 주소<br>
※ 추가 제공하는 필수항목<br>
- 배송, 방문 등이 필요한 상품 구매 시 : 주소<br>
- 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 생년월일, 이메일주소, 카카오톡ID, 동행 아동정보(여권상 영문명, 생년월일, 신장)<br>
- 병원을 이용하는 경우: 생년월일<br>
<br>
3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 분석과 통계에 따른 혜택 및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 기록보존<br>
<br>
4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : kkaekkt 회원탈퇴 시 또는 위 개인정보 이용목적 달성 시 까지 이용합니다.<br>
<br>
5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br>
<br>
                        </div>
                    </div>
                    <p id="cancelTerms">취소/환불 규정</p>
                    <p id="warning">(주문취소는 1시간 이내에 한하여 자동처리되며, 그 외 업체에 문의 후 처리될 수 있습니다.)</p>
                    <p id="cancelInfo">예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에동의합니다.</p>
                </div>
                <div class="comBtnDiv">
                    <button id="comBtn">결 제</button>
                    <button id="closeBtn">취 소</button>
                </div>
            </div>
    </div>
    <script>
        var likedBsList=${likedBsList};
        var likeObj={
            mno:alertObj.sender
        };
        var rsvObj={
            mno:alertObj.sender
        };
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="/js/mymark.js"></script>
</body>
</html>