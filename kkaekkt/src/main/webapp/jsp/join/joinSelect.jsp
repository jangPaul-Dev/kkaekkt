<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/css/join.css">

    </head>

    <body>
        <jsp:include page="/jsp/header.jsp"></jsp:include>

        <div class="body_container">
            <div>
                <div class="wrapper_joinInfo">
                    <!-- <h2>회원가입</h2> -->
                    <div class="join_seq">
                        <div class="join_numBox">
                            <ul>
                                <li class="num">01</li>
                                <li>약관동의</li>
                            </ul>
                        </div>
                        <div>
                            <i class="fas fa-chevron-right fa-3x"></i>
                        </div>
                        <div class="join_numBox numBox_select">
                            <ul>
                                <li class="num">02</li>
                                <li>회원유형선택</li>
                            </ul>
                        </div>
                        <div>
                            <i class="fas fa-chevron-right fa-3x"></i>
                        </div>
                        <div class="join_numBox">
                            <ul>
                                <li class="num">03</li>
                                <li>정보입력</li>
                            </ul>
                        </div>
                        <div>
                            <i class="fas fa-chevron-right fa-3x"></i>
                        </div>
                        <div class="join_numBox">
                            <ul>
                                <li class="num">04</li>
                                <li>가입완료</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="wrapper_select">
                    <hr>
                    <div class="join_text">
                        <h3>회원유형선택</h3>
                        <p>
                            회원 유형에 따라 가입 절차가 다르니 본인이 해당하는 유형을 선택해 주세요.
                        </p>
                    </div>
                    <div class="select">
                        <div class="user_btn" onclick="location.href='joinPerson.jsp'">
                            <ul>
                                <li>
                                    <i class=" far fa-user fa-5x"></i>
                                </li>
                                <li>
                                    <h3>일반회원</h3>
                                </li>
                                <li>만 14세 이상 개인회원</li>
                            </ul>

                        </div>
                        <div class="user_btn" onclick="location.href='joinCompany.jsp'">
                            <ul>
                                <li>
                                    <i class="far fa-building fa-5x"></i>
                                </li>
                                <li>
                                    <h3>사업자회원</h3>
                                </li>
                                <li>개인사업자, 법인사업자, 공공기관, 단체</li>
                                <li>사업자등록증 또는 고유등록증 필요</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- <footer>
                
                </footer> -->
            </div>


    </body>

    </html>