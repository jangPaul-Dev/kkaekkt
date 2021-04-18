$(document).ready(function () {
	/* button click event */
	/* 모달 생성 */
	$("#modal_show").click(function(){ $("#modal_container").show() })
    $("#modal_close").click(function(){ $("#modal_container").hide() })
	$("#nope").click(function () { $("#modal_container").hide() });
	$("#yes").click(function(){deleteUser();})
})

function deleteUser() {
	var userData ={
		id:$('#id').val(),
    	password:$('#pwd').val()
	}
	$.post({
		url:"/deletePs.do",
		data:userData,
		success: function(result){
			if(result=='success'){
				alert("!회원탈퇴!");
				location.href="/logout.do"
			}else {
				alert("실패. 다시 한 번 확인해주세요!");
				location.href="/jsp/mypageUser/Test_mybio.jsp"	
			}
		}
	})
}
