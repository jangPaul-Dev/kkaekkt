// $(document).ready(function () {
$("#allChk").click(function () {
  if ($(this).prop("checked")) {
    $('input[type="checkbox"]').prop("checked", true);
  } else {
    $('input[type="checkbox"]').prop("checked", false);
  }
  $("#warnBox").hide();
});

$("#ok").click(function () {
  if (allTermsChk()) {
    location.href = "/jsp/join/joinSelect.jsp";
  } else {
    return false;
  }
});
$("#cancel").click(function () {
  history.back();
});

// });
function allTermsChk() {
  for (var i = 1; i < 4; i++) {
    if (!$('input[type="checkbox"]').eq(i).is(":checked")) {
      $("#warnBox").show();
      // $("body").scrollTop($(document).height());
      // $('input[type="checkbox"]').eq(i).focus();
      return false;
    }
  }
  return true;
}
