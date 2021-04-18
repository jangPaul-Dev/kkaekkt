
window.Kakao.init("cf4c8601d1ea3d2f4f0704d04de2729c");

function kakaoLogin() {
    window.Kakao.Auth.login({
        scope: 'profile, account_email, birthday',
        success: function (authObj) {
            console.log(authObj);
            window.Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const kakao = res.kakao_account;

                    var userEmail = kakao.email;
                    console.log(userEmail);


                    var userdata = {
                        email: userEmail
                    }

                    $.ajax({
                        url: '/loginSNS.do',
                        type: 'POST',
                        data: {
                            email: userEmail,
                        },
                        success: function (result) {
                            if (result == "fail") {
                                alert("회원정보 없음");
                                Kakao.API.request({
                                    url: '/v1/user/unlink',
                                    success: function (response) {
                                        console.log(response);
                                    },
                                    fail: function (error) {
                                        console.log(error);
                                    },
                                });
                            } else {
        						location.href="/index.do";
                                Kakao.API.request({
                                    url: '/v1/user/unlink',
                                    success: function (response) {
                                        console.log(response);
                                    },
                                    fail: function (error) {
                                        console.log(error);
                                    },
                                });
                            }
                            

                        }
                    }); // ajax

                }

            });
        }

    });
}


function kakaoLogout() {
    Kakao.init();
    Kakao.isInitialized();

    if (!Kakao.Auth.getAccessToken()) {
        console.log('Not logged in.');
        return;
    }
    Kakao.Auth.logout(function () {
        console.log(Kakao.Auth.getAccessToken());
    });
}

function LogOut() {
    var today = new Date();
    today.setTime(today.getTime() - 1000);
    document.cookie = 'MBLEVEL=; path=/;expires=' + today.toGMTString();
    document.cookie = 'MBNO=; path=/;expires=' + today.toGMTString();
    document.cookie = 'MBEMAIL=; path=/;expires=' + today.toGMTString();
    document.cookie = 'MBBOARDADMIN=; path=/;expires=' + today.toGMTString();
    document.cookie = 'BOARD_VOTE_NUM=; path=/;expires=' + today.toGMTString();
    document.cookie = 'SkinDirPath=; path=/;expires=' + today.toGMTString();
}

