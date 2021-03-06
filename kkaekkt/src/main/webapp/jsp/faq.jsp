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
        <h2>?????? ?????? ??????</h2>
        <div class="accordion">
          <div class="accordion-item">
            <button id="accordion-button-1" aria-expanded="false"><span class="accordion-title">[????????????]</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>??????-> ??? ?????? ????????? ??????(12?????? ????????? ???????????????.)->??????, ??????->??????!</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-2" aria-expanded="false"><span class="accordion-title">[??????] - ??????</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>???????????? ?????? 1~3???, 4~7??? ?????? ???????????????.<br>
                 ????????? ????????? ?????? ??? 1~2??? ?????? ???????????????.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-3" aria-expanded="false"><span class="accordion-title">[??????] - ????????? ??????</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>???????????? ?????? ???????????? ?????? ????????? ?????? ????????????.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-4" aria-expanded="false"><span class="accordion-title">[??????] - ?????? ??????</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>?????? ??? 1?????? ???????????? ????????? ???????????????.<br>
                1????????? ???????????? ????????? ????????? ?????????.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-5" aria-expanded="false"><span class="accordion-title">[??????] - ?????? ???????????????, ????????? ?????????.</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>???????????? ?????? ???????????? ?????? ????????? ?????? ????????????.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-6" aria-expanded="false"><span class="accordion-title">[??????] - ???????????????, ??????????????????.</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>?????? ????????? ????????? ????????? ????????? ??? ????????????.</p>
            </div>
          </div>
          <div class="accordion-item">
            <button id="accordion-button-7" aria-expanded="false"><span class="accordion-title">[????????????] - ???????????? ??????</span><span class="icon" aria-hidden="true"></span></button>
            <div class="accordion-content">
              <p>???????????? ???????????? ???????????? ????????? ???????????? ????????????.<br>
                ?????? ?????? ??? ???????????? ?????????????????? ?????? ??? ??? ????????? ????????? ????????????.</p>
            </div>
          </div>

        </div>      <!--accordion end-->
      </div>    <!--contaoner end-->
</div>
</div>
</body>
</html>