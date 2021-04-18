<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="/css/find.css">
        <link rel="stylesheet" href="/css/findId.css">
        <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <jsp:include page="/jsp/header.jsp"></jsp:include>

        <div class="body_container">
            <div class="wrapper_find">
                <nav class="find_nav">
                    <div onclick="location.href='/jsp/login/findId.jsp'">아이디 찾기</div>
                    <div class="unselect" onclick="location.href='/jsp/login/findPw.jsp'">비밀번호 찾기</div>
                </nav>

                <div id="findID">
                    <p>아이디 찾기가 완료되었습니다.</p>

                    <!-- 아이디 -->
                    <div class="veri_box id_box" onclick="" style="text-align: center;">
                        ID <span id="idValue">${userId.id}</span>
                        <div>
                            <button type="button" onclick="location.href='/jsp/login/findPw.jsp'">비밀번호 찾기</button>
                            <button type="button" onclick="location.href='/jsp/login/login.jsp'">로그인</button>
                        </div>
                    </div>

                    <div class="mail">
                        아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                    </div>
                </div>

            </div>
        </div>
        <script src="/js/findId.js"></script>
    </body>

    </html>