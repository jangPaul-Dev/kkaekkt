const regPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const regMailCode = /^[0-9]{6}$/;

const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const email = document.getElementById("email");

let formatpw = 0;
let formatemail = 0;
let formatemailNum = 0;
let mailCode;

// 온로드
window.onload = function () {
  // pw
  pw.addEventListener("keyup", () => {
    if (!regPw.test(pw.value)) {
      if (pw.value.length == 0) {
        document.getElementById("pw_label").innerText = "";
      } else {
        document.getElementById("pw_label").innerText =
          "특수문자,문자,숫자 포함 8~16자리 이내로 입력하세요.";
      }
    } else {
      document.getElementById("pw_label").innerText = "";
    }
  });

  // re pw
  repw.addEventListener("keyup", () => {
    if (repw.value != pw.value) {
      document.getElementById("repw_label").innerText =
        "위 비밀번호와 일치하지 않습니다.";
    } else {
      formatpw = 1;
      document.getElementById("repw_label").innerText = "";
    }
  });
  //이메일 보안처리
  let emailVal;

  let str = document.getElementById("emailValue").innerHTML;
  let spl = str.split("@");

  let id = spl[0];
  let idR = id.substring(0, 3) + "*".repeat(id.length - 3);

  emailVal = idR + "@";

  let domain = spl[1];
  let domainR = domain.split(".");

  emailVal +=
    domainR[0].substring(0, 2) +
    "*".repeat(domainR[0].length - 2) +
    "." +
    "*".repeat(domainR[1].length);
  // console.log(emailVal);
  document.getElementById("emailValue").innerText = emailVal;
};
//타이머 전역변수 지정
function $ComTimer() {}
$ComTimer.prototype = {
  comSecond: "",
  timer: "",
  domId: "",
  fnTimer: function () {
    var min = Math.floor(this.comSecond / 60);
    var sec = this.comSecond % 60;
    this.domId.innerText = `${min}:${sec < 10 ? `0${sec}` : sec}`;
    this.comSecond--; // 1초씩 감소
    if (this.comSecond < 0) {
      // 시간이 종료 되었으면..
      clearInterval(this.timer); // 타이머 해제
      alert("인증 시간이 초과하였습니다. 다시 이메일 인증을 해 주세요.");
      $("#timeout").hide();
      $(".mail_check_input").attr("disabled", true);
      $("#mail_check").attr("disabled", true);
      $(".mail_check_input").attr("id", "mail_check_input_box_false");
      location.reload();
    }
  },
};
var AuthTimer = new $ComTimer();

// 이메일 확인
document.getElementById("btn_checkemail").onclick = function () {
  if (email.value != "") {
    // email 받아온 값이 없으면
    emailApi(); //ajax 실행
  } else {
    alert("앗! 오류가 발생했습니다. 처음부터 다시 시도해 주세요.");
    return false;
  }
};
// 인증번호 이메일 전송
function emailApi() {
  console.log("이메일인증 클릭");
  var email = $(".mail_input").val(); // 입력한 이메일

  $.ajax({
    type: "GET",
    url: "/mailCheck.do?email=" + email,
    success: function (data) {
      //console.log("data : " + data);
      $(".mail_check_input").attr("disabled", false);
      document.getElementById("mail_check").disabled = false;
      $(".mail_check_input").attr("id", "mail_check_input_box_true");
      alert(" 인증번호를 전송했습니다.");
      // 인증번호 전송 후 인증박스 show
      $("#mail_box").hide();
      $("#code_box").show();
      timerStart();
      code = data;
    },
  });
}

function timerStart() {
  AuthTimer.comSecond = 180;
  AuthTimer.timer = setInterval(function () {
    AuthTimer.fnTimer();
  }, 1000);
  AuthTimer.domId = document.getElementById("timeout");
}
function timeStop() {
  clearInterval(AuthTimer.timer);
}

/* 인증번호 비교 */
document.getElementById("mail_check").onclick = function () {
  checkemailNum();
};

// 인증코드 맞는지 확인 (인증하기 버튼 클릭시 실행)
function checkemailNum() {
  var inputCode = $(".mail_check_input").val(); // 입력코드
  if (regMailCode.test(inputCode)) {
    if (inputCode == code) {
      timeStop();
      formatemailNum = 1;

      $("#timeout").hide();
      $(".mail_check_input").val("");
      $("#mail_check").attr("disabled", true);
      $(".mail_check_input").attr("disabled", true);
      // $(".mail_check_input").attr("id", "mail_check_input_box_false");
      $("#btn_checkemail").attr("disabled", true);
      $(".mail_check_input").val("인증이 완료되었습니다.");
      alert("인증이 완료되었습니다.");
      $("#sendMail").hide();
      $("#verify").show();
    } else if ($("#timeout").text() != "0:00") {
      //시간이 남았는데 코드가 일치하지 않는다면
      formatemailNum = 0;
      alert("인증번호가 일치하지 않습니다.");
    }
  } else {
    //코드가 숫자 6자리가 아니라면
    formatemailNum = 0;
    alert(" 인증번호를 다시 확인해주세요.");
    $("#reqinput").attr("class", "incorrect");
  }
}

// 아이디 유무 확인
function pwSubmit() {
  if ($("#id").val() == "") {
    alert("아이디를 입력하세요.");
    id.focus();
    return false;
  } else {
    $.ajax({
      url: "/idchk.do",
      type: "POST",
      data: {
        id: $("#id").val(),
      },
      success: function (data) {
        if (data == 0) {
          alert("해당 정보로 가입된 내역이 없습니다.");
        } else if (data == 1) {
          $("#findPwForm").submit();
        }
      },

      error: function (request, status, error) {
        console.log(
          "code:" +
            request.status +
            "\n" +
            "message:" +
            request.responseText +
            "\n" +
            "error:" +
            error
        );
      },
    });
  }
}

function pwChgSubmit() {
  $("#pw_btn").on("click", function () {
    if ($("#pw").val() == "") {
      alert("새 비밀번호를 입력하세요.");
      $("#pw").focus();
      // return false;
    }
    if ($("#repw").val() == "" || formatpw != 1) {
      alert("새 비밀번호를 확인하세요.");
      $("#repw").focus();
      // return false;
    }
    if (formatemailNum != 1) {
      alert("앗! 오류가 발생했습니다. 처음부터 다시 시도해 주세요.");
      location.replace("/jsp/login/find.jsp");
      // return false;
    }
    // document.findPW.submit();
    $("#pwChgForm").submit();
    alert("비밀번호가 변경되었습니다. 다시 로그인해 주세요.");
    // location.replace("/jsp/login/loginPs.jsp");
  });
}
