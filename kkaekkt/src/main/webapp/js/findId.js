window.onload = function () {
  let str = document.getElementById("idValue").innerHTML;
  // console.log(str);
  let idVal = str.substring(0, 3);
  // console.log(idVal);
  let idRp = "*".repeat(str.length - 3);
  // console.log(idRp);
  document.getElementById("idValue").innerText = idVal + idRp;
};

function idSubmit() {
  const name = document.getElementById("name");
  const email = document.getElementById("email");

  if (name.value == "" || email.value == "") {
    alert("이름과 이메일을 모두 입력하세요.");
    name.focus();
  } else {
    $("#findIdForm").submit();
  }
}
