let code = "";                //이메일전송 인증번호 저장위한 코드

let fomatpw = 0;
let formatnewpw = 0;            // 비밀번호 변경 시 사용
let formatphone1 = 1;
let formatphone2 = 1;
let formatphone3 = 1;
let formatemail = 1;
let formatemailNum = 1;
let formatAccNum = 1; 

const regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regPhone = /^[0-9]+$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
const regAccount=/^[0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-]{3,6}(\-[0-9]{1,3})?$/;
const regMailCode =/^[0-9]{6}$/;

const content = document.getElementsByClassName("content")[0];
const bizMemberInfo = document.getElementsByClassName("bizMemberInfo")[0];
let inputli = content.getElementsByTagName('input');
let buttonli = bizMemberInfo.getElementsByTagName('button');
let selectli = content.getElementsByTagName('select');

//타이머 전역변수 지정
function $ComTimer() {}
$ComTimer.prototype = {
    comSecond : ""
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var min = Math.floor(this.comSecond/60);
        var sec = this.comSecond%60;
        this.domId.innerText = `${min}:${sec<10?`0${sec}`:sec}`;
        this.comSecond--;					// 1초씩 감소
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
            $('#timeout').hide();
            $(".mail_check_input").attr("disabled",true);
            $("#mail_check").attr("disabled",true);
            $(".mail_check_input").attr("id", "mail_check_input_box_false");
        }
    }
}
var AuthTimer = new $ComTimer();

