<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<script>
    window.onload = function () {
        const items = document.querySelectorAll(".accordion button");
        
        function toggleAccordion() {
            const itemToggle = this.getAttribute("aria-expanded");
            
            for (i = 0; i < items.length; i++) {
                items[i].setAttribute("aria-expanded", "false");
            }
            
            if (itemToggle == "false") {
                this.setAttribute("aria-expanded", "true");
            }
        }
        
        items.forEach((item) => item.addEventListener("click", toggleAccordion));
        
        }

</script>
<style>

.Faqcontainer {
  margin: 0 auto;
  padding: 4rem;
  width: 48rem;
  color: var(--text-gray);
}

.accordion .accordion-item {
  border-bottom: 1px solid #e5e5e5;
}
.accordion .accordion-item button[aria-expanded=true] {
  border-bottom: 1px solid var(--key-text);
}
.accordion button {
  position: relative;
  display: block;
  text-align: left;
  width: 100%;
  padding: 1em 0;
  color:var(--text-grey);
  font-size: 1.15rem;
  font-weight: 400;
  border: none;
  background: none;
  outline: none;
}
.accordion button:hover, .accordion button:focus {
  cursor: pointer;
  color: var(--key-text);
}
.accordion button:hover::after, .accordion button:focus::after {
  cursor: pointer;
  color: var(--key-text);
  border: 1px solid var(--key-text);
}
.accordion button .accordion-title {
  padding: 1em 1.5em 1em 0;
}
.accordion button .icon {
  display: inline-block;
  position: absolute;
  top: 18px;
  right: 0;
  width: 22px;
  height: 22px;
  border: 1px solid;
  border-radius: 22px;
}
.accordion button .icon::before {
  display: block;
  position: absolute;
  content: "";
  top: 9px;
  left: 5px;
  width: 10px;
  height: 2px;
  background: currentColor;
}
.accordion button .icon::after {
  display: block;
  position: absolute;
  content: "";
  top: 5px;
  left: 9px;
  width: 2px;
  height: 10px;
  background: currentColor;
}
.accordion button[aria-expanded=true] {
  color: var(--key-text);
}
.accordion button[aria-expanded=true] .icon::after {
  width: 0;
}
.accordion button[aria-expanded=true] + .accordion-content {
  opacity: 1;
  max-height: 9em;
  transition: all 200ms linear;
  will-change: opacity, max-height;
}
.accordion .accordion-content {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  transition: opacity 200ms linear, max-height 200ms linear;
  will-change: opacity, max-height;
}
.accordion .accordion-content p {
  font-size: 1rem;
  font-weight: 300;
  margin: 2em 0;
}
.side_sub{
    display: none;
}
</style>
<body>
    <c:choose>
        <c:when test="${user.mtype==1}">
            <jsp:include page="/jsp/headerPs.jsp"></jsp:include>
        </c:when>
        <c:when test="${user.mtype==2}">
            <jsp:include page="/jsp/headerBs.jsp"></jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/jsp/header.jsp"></jsp:include>
        </c:otherwise>
    </c:choose>

<div class="body_container">
    <jsp:include page="mypageUser/sidebar_ps.jsp"></jsp:include>
<div class="contend">
    <div class="Faqcontainer">
        <h2>자주 묻는 질문</h2>
        <div class="accordion">
          <div class="accordion-item">
            <button id="accordion-button-1" aria-expanded="false"><span class="accordion-title">[이용방법]</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>예약-> 문 앞에 세탁물 놓기(12시간 이내에 수거합니다.)->수거, 세탁->배송!</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-2" aria-expanded="false"><span class="accordion-title">[배송] - 기간</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>세탁물에 따라 1~3일, 4~7일 정도 소요됩니다.<br>
                 배송은 세탁이 완료 후 1~2일 안에 배송됩니다.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-3" aria-expanded="false"><span class="accordion-title">[배송] - 세탁물 누락</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>채팅상담 또는 연락처를 통해 업체와 연락 바랍니다.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-4" aria-expanded="false"><span class="accordion-title">[취소] - 예약 취소</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>예약 후 1시간 이내에만 취소가 가능합니다.<br>
                1시간이 지났다면 업체에 연락해 주세요.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-5" aria-expanded="false"><span class="accordion-title">[취소] - 예약 취소했는데, 수거해 갔어요.</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>채팅상담 또는 연락처를 통해 업체와 연락 바랍니다.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-6" aria-expanded="false"><span class="accordion-title">[취소] - 예약했는데, 취소되었어요.</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>업체 사정에 따라서 예약이 취소될 수 있습니다.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-7" aria-expanded="false"><span class="accordion-title">[결제수단] - 결제수단 변경</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>결제완료 이후에는 결제수단 변경이 가능하지 않습니다.<br>
                예약 취소 후 원하시는 결제수단으로 다시 한 번 예약해 주시기 바랍니다.</p>
            </div>
          </div>

        </div>      <!--accordion end-->
      </div>    <!--contaoner end-->
</div>
</div>
</body>
</html>