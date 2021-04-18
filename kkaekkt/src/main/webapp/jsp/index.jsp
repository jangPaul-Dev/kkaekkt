<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="/css/fullpage.min.css">
            <script src="/js/fullpage.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        </head>
		
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
            
            <script type="text/javascript">
                window.onload = function () {
                    document.getElementById("logoImg").src = "/img/logo-white.png"
                }
            </script>
            <link rel="stylesheet" href="/css/indexFullpage.css">
            <div id="full-page">
                <div class="section index0">
                    <!-- <div class="body_container"> -->
                    <video src="/img/girl.mp4" muted loop autoplay></video>
                    <!-- <h2>깨끗하게 간편하게 끝.</h2> -->
                    <div class="search">
                        <div class="search_btn">
                            <!-- <h1 class="animate__animated animate__fadeInUp">오늘은 <br> -->
                            <h1>오늘은 <br>
		                                어디서 <br>
		                                빨래를 할까요?
                            </h1>
                            <div class="search_tab">
                                <button class="tabBtn btn1" type="button" value='1'>일반세탁소</button>
                                <button class="tabBtn btn2" type="button" value='2'>코인세탁소</button>
                            </div>
                        </div>

                        <div class="search_box">
                            <input type="text" placeholder="동네 또는 세탁소 이름을 입력해주세요" name="search" id="searchBar">
                            <button onclick='showMap()'>
                                <i class="fas fa-search fa-lg "></i>
                                <!-- <i class="fas fa-search fa-2x"></i> -->
                            </button>
                        </div>
                    </div>
                    <!-- </div> -->
                </div>
                <!-- img page -->
                <div class="section index1">
                    <div class="text">
                        <h1>집에서 <br>
                            클릭 한 번으로</h1>
                    </div>
                </div>
                <div class="section index2">
                    <div class="text">
                        <h1>간편하게 <br>
                            쉽게</h1>
                    </div>
                </div>
                <div class="section index3">
                    <div class="text">
                        <h1> <span>깨</span>끗하게 <br>
                            <span>끝</span>
                        </h1>
                    </div>
                </div>
                <div class="section index4">
                    <div class="text">
                        <h1>빨래를 빼고 <br>
                            여유를 더한 삶, <br>
                        </h1>
                        <h1>
                            <img src="/img/logo-no-white.png" style="width:350px; margin-left: 10px;">
                            과 함께 <br>
                            일상을 바꾸다.
                        </h1>
                    </div>
                    <footer>
                        <div>
                            <p>고객센터</p>
                            전화 : 02-1234-5678 (평일 10:00 ~ 18:30 토·일요일, 공휴일 휴무) <br>
                            문의 : info@kkækkt.com <br>

                        </div>
                        <div>
                            <p>kkækkt 깨끝</p>
                            대표: 깨끝 | 주소: 서울특별시 마포구 백범로 23 구프라자 3층 <br>
                            사업자등록번호: 012-34-56789 | 통신판매업신고: 제2021-서울 신촌-0001호 <br>
                            Copyright © 2021 All right Reserved.
                        </div>
                        <div>
                            <ul>
                                <li><a href="#">이용약관</a></li>
                                <li><a href="/jsp/faq.jsp">자주묻는 질문</a></li>
                                <li><a href="mailto:kkaekkt@naver.com">제휴문의</a></li>
                                <li><a href="#">About kkaekkt</a></li>
                            </ul>
                        </div>
                    </footer>
                </div>
                <!-- <div class="section index6">
            <h1>kkaekkt과 함께 <br> 일상을 바꾸다.</h1>

        </div> -->

            </div>
            <script>
                new fullpage('#full-page', {
                    licenseKey: '',
                    navigation: true,
                    // navigationTooltips:[]
                    scrollingSpeed: 1000,
                    onLeave: function (orgin, destination, direction) {
                        if (origin.index == 1) {
                        }
                    },
                    onLeave: function (orgin, destination, direction) {
                        if (destination.index == 0) {
                            $("video").get(0).play();
                        }

                    },
                });

            </script>
            <script src="/js/index.js"></script>
        </body>

        </html>