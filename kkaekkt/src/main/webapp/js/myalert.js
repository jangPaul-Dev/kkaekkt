$(document).ready(function() {
    initSide();
    initBodyEvent();
    ajax();
});
function ajax() {
	console.log('ajax진입');
    alertObj.datediff=14;
    $.post({
        url:'/getAlertList.do',
        data:alertObj,
        success:function(data) {
            var list = JSON.parse(data);
            printAlertList(list);
            initAlertObj();
        }
    });
}
function initSide() {
    $('.side button').eq(2).addClass("side_select");
    $('.side').css({'position':'fixed'});
}
function printAlertList(list) {
    var read;
    $('#alertListBox .date').remove();
    $.each(list, function(key,value) {
        read=(value.state==2?' class="read"':'');
        if($('#alertListBox .date').last().attr('id')==value.date){//날짜가 같다면 리스트만 출력
            $('#alertListBox .date ul').last().append(
                '<li class="alertLi'+value.ano+'"><div'+read+'>'+
                        '<span class="msgHeader">'+value.typename+'</span>⠀<span class="msgBody" id="msg'+value.ano+'">'+value.msg+'</span>'+
                    '</div>'+
                    '<div'+read+'>'+
                        '<span class="byBs">by '+value.senderName+' </span><span>⠀|⠀</span>'+
                        '<span class="alertDate">'+value.date+'</span>'+
                    '</div>'+
                    '<i id="del'+value.ano+'"class="fas fa-times"></i>'+
                '</li>'
            );
        }else {
            $('#alertListBox').append(//날짜가 다르다면 div째로 출력
                '<div id="'+value.date+'"class="date">'+
                    '<i class="far fa-clock"></i>'+
                    '<h2>'+value.date+'</h2>'+
                    '<ul>'+
                        '<li class="alertLi'+value.ano+'"><div'+read+'>'+
                                '<span class="msgHeader">'+value.typename+'</span>⠀<span class="msgBody" id="msg'+value.ano+'">'+value.msg+'</span>'+
                            '</div>'+
                            '<div'+read+'>'+
                                '<span class="byBs">by '+value.senderName+' </span><span>⠀|⠀</span>'+
                                '<span class="alertDate">'+value.date+'</span>'+
                            '</div>'+
                            '<i id="del'+value.ano+'"class="fas fa-times"></i>'+
                        '</li>'+
                    '</ul>'+
                '</div>');
        }
    });
}
function initBodyEvent() {
    $('#alertListBox').on('click','i.fa-times',function() {//삭제버튼이 눌렸을 때
        alertObj.ano=Number($(this).attr('id').substr(3));
        delPageAlert();
        downAlertDotCount();
    });
    $('#readDelBtn').click(function() {//읽은 알림 삭제버튼이 눌렸을 때
        alertObj.state=2;//읽음 상태인 알림만 삭제
        delPageAlert();
    });
    $('#totalDelBtn').click(function() {//모두 삭제 버튼이 눌렸을 때
        delPageAlert();
    });
    $('#refresh').click(function() {//새로고침 버튼이 눌렸을 때
        ajax();//리스트 초기화
    });
    $('#total').click(function() {//전체보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        ajax();
    });
    $('#order').click(function() {//주문항목보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        alertObj.typenum=1;
        ajax();
    });
    $('#check').click(function() {//결제항목보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        alertObj.typenum=2;
        ajax();
    });
    $('#complete').click(function() {//완료항목보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        alertObj.typenum=3;
        ajax();
    });
    $('#reply').click(function() {//답글항목보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        alertObj.typenum=4;
        ajax();
    });
    $('#cancel').click(function() {//취소항목보기
        $(this).siblings().removeClass('selected');
        $(this).addClass('selected');
        alertObj.typenum=5;
        ajax();
    });
    $('#alertListBox').on('click','.msgBody',function() {//메시지를 클릭했다면
        alertObj.ano=Number($(this).attr('id').substr(3));
        var header=$(this).siblings()[0].innerHTML;
        readAlert(header);//헤더 js에 저장된 메서드
    });
}
function delPageAlert() {//알림 삭제 메서드
    $.post({
        url:'/delAlert.do',
        data:alertObj,
        success:function() {
            if(alertObj.ano!=undefined){//부분삭제라면
                if($('.alertLi'+alertObj.ano).eq(0).hasClass('read')){
                    downAlertDotCount();
                }
                $('.alertLi'+alertObj.ano).remove();
            }else if(alertObj.state!=undefined){//읽은 알림 삭제라면
                ajax();//읽은 알림만 삭제하려 했지만, div단위를 삭제해야할 경우 난감하므로 그냥 리스트 초기화
                $('#noticeBox .read').remove();//헤더의 읽은 알림 삭제
            }else {//전체 삭제라면
                $('#alertListBox .date').remove();
                $('#noticeBox ul').children().remove();
                alertDotCountZero();
            }
            initAlertObj();//헤더 js에 저장된 공용 메서드 -> 객체 초기화
        }
    });
}