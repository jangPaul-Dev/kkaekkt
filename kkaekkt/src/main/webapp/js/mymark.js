//결제 API 전역변수
IMP.init("imp27421713");

$(document).ready(function() {
    initBodyEvent();
    initSide();
    printList();
});
function modalAjax(bno) { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getLaundryList.do",
        data:{bno:bno},
        success: function(data) {
            var list=JSON.parse(data);
            modalprint(list);
            openModal();
            console.log('ajax 완료');
        }
    });
}
function modalprint(list) {
    var period;
    var table=$('#single_option');
    table.children().remove();//초기화
    $.each(list,function(idx,value) {
        
        if(value.price!=0){//미취급 품목이 아니라면 진입
            if($('#firstHead')[0]==undefined){//첫 번째 헤드가 없다면
                if(value.lno<5){ //1~4번 품목이라면
                    period='1~3일 소요';
                }else {
                    period='4~7일 소요'
                }
                table.append(
                    '<tr id="firstHead">'+
                        '<th>'+period+'</th>'+
                        '<th>수 량</th>'+
                        '<th>금 액</th>'+
                    '</tr>'
                );
            }else if($('#firstHead th')[0].innerHTML=='1~3일 소요'&&value.lno>4){//첫 번째 헤드와 마감기한이 일치하지 않은 품목이라면
                if($('#secondHead')[0]==undefined){//두 번째 헤드가 없다면
                    period='4~7일 소요';
                    table.append(
                    '<tr id="secondHead">'+
                        '<th>'+period+'</th>'+
                        '<th>수 량</th>'+
                        '<th>금 액</th>'+
                    '</tr>'
                    );
                }
            }
            table.append(
            '<tr>'+
                '<td><input class="chkBox" id="chk'+value.lno+'" type="checkbox" value="'+value.lno+'">'+value.laundry+'</td>'+
                '<td>'+
                    '<select id="selc'+value.lno+'" class="resOpc" disabled>'+
                    '</select>'+
                '</td>'+
                '<td>'+
                    '<p class="res_price" id="price'+value.lno+'" value="'+value.price+'">'+value.price+'</p>'+
                '</td>'+
            '</tr>'
           );
        }
        if(list.length==idx+1){//마지막이라면 총 금액 행 삽입,
            table.append(
            '<tr id="totalRow">'+
                '<td id="totalLabel">결제예상금액</td>'+
                '<td colspan="2" class="totalAll"></td>'+
            '</tr>'
            );
        }
    });
    for(var i=1;i<11;i++){ //셀렉트 옵션 삽입
        $('.resOpc').append(
            '<option value='+i+'>'+i+'개</option>'
        );
    }
    $('.bname').text(list[0].bname);//업체명 삽입
}
function initBodyEvent() {
    initModal();//모달 이벤트 관리fn
    var table=$('#single_option');
    $('.content').on('click','.unlikeBtn',function() {//좋아요 취소 버튼 클릭
        var bno=Number($(this).attr("value"));
        likeObj.bno=bno;
        likeOff(likeObj);
    });
    $('.content').on("click",'.rsvBtn',function() {
        var bno=$(this).attr('id').substr(6);
        rsvObj.rbno=Number(bno);//업체의 bno
        alertObj.addressee=Number($(this).val());//업체의 mno 
        modalAjax(bno);
    });
    table.on("click",'input:checkbox',function() {
        var lno=$(this).val();
        var ckTf=$(this).is(":checked");
        changeListener(lno,ckTf);
    });
    table.on("change",'select.resOpc',function(){
        var lno=Number($(this).attr('id').charAt(4));//id(selc)의 lno 추출
        var cnt=$(this).val();
        var price=Number($('#price'+lno).attr('value'));
        $('#price'+lno).text(cnt*price);//개수*기존가격 반영
        totalPriceSet();
    });
}
function totalPriceSet() {
    totalPrice=0;
    var chkedList = $('.chked');
    var lno;
    for(var i=0;i<chkedList.length;i++){
       lno=$('.chked').eq(i).attr('id').charAt(3);//id(chk)의 lno 추출
       totalPrice+=Number($('#price'+lno)[0].innerHTML);
    }
    if(lno<5) {
        $('#dDay').text(dDay(3));
    }else {
        $('#dDay').text(dDay(7));
    }
    if(totalPrice==0){
        totalPrice="";
    }
    $(".totalAll").text(totalPrice);
}
function changeListener(lno,ckTf){
    if(ckTf) {//활성화라면,
        $('#chk'+lno).addClass('chked');
        $("#selc"+lno).attr("disabled",false); //셀렉트 항목 활성화
        totalPriceSet();
    }else {
        $('#chk'+lno).removeClass('chked');
        $('#selc'+lno).val("1").trigger('change');
        $("#selc"+lno).attr("disabled",true); //셀렉트 항목 비활성화
    }
}
function likeOff(likeObj) {
    $.post({
        url:"/likeOff.do",
        data:likeObj,
        success:function() {
            $('#card'+likeObj.bno).remove();
            delete likeObj.bno;//초기화
        }
    });
}
function initSide() {
    $('.side button').eq(1).addClass("side_select");
    $('.side').css({'position':'fixed','float':'none'});
}
function printList() {
    $('.card').remove();
    $.each(likedBsList,function(key,value){
        $('.content').append(
                '<div class="card" id="card'+value.bno+'">'+
                '<div class="bsTagLeft">'+
                    '<div class="tagTop">'+
                        '<div class="like">'+
                            '<i class="fas fa-heart like" value='+value.bno+'></i>'+
                        '</div>'+
                        '<p>'+value.bname+'</p>'+
                    '</div>'+
                    '<div class="tagBottom">'+
                        '<i class="fas fa-map-marker-alt"></i>'+
                        '<span class="address">'+value.address+'</span>'+
                        '<i class="fas fa-phone-alt"></i>'+
                        '<span class="phone">'+value.phone+'</span>'+
                        '<i class="fas fa-star"></i>'+
                        '평점<span class="eval">'+value.eval+'</span>'+
                        '<i class="fas fa-user-edit"></i>'+
                        '리뷰<span class="reviewCount">'+value.count+'</span>'+
                        '<i class="fas fa-heart"></i>'+
                        '좋아요<span class="likeCount">'+value.likedNum+'</span>'+
                    '</div>'+
                '</div>'+
                '<div class="bsTagRight">'+
                    '<button class="rsvBtn" id="rsvBtn'+value.bno+'" value="'+value.mno+'">예약하기</button>'+
                    '<button class="unlikeBtn" value="'+value.bno+'">찜하기 취소</button>'+
                '</div>'+
            '</div>');
    });
}
function initModal() {//모달 이벤트 관리
    $("#modal_close").click(function(){//모달 닫기
        modalClose();
    });
    $("#closeBtn").click(function() {//모달 닫기
        modalClose();
    });
    $('#comBtn').click(function() {//결제 버튼이 눌렸다면
        var totalPrice=Number($('.totalAll')[0].innerHTML);
        if(totalPrice == 0){
            alert("지불할 금액이없습니다. 옵션을 선택해주세요.")
        }else {
            resListSet();//체크된 품목 리스트 입력
            rsvObj.totalPrice=totalPrice;//총 금액 입력
            requestPay(totalPrice);
            // console.log(JSON.stringify(rsvObj));
        }
    });
    $("#mask").click(function(){//마스크 쪽이 눌렸다면
        modalClose();
    });
    $("#agreement i").click(function() {
        $(this).toggleClass('fa-chevron-down');
        $(this).toggleClass('fa-chevron-up');
        console.log($(this).css('display'));
        if($('.termsText').eq($(this).attr('value')).css('display')=="none"){
            $('.termsText').eq($(this).attr('value')).show();
        }else{
            $('.termsText').eq($(this).attr('value')).hide();
        }
    });
}
function resListSet(){
    var list=new Array();
    var cntChk=$('.chked');
    var ddate;
    for(var i=0;i<cntChk.length;i++){
        lno = Number($('.chked').eq(i).attr('id').charAt(3))+1;//lno추출
        cnt = $('#selc'+lno).val();//cnt추출
        list.push({lno:lno,cnt:cnt});//리스트 셋
        if(lno<5){
            ddate=3;
        }else{
            ddate=7;
        }
    }
    rsvObj.resListData=JSON.stringify(list);
    rsvObj.ddate=ddate;
}
function openModal() {
    $("#mask").show();
    $('#modal_container').show();
}
function modalClose() {
    $('#modal_container').hide();
    $("#mask").hide();
}
function requestPay(totalPrice) {
    //결제관련 api 기능
     IMP.request_pay({
           pg : 'kakao', // 결제방식
           pay_method : 'card',   // 결제 수단
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : '주문명: 결제 테스트',   // order 테이블에 들어갈 주문명 혹은 주문 번호
           amount : totalPrice,   // 결제 금액
           buyer_email : 'test',   // 구매자 email
           buyer_name :  'test',   // 구매자 이름
           buyer_tel :  'test',   // 구매자 전화번호
           buyer_addr :  'test',   // 구매자 주소
           buyer_postcode :  'test',   // 구매자 우편번호
           m_redirect_url : '/khx/payEnd.action'   // 결제 완료 후 보낼 컨트롤러의 메소드명
       }, function(rsp) {
       if ( rsp.success ) { // 성공시
          
          var msg = '결제가 완료되었습니다.'
          msg += '고유ID : ' + rsp.imp_uid
          msg += '상점 거래ID : ' + rsp.merchant_uid
          msg += '결제 금액 : ' + rsp.paid_amount
          msg += '메일 : ' + rsp.buyer_email
          msg += '이름 : ' + rsp.buyer_name
          msg += '우편번호 : ' + rsp.buyer_postcode
          rsvAjax();
          modalClose();
          //알림과 insert 들어갈 예정
       } else { // 실패시
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
       }
    })
 }
 function rsvAjax() {
    $.ajax({
        url:'/respay.do'
        , method : 'POST'
        , data: rsvObj
        , success:function(result){
           msgSet(result);
           sendAlarm();
        }
    })
}
function dDay(addDate) {
    var date=new Date();
    date.setDate(date.getDate()+addDate);
    var mm=date.getMonth()+1;
    var dd=date.getDate();
    var today=date.getFullYear()+'.'+(mm<10?'0'+mm:mm)+'.'+(dd<10?'0'+dd:dd);
    return today;
}
function msgSet(rsvNum) {
        alertObj.rsvNum=rsvNum;
        alertObj.msg='새로운 주문(번호:'+rsvNum+')이 등록되었습니다.';
        alertObj.typenum=1;
}