$(document).ready(function () {
    $(".side_sub").hide();
    initEvent();
    ajax(pageObj);
    initSide();
  

});
function initEvent() {
    // 수정하기 버튼 클릭시 인풋,셀렉박스 비활성화 활성화
    var clickupdate = $("#updateSpec");
    var changebtn = $("#btn_change");
    var resetbtn = $("#resetSpec");
    var chkBox=$(".coinLaundry input[type='checkbox']");
    var priceBox=$(".coinLaundry input[id='won']");
    var selectBox = $(".equip select");

    // 디폴트
    changebtn.hide();
    $("input").attr("disabled", true);
    $("#week button").attr("disabled", true);
    $("select").attr("disabled", true);

    // 체크박스 선택시 해당 품목 가격인풋창 활성화
    chkBox.click(function(){
        for(var i=0; i<chkBox.size();i++) {
        if(chkBox[i].checked){
            priceBox.eq(i).attr("disabled", false);
            if(i<3){
                selectBox.eq(i).attr("disabled", false);
            }
        } else if(!chkBox[i].checked){
            priceBox.eq(i).attr("disabled", true);
            priceBox.eq(i).val("");
            if(i<3){
                selectBox.eq(i).attr("disabled", true);
                selectBox.eq(i).val("");
            }
        }
    }
        });
    //숫자만
    priceBox.keyup(function (event) {
        if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi, ""));
        }
    });
    // 수정하기 버튼 클릭시 
    clickupdate.click(function () {
        clickupdate.hide();
        changebtn.show();
        // 체크된 품목의 인풋창만 활성화
        for(var i=0; i<chkBox.size();i++) {
            if(chkBox[i].checked) {
                selectBox.eq(i).attr("disabled", false);
                priceBox.eq(i).attr("disabled", false);
            }else {
                selectBox.eq(i).attr("disabled", true);
                priceBox.eq(i).attr("disabled", true);
            }
        }
        chkBox.attr("disabled", false);
        $("#dry select").attr("disabled", false);
        $("#week button").attr("disabled", false);
        $("#weekBox select").attr("disabled", false);
    });
    // 돌아가기 버튼 클릭시
    resetbtn.click(function () {
        clickupdate.show();
        changebtn.hide();

        // 영업시간 변동사항 삭제후 다시 ajax실행
        $("#week button").removeClass('selected');
        $("#weekBox ul li").remove();
        ajax(pageObj);

        $("input").attr("disabled", true);
        $("select").attr("disabled", true);
        $("#week button").attr("disabled", true);

    });
    // 수정완료 버튼 클릭시
    $("#submitSpec").click(function () {
        
       
        var list = new Array();

        chkBox = $(".coinLaundry input[type='checkbox'][name='equip']");
        priceBox = $(".coinLaundry .equip input[id='won']");
        // 설비 리스트 데이터 처리
        console.log(chkBox.eq(0));
        for (var i = 0; i < chkBox.size(); i++) {
            if (chkBox[i].checked) {
                if(priceBox[i].value == "" ||selectBox[i].value == ""){
                    alert("체크항목을 확인해주세요");
                    return false;
                }
                console.log(selectBox[i].value);
                list.push({ eno: JSON.parse(chkBox[i].value), cnt: JSON.parse(selectBox[i].value), price: JSON.parse(priceBox[i].value) });
            } else {
                list.push({ eno: JSON.parse(chkBox[i].value), cnt:0, price:0 });
            }
        }
        console.log(list);
        $("input[name='equipment']")[0].value = JSON.stringify(list);
        console.log($("input[name='equipment']")[0].value);

        // 부가서비스 데이터 처리
        chkBox = $(".coinLaundry #etc input[type='checkbox'][id='etc']");
        priceBox = $(".coinLaundry #etc input[id='won']");
        list = [];//리스트 초기화
        for (var i = 0; i < chkBox.size(); i++) {
            if (chkBox[i].checked) {
                if(priceBox[i].value == "" ){
                    alert("체크항목을 확인해주세요");
                    return false;
                }
                list.push({ etcno: i + 1, price: JSON.parse(priceBox[i].value) });
            } else {
                list.push({ etcno: i + 1, price: 0 });
            }
        }
        console.log(list);
        $("input[name='etc']")[0].value = JSON.stringify(list);
        console.log($("input[name='etc']")[0].value);

        // 운영시간 데이터 처리
        var weekLi = $('#weekBox ul li');
        list = [];//위에서 쓰인 리스트 초기화
        for (var i = 0; i < weekLi.size(); i++) {
            var open = weekLi[i].children[1].value;
            var close = weekLi[i].children[2].value;
            if ($('#week button').eq(i).hasClass("selected")) {
                if(open == "00:00" && close == "00:00"){
                    alert("운영시간을 확인해주세요");
                    return false;
                }
                list.push({ schno: JSON.parse(weekLi.eq(i).css("order")), time: open + '~' + close });
            } else {
                list.push({ schno: JSON.parse(weekLi.eq(i).css("order")), time: "00:00~00:00" });
            }
        }
        console.log(list);
        $("#weekBox input[name='schedule']")[0].value = JSON.stringify(list);

        // form submit 
        $("input").attr("disabled", false);
        $("select").attr("disabled", false);
        $("form").submit();
    });

    // 영업시간 
    var weekBtn = $('#week button');
    var weekLi = $('#weekBox ul');
    weekBtn.click(function () {
        var idx = $(this).index();
        console.log($(this));
        $(this).toggleClass('selected');
        if ($(this).hasClass("selected")) {
            $("#weekBox ul li[id='weekli_"+ (idx+1) +"']").show();
        } else {
            $("#weekBox ul li[id='weekli_"+ (idx+1) +"']").hide();
        }
    });

};