window.onload = function () {
    initSide();
    defaultDisable();
    inputInfo();

   

    //수정하기 버튼 클릭시 수정완료 돌아가기 버튼 활성화, 인풋창 활성화
    document.getElementById("updateBio").onclick = function btnChange() {

        //수정완료 돌아가기 버튼 활성화,
        document.getElementById("updateBio").style.display = "none";
        document.getElementById("btn_change").style.display = "block";
        //인풋창 활성화
        for (let i = 0; i < inputli.length; i++) {
            if (i != 3 && i != 4 && i != 10 && i != 11 && i != 12 && i != 14 ) {     
                // 새 비밀번호 제외, 이메일인증번호제외, 주소 상세주소 제외
                inputli[i].disabled = false;
            }
        }
        for (let i = 0; i < selectli.length; i++) {
            selectli[i].disabled = false;
        }
        // 변경하기, 이메일인증확인 제외
        for (let i = 0; i < buttonli.length; i++) {
            if (i != 1 && i!=3) {
                buttonli[i].disabled = false;
            }
        }

    }

    //돌아가기버튼 클릭시 수정하기 버튼 활성화, 인풋창 비활성화
    document.getElementById("resetBio").onclick = function btnChange() {

        document.getElementById("btn_change").style.display = "none";
        document.getElementById("updateBio").style.display = "block";

        inputInfo();
        defaultDisable();
        // 유효성 안내 문구 지우기
        let labelli = document.getElementsByTagName("label");
        for(let i=0; i< labelli.length; i++){
            labelli[i].innerText="";
        }
        timeStop();
        $('#timeout').hide();
        $(".mail_check_input").val("");
        $(".mail_check_input").attr("id", "mail_check_input_box_false");
    }

    // 비밀번호 입력 후 수정버튼(비밀번호 변경시) 새 비밀번호, 확인버튼 활성화
    document.getElementById("btn_checkpwd").onclick = function checkPwd() {
        // 로그인된 회원의 비밀번호와 일치하는지 확인
        let curpwd = document.getElementById("curpwd");

        // 일치
        if (curpwd.value == pageObj["password"]) {
            formatpw = 1;
            document.getElementById("checkpwd").innerText = " 아래 새 비밀번호를 입력하세요";
            document.getElementById("checkpwd").style.color = "rgb(116, 116, 116)";

            // 기존 비밀번호창 비활성화
            curpwd.value = null;
            document.getElementById("curpwd").disabled = true;

            // 새비밀번호 인풋창 활성화
            document.getElementById("pwd").disabled = false;
            document.getElementById("newpwd").disabled = false;

            // 변경하기 버튼 활성화
            document.getElementById("btn_checkpwd").disabled = true;
            document.getElementById("btn_updatepwd").disabled = false;

        } else {
            formatpw = 0;
            document.getElementById("checkpwd").innerText = " 입력하신 비밀번호가 일치하지 않습니다.";
        }
    }

    // 새 비밀번호 유효성 검사
    document.getElementById("pwd").addEventListener('keyup', () => {
        let inputNpwd = document.getElementById("pwd");
        if (!regPw.test(inputNpwd.value)) {
            if (inputNpwd.value.length == 0) {
                document.getElementById("checkval").innerText = "";
            } else {
                document.getElementById("checkval").innerText
                = " 비밀번호 양식과 맞지 않습니다. (특수문자,문자,숫자 포함 8~15자리이내)";
            }
            formatnewpw = 0;
        } else {
            formatnewpw = 1;
            document.getElementById("checkval").innerText
                = "";

        }
    })
    // 새 비밀번호, 새 비밀번호 확인 인풋 값 같은지 비교 => 비밀법호 업데이트 
    $("#btn_updatepwd").click(function undatePwd() {
        if ($('#pwd').val() == $('#newpwd').val() && formatnewpw == 1) {
            console.log($('#pwd').val + $('#newpwd') + formatnewpw);
            $.ajax({
                url: '/updateBspwd.do',
                type: 'post',
                data: {
                    mno: pageObj["mno"],
                    id: pageObj["id"],
                    password: $('#newpwd').val()
                }, success: function(data){
                    let password = JSON.parse(data);
                    console.log("ajax성공 "+password);
                    pageObj["password"] = password;
                    
                }, error: function() {
                   alert("비밀번호 변경에 예상치 못한 오류가 생겼습니다. 다시 시도해주세요");
                }   
    
            });
            
            // 비밀번호 변경관련 비활성화
            $("#pwd").val("");
            $("#pwd").attr("disabled", true);
            $("#newpwd").val("");
            $("#newpwd").attr("disabled", true);

            $("#btn_updatepwd").attr("disabled", true);

            $("#curpwd").attr("disabled", false);
            $("#btn_checkpwd").attr("disabled", false);

            document.getElementById("checkpwd").innerText
                = "";
            document.getElementById("match").innerText
                = " 변경이 완료되었습니다, 이후 프로필 수정시, 변경된 비밀번호로 입력해주세요.";
            document.getElementById("match").style.color = "rgba(254, 54, 54, 0.55)";

        }
        else {
            console.log("if문탈출" + $('#pwd').val() + $('#newpwd').val() + formatnewpw);
            
            if (formatnewpw == 0) {
                document.getElementById("match").innerText = "입력형식을 확인하세요";
                $("#pwd").val("");
                $("#newpwd").val("");
            } else if ($('#pwd').val() != $('#newpwd').val()) {
                document.getElementById("match").innerText = " 새 비밀번호와 일치하지 않습니다.";
                $("#newpwd").val("");
            }
        }

    });
    // 계좌번호 입력형식 확인
    document.getElementById("bankAccNum").addEventListener('keyup', () => {
        formatAccNum = 0;
        let inputAcc = document.getElementById("bankAccNum");
       if (!regAccount.test(inputAcc.value)) {
            if (inputAcc.value.length == 0) {
                document.getElementById("checkAcc").innerText
                    = "";
            } else {
                document.getElementById("checkAcc").innerText
                    = " 양식과 맞지 않습니다. >> 하이픈(-)을 포함하여 입력해주세요";
            }
        } else {
            formatAccNum = 1;
            document.getElementById("checkAcc").innerText
                = "";

        }
    });
    // 연락처 입력형식 확인
    $("#phone1").keyup(function (event) {
        formatphone1 = 0;
        let inputphone = document.getElementById("phone1");
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ""));
        } else {
            if (!regPhone.test(inputphone.value)) {
                formatphone1 = 0;
            } else {
                formatphone1 = 1;
            }
        }
    })
    $("#phone2").keyup(function (event) {
        formatphone2 = 0;
        let inputphone = document.getElementById("phone2");
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ""));
        } else {
            if (!regPhone.test(inputphone.value)) {
                formatphone2 = 0;
            } else {
                formatphone2 = 1;
            }
        }
    })
    $("#phone3").keyup(function (event) {
        formatphone3 = 0;
        let inputphone = document.getElementById("phone3");
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ""));
        } else {
            if (!regPhone.test(inputphone.value)) {
                formatphone3 = 0;
            } else {
                formatphone3 = 1;
            }
        }
    })

    // 이메일 입력형식 확인
    document.getElementById("email").addEventListener('keyup', () => {
        formatemail = 0;
        formatemailNum = 0;
        let inputemail = document.getElementById("email");
       if (!regEmail.test(inputemail.value)) {
            if (inputemail.value.length == 0) {
                document.getElementById("checkemail").innerText
                    = "";
            } else {
                document.getElementById("checkemail").innerText
                    = " 양식과 맞지 않습니다.";
            }
        } else {
            formatemail = 1;
            document.getElementById("checkemail").innerText
                = "";

        }
    })
    document.getElementById("btn_checkemail").onclick = function(){
        console.log(formatemail);
        if(formatemail == 1){
            //emailApi();
            if(document.getElementById("email").value != pageObj["email"]){
                emailDuplChk();
            } else{
                alert("기존이메일과 동일합니다.");
            }
        } else {
            alert("양식과 맞지 않습니다.")
        }
    };
    /* 인증번호 비교 */
    document.getElementById("mail_check").onclick = function(){
        checkemailNum();
    };
    document.getElementById("submitBio").onclick = function(){
        submitCombio();
    };



}   // end onload


