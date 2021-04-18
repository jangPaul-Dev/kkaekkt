$(document).ready(function() {
		
		$("#modal_show").click(function() {
			$("#modal_container").show()
		})
		$("#modal_close").click(function() {
			$("#modal_container").hide()
		})
	})



$(document).ready(function() {
  $('#login').click(function(){ 
    login();
  });
});
function login() {
  var userData={
    id:$('#id').val(),
    password:$('#password').val()
  }
  $.post({
    url:"/login.do",
    data:userData,
    success:function(result) {
      if(result=='fail'){
        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
        
      }else if(result == 1){
        location.href="/index.do";
        
      }else if(result == 2){
        location.href='/jsp/mypageBiz/mpbProg_Num.jsp';
      }
    }
  })
}