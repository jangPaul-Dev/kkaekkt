function naverLogin() {

	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "kEvFCZyOPXmysr20FrkK",
			callbackUrl: "http://localhost:8080/jsp/login/callback.jsp",
			isPopup: true, /* 팝업을 통한 연동처리 여부, true 면 팝업 */
			//loginButton: { color: "green", type: 3, height: 47 } /* 로그인 버튼의 타입을 지정 */
		}
	);

	naverLogin.init();
}