function initSide() {
    $('.side button').eq(6).addClass("side_select");
}
// 디폴트
function defaultDisable(){
    for (let i = 0; i < inputli.length; i++) {
        inputli[i].disabled = true;
    }
    for (let i = 0; i < buttonli.length; i++) {
        buttonli[i].disabled = true;
    }
    for (let i = 0; i < selectli.length; i++) {
        selectli[i].disabled = true;
    }
    document.getElementById("btn_change").style.display = "none";
}
function inputInfo(){
    document.getElementsByName('bno')[0].innerHTML = pageObj["bno"];
    document.getElementById('mno').value = pageObj["mno"];
    document.getElementById('bname').innerHTML = pageObj["bname"];
    document.getElementById('likeNum').innerHTML = pageObj["likedNum"];
    document.getElementById('avglike').innerHTML = pageObj["eval"];
    let star = pageObj["eval"].split('.');
    console.log(star[0]);
    let addstar = "";
    for(let i = 0; i<star[0]; i++){
        addstar += '<i class="fas fa-star"></i>';
    }
    document.getElementById('starIcon').innerHTML = addstar;
    document.getElementById('bizname').innerHTML = pageObj["bname"];
    document.getElementById('bankNum').options[pageObj["bankNum"]].selected =true;
    document.getElementById('bankAccNum').value = pageObj["bankAccNum"];
    document.getElementsByName('id')[0].value = pageObj["id"];
    var phoneSplit = pageObj["phone"].split('-');
    document.getElementById('phone1').value = phoneSplit[0];
    document.getElementById('phone2').value = phoneSplit[1];
    document.getElementById('phone3').value = phoneSplit[2];
    document.getElementById('email').value = pageObj["email"];
    var addressSplit = pageObj["address"].split(',');
    document.getElementById('postcode').value = addressSplit[0];
    document.getElementById('roadAddress').value = addressSplit[1];
    document.getElementById('detailAddress').value = addressSplit[2];
    document.getElementById('extraAddress').value = addressSplit[3];
}

