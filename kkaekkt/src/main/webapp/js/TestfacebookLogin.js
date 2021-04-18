$('#facebook').click(function(){
	

});


var cheekLoginStatus = function(response) {
		console.log(response);
		//statusChangeCallback(response);
		// 로그인 된 상태
		if (response.status === 'connected') {
			document.querySelector('#authBtn').value = 'Logout';
			FB.api('/me', function(response){
				document.querySelector('#name').innerHTML = response.name;
			});
		// 로그아웃 된 상태
		} else {
			document.querySelector('#authBtn').value = 'Login';
			document.querySelector('#name').innerHTML = '';
		}
	};

	window.fbAsyncInit = function() {
		FB.init({
			appId : '3544155285713106', // 페이스북 디벨로퍼 아이디
			cookie : true,
			xfbml : true,
			version : 'v10.0' // api 가장 최신 버전
		});

		FB.getLoginStatus(cheekLoginStatus);
	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));