function ajax(pageObj) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url: "/selectCoinspec.do",
        data: pageObj,
        success: function (data) {
            console.log('ajax 함수 완료');
            var coinspec = JSON.parse(data);
            $("input[name='bno']").val(coinspec.bno);
            // 설비 일치하면 값 넣어주기
            $.each(coinspec.equipmentList, function (index, item) {
                console.log(index + ":" + item.eno + "," + item.price);
                var checkli = $("input[type='checkbox'][name='equip']");
                for (var i = 0; i < checkli.length; i++) {
                    if (item.eno == checkli[i].value) {
                        if(item.price !=0){
                        $(".equip input[id='won']").eq(item.eno - 1).val(item.price);
                        $(".equip select").eq(item.eno - 1).val(item.cnt).prop("selected", true);
                        checkli.eq(i).prop("checked", true);
                        }
                    }
                }
            }); // 설비리스트 반복문

            // 부가서비스 일치하면 값 넣어주기
            $.each(coinspec.etcList, function (index, item) {
                console.log(index + ":" + item.etcno + "," + item.price);
                var checkli = $("input[type='checkbox'][id='etc']");
                for (var i = 0; i < checkli.length; i++) {
                    if (item.etcno == checkli[i].value) {
                        if(item.price !=0){
                            checkli.eq(i).prop("checked", true);
                            $("#etc input[id='won']").eq(item.etcno - 1).val(item.price);
                        }
                    }
                }
            }); // 부가서비스 반복문

            // 운영시간 값 넣어주기
            $.each(coinspec.scheduleList, function (index, item) {
                var weekBtn = $('#week button');
                var weekLi = $('#weekBox ul');
                console.log(index + ":" + item.schno + "," + item.time);
                var start = (item.time).split("~")[0];
                var end = (item.time).split("~")[1];
                var idx = item.schno;
                if (start != "00:00" && end != "00:00") {
                    $('#week_' + idx).toggleClass('selected');
                }

                if (idx <= 7) {
                    weekLi.append("<li id=weekli_" + idx + " style='order:"
                        + (idx)
                        + "'><span>"
                        + $('#week_' + idx).html()
                        + "요일</span>시간 <select disabled><option>" + start + "</option></select> ~ <select disabled><option>" + end + "</option></select></li>").trigger("create");
                } else {
                    weekLi.append("<li id=weekli_" + idx + " style='order:"
                        + (idx)
                        + "'><span>"
                        + $('#week_' + idx).html()
                        + "</span>시간 <select disabled><option>" + start + "</option></select> ~ <select disabled><option>" + end + "</option></select></li>").trigger("create");
                }
                var opt = $("#weekBox li[style='order:"
                    + (idx) + "'] select");
                for (var i = 0; i < 25; i++) {
                    opt.append("<option>" + (i < 10 ? "0" + i : i) + ":00</option>");
                    if (i != 24) {
                        opt.append("<option>" + (i < 10 ? "0" + i : i) + ":30</option>");
                    }
                }
                if (!($('#week_' + idx).hasClass("selected"))) {
                    $("#weekBox ul li[id='weekli_"+ (idx) +"']").hide();
                }

            }); // 운영시간 반복문

        }
    }); // ajax
}



function initSide() {
    $('.side button').eq(0).addClass("side_select");
}