function emailDuplChk() {
    var email = $(".mail_input").val(); // 입력한 이메일
  
    $.ajax({
      url: "/findemail.do",
      type: "POST",
      data: {
        email: $("#email").val(),
      },
      success: function (data) {
        console.log(data);
        var key = JSON.parse(data);
        if (key.emailchk != 0) {
          alert("해당 이메일로 가입된 아이디가 존재합니다.");
          return false;
        } else if (key.emailchk == 0) {
          emailApi();
        } 
      }
    });
  }

function emailApi(){
     /* 인증번호 이메일 전송 */
     
        console.log("이메일인증 클릭");
        var email = $(".mail_input").val();        // 입력한 이메일
        
        $.ajax({
            
            type:"GET",
            url:"/mailCheck.do?email=" + email,
            success:function(data){
                //console.log("data : " + data);
                $(".mail_check_input").attr("disabled",false);
                document.getElementById("mail_check").disabled = false;
                $(".mail_check_input").attr("id", "mail_check_input_box_true");
                alert(" 인증번호를 전송했습니다.");
                timerStart();
                code = data;
            }
                    
        });
        
}    
    
function checkemailNum(){
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    if(regMailCode.test(inputCode)){
        if(inputCode == code){
            timeStop();
            formatemailNum = 1;
            alert('메일 인증이 완료되었습니다.');
            $('#timeout').hide();
            $("#mail_check").attr("disabled",true);
            $(".mail_check_input").val("인증이 완료되었습니다.");
            $(".mail_check_input").attr("disabled",true);
            $(".mail_check_input").attr("id", "mail_check_input_box_false");
            doncument.getElementById("btn_checkemail").disabled = true;
            $("#checkemail").val("인증되었습니다.");
       
        } else if($('#timeout').text() != "0:00"){//시간이 남았는데 코드가 일치하지 않는다면
            formatemailNum = 0;
            alert('인증번호가 일치하지 않습니다.');
        }
    } else {//코드가 숫자 6자리가 아니라면
        formatemailNum = 0;
        alert(" 인증번호를 다시 확인해주세요.");
        $("#reqinput").attr("class", "incorrect");   
    }
    

}
function timerStart() {
    AuthTimer.comSecond = 180;
    AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
    AuthTimer.domId = document.getElementById("timeout");
}
function timeStop() {
    clearInterval(AuthTimer.timer);
}
  
// 핸드폰 번호 입력값 합치기 
// 주소 도로명+상세주소 값 합치기
// 전체 폼 보낼때 null값 + 유효성 검사 통과 확인 후 submit
function submitCombio() {
    var phone = document.getElementById("phone1").value + "-" +
        document.getElementById("phone2").value + "-" +
        document.getElementById("phone3").value;


    document.getElementById("phone").value = phone;

    var address = document.getElementById("postcode").value + ","
        + document.getElementById("roadAddress").value + ","
        + document.getElementById("detailAddress").value + ","
        + document.getElementById("extraAddress").value;
    console.log(address);
    document.getElementById("address").value = address;

    if ($("#curpwd").val() == "" || pageObj["password"] != $("#curpwd").val()) {
        alert("비밀번호를 확인하세요.")
        $("#curpwd").focus();
        return false;
    }
    if ($("#phone1").val() == "" || $("#phone2").val() == "" || $("#phone3").val() == ""
        || formatphone1 != 1 || formatphone2 != 1 || formatphone3 != 1 ) {
        alert("연락처를 확인하세요.");
        return false;
    }
    if ($("#bankAccNum").val() == "" ||  formatAccNum != 1) {
        alert("계좌번호를 확인하세요.");
        return false;
    }
    if ($("input[name='email']").val() == "" || formatemail != 1 || formatemailNum !=1) {
        alert("이메일을 확인하세요.");
        $("input[name='email']").focus();
        console.log(formatemail);
        return false;
    }
    $("input").attr("disabled", false);
    $("form").submit();
}
