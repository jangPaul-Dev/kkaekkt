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
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    </head>

    <body>
        <jsp:include page="/jsp/header.jsp"></jsp:include>

        <div class="body_container">
            <div class="wrapper_find">
                <nav class="find_nav">
                    <div onclick="location.href='/jsp/login/findId.jsp'">아이디 찾기</div>
                    <div class="unselect" onclick="location.href='/jsp/login/findPw.jsp'">비밀번호 찾기</div>
                </nav>

                <form action="/findId.do" method="POST" name="findID" id="findIdForm">
                    <div id="findID">
                        <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>
                        <div class="veri_box">
                            <input id="name" type="text" name="name" placeholder="이름을 입력하세요."> <br>
                            <input id="email" type="email" name="email" placeholder="가입 시 등록한 이메일을 입력하세요."> <br>
                            <button type="button" onclick="idSubmit();">다음</button>
                        </div>

                        <div class="mail">
                            아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <script src="/js/findId.js"></script>
    </body>

    </html>