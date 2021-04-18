$(document).ready(function() {
		
		$("#modal_show").click(function() {
			$('#mask').show()
			$("#modal_container").show()
		})
		$("#modal_close").click(function() {
			$("#modal_container").hide()
			$('#mask').hide()
		})
	})



$(document).ready(function() {
  $('#login').click(function(){ 
    login()
  })
})

function login() {
  var userData={
    id:$('#id').val(),
    password:$('#password').val()
  }
  $.post({
    url:"/login.do",
    data:userData,
    success:function(result) {
    console.log("로그인js" + result)
      if(result=='fail'){
        alert('id 혹은 password가 일치하지 않습니다.');
        
      }else if(result == 1){
        location.href="/index.do";
        
      }else if(result == 2){
        location.href='/jsp/mypageBiz/mpbProg_Num.jsp';
      }
    }
  })
}