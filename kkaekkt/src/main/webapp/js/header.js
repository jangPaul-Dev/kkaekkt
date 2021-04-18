$(document).ready(function() {
    initHeaderEvent();
    headerAlertAjax();
});
function initHeaderEvent() {
    initChatEvent();
    $('#noticeBox ul').on('click','.msgBody',function() {//알림 리스트의 제목 클릭 시
        alertObj.ano=Number($(this).attr('id').substr(3));
        var header=$(this).siblings()[0].innerHTML;
        readAlert(header);
    });
    $('.fa-bell').click(function() {//종을 누를 경우 알림 리스트 출력/숨기기
        $('#noticeBox').toggle();
        $('#chatCont').hide();//채팅 박스는 숨긴다
    });
    $('#noticeBox').on('click','i',function() {//알림 리스트의 삭제버튼 클릭 시
        alertObj.ano=Number($(this).attr('id').substr(8));
        delHeaderAlert();
    });
    
}
function today() {
    let date=new Date();
    let mm=date.getMonth()+1;
    let dd=date.getDate();
    let today=date.getFullYear()+'.'+(mm<10?'0'+mm:mm)+'.'+(dd<10?'0'+dd:dd);
    return today;
}
function time(){
    let today = new Date();   
    let hours = today.getHours(); // 시
    let minutes = today.getMinutes();  // 분
    let thisTime=(hours<13?'오전 '+hours:'오후 '+(hours-12))+':'+(minutes<10?'0':'')+minutes;
    return thisTime
}
function sendAlarm() {//알림 보내는 공용 메서드
    var msgType=0;//메시지 타입은 알람
    var alertType; //알람의 타입
    switch(alertObj.typenum) {
        case 1:alertType='[주문]';
        case 2:alertType='[결제]';
        case 3:alertType='[완료]';
        case 4:alertType='[답글]';
        case 5:alertType='[취소]';
    }
    $.post({
        url:'/regitAlert.do',
        data:alertObj,
        success:function(ano) {
            if(socket){
                var receiver=alertObj.addressee;
                var msg='<li class="alertLi'+ano+'"><div>'+
                                '<span class="msgHeader">'+alertType+'</span>⠀<span class="msgBody" id="msg'+ano+'">'+alertObj.msg+'</span>'+
                            '</div>'+
                            '<div>'+
                                '<span class="alertDate">'+today()+'</span>'+
                                '<span class="byBs">by '+alertObj.senderName+'</span>'+
                            '</div>'+
                            '<i id="del'+ano+'"class="fas fa-times alertDelBtn"></i>'+
                        '</li>'
                socket.send(msgType+receiver+'msg:'+msg);
            }
        }
    });
}
function initChatEvent(){
    $('.fa-comments').click(function() { //채팅 아이콘 클릭
        $('#chatCont').toggle();
        $('#noticeBox').hide();//알림창은 숨긴다
    });
    $('.chatContainer').on('click','.closeChatBtn',function() { //메인 채팅방 닫기 버튼
        var array=$(this).attr('id') //버튼의 id에서 
                         .split('clsBtn'); //좌측의 게스트번호와 우측의 방번호를 가져온다.
        $('#'+array[0]+'room'+array[1]).remove();//추출한 정보로 채팅방 id를 만들어 지워준다.                         
    });
    $('.chatContainer').on('click','.chatWriteBtn',function(){
        var array=$(this).attr('id') //버튼의 id에서 
                         .split('sendBtn'); //좌측의 게스트번호와 우측의 방번호를 가져온다.
        chatObj.content=$(this).siblings()[0].value; //버튼 옆에 textArea에서 사용자가 입력한 텍스트를 입력
        chatObj.addressee=Number(array[0]);
        chatObj.roomnum=Number(array[1]);
        $(this).siblings()[0].value='';//입력칸 초기화
        // 채팅 쏘는 메서드 입력 예정
        sendChat();
        var chat={
            roomnum:chatObj.roomnum,
            sender:chatObj.sender,
            content:chatObj.content,
            time:time()
        }
        appendChat(chat);
    });
    $('.chatfooter').on('click','.chatExitBtn',function(){
        chatObj.closer=chatObj.sender;//본인 번호를 나간(갈)사람으로 입력한다.
        chatObj.roomnum=Number($(this).attr('id') //버튼의 id에서
                                      .substr(11));//방번호만 추출한다.
        chatRoomExit();
    });
}
function chatRoomExit(){
    $.get({
        url:'/exitChatRoom.do',
        data:chatObj,
        success:function(){
            $('.chatList[id$=roomLi'+chatObj.roomnum+']').remove();//방번호로 끝나는 채팅방 삭제
            initChatObj();
        }
    });
}
function sendChat(){
    var msgType=1;//메시지 타입 0=알림, 1=채팅
    $.get({
        url:'/sendChat.do',
        data:chatObj,
        success:function(result){//정상적으로 메서드가 완료됐다면,
            if(result=="success"){
                if(socket){
                    var receiver=chatObj.addressee;
                    var msg=chatObj.sender+//메시지의 포맷 = 발신자 번호,name:발신인,roomnum:방번호,content:내용
                            ',name:'+alertObj.senderName+
                            ',roomnum:'+charObj.roomnum+
                            ',content:'+chatObj.content;
                    socket.send(msgType+receiver+'msg:'+msg);//메시지 보냄
                }
            }
        }
    });
    initChatObj();
}
function readChatRog(data){//방번호와 본인 번호
    $.get({
        url:'/readChat.do',
        data:data,
        success:function(){
        }
    });
    initChatObj();
}
function appendChat(chat){//매개변수에 담겨있는 정보-방 번호,발신자 번호,내용,일시
    var chatLiClass; // 채팅 li의 말풍선 클래스
    var chatPClass; //채팅 p의 글자색 클래스
    if(chat.sender==chatObj.sender){//올리는 채팅 로그의 발신자가 본인이라면
        chatLiClass='chatRight';
        chatPClass='chatMine';
    }else{
        chatLiClass='chatLeft';
        chatPClass='chatGuest';
    }
    $('#chatRog'+chat.roomnum).append(
        '<li class="chatRogli '+chatLiClass+'">'+
            '<p class="chatRogP '+chatPClass+'">'+chat.content+'</p>'+
            '<p class="timeRog">'+chat.time+'</p>'+
        '</li>'
    );
}
function readAlert(header) {//알림 탭 페이지 공용메서드... 이 부분은 수정 필요
    console.log('읽기 진입');
    var url;
    if(alertObj.mtype==1){//만약 개인 회원이라면
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[완료]')//헤더가 완료라면..이슈
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[답글]')//헤더가 답글이라면
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageUser/mypagePs.jsp";
    }else if(alertObj.mtype==2){//만약 업체회원이라면..리뷰 추가해야할 듯
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageBiz/mpbProg_Num.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageBiz/mypageBs_com.jsp";
    }
    $.post({
        url:'/updateAlert.do',
        data:alertObj,
        success:function() {
            location.href=url;
        }
    });
}
function crtRoom(guest) {
    var bno;
    var rooms=$('.chatBox'); //먼저 열려있는 채팅방을 검사한다.
    if(rooms!=undefined){//만약 방이 하나이상 존재한다면,    
        for(var i=0;i<rooms.length;i++){
            mno=rooms.eq(i) //i 번째 방의
                .attr('id') //id 에서
                .split('room')[0] //mno부분을 추출한다.
            if(Number(mno)==chatObj.addressee){//열려있는 방 중 이미 상대방과의 채팅방이 있다면,
                return; //아무것도 하지 않고 리턴한다.
            }
        }
    }//열려있는 방 중에 상대방이 없을 경우 ajax 시행으로 넘어감
    $.post({
        url:'/crtRoom.do',
        data:chatObj,
        success:function(result) {//반환값은 map (방번호=roomnum와 채팅로그=charRog가 저장됨)
            var room=JSON.parse(result);
            if(rooms.length==3){//만약 3개의 채팅방이 개설된 상태라면
                rooms.eq(0).remove();//제일 먼저 생성된 채팅방을 지움
            }
            room.guest=guest;//게스트명 입력
            room.addressee=chatObj.addressee;//수신자 번호 입력
            printRoom(room);
            var guestRoomLi=$('#'+room.addressee+'roomLi'+roomnum);
            if(guestRoomLi[0]==undefined){//헤더 채팅방 리스트에 상대방과의 채팅방이 없다면,
                printRoomLi(room);//만들어준다.
            }
            initChatObj();//객체 초기화 메서드
        }
    });
}
function initChatObj(){//초기화
    delete chatObj.mno;//mno지움
    delete chatObj.bno;//bno지움
    delete chatObj.roomnum;//방번호 지움
    delete chatObj.content;//채팅내용 지움
    delete chatObj.addressee;//받는이 지움
}
function printRoom(room){
    $('.chatContainer').append(//채팅방을 만듦
        '<li class="chatBox" id="'+room.addressee+'room'+room.roomnum+'">'+
            '<div class="chatBoxHeader">'+
                '💬<span id="guest'+room.roomnum+'">'+room.guest+'</span>'+
                '<i class="fas fa-times closeChatBtn" id="'+room.addressee+'clsBtn'+room.roomnum+'"></i>'+
            '</div>'+
            '<ul class="chatRogUl" id="chatRog'+room.roomnum+'">'+
            '</ul>'+
            '<div class="chatInputBox">'+
                '<textarea class="chatText"placeholder="대화를 입력하세요"></textarea><button id="'+room.addressee+'sendBtn'+room.roomnum+'" class="chatWriteBtn">전송</button>'+
            '</div>'+
        '</li>'
    );
    if(room.chatRog!=undefined){//채팅 로그가 있다면
        var listType; // 보낸 이가 본인일 때 오른쪽, 게스트일 때 왼쪽을 입력
        var chatType; // 보낸 이가 본인일 때 mine, 게스트일 때 guest 입력
        $.each(room.chatRog,function(key,value){
            if(value.sender==chatObj.sender){
                listType='chatRight';
                chatType='chatMine';
            }else{
                listType='chatLeft';
                chatType="chatGuest";
            };
            $('#chatRog'+roomnum).append(
            '<li class="chatRogli '+listType+'">'+
                '<p class="chatRogP '+chatType+'">'+value.content+'</p>'+
                '<p class="timeRog">'+value.stime+'</p>'+
            '</li>'
            );
        });
    }
}
function printRoomLi(room){
    $('.chatfooter').append(
        '<ul class="chatList" id="'+room.addressee+'roomLi'+room.roomnum+'">'+
            '<li>'+
                '<p>'+room.guest+'</p>'+
                '<p>'+(room.content==undefined?'':room.content)+'</p>'+//컨텐츠가 없을 때는 공백, 있을 때는 정상출력
            '</li>'+
            '<li>'+
                '<button class="chatExitBtn" id="chatExitBtn'+room.roomnum+'">나가기</button>'+
            '</li>'+
        '</ul>'
    );
}
function delHeaderAlert() {//알림 삭제 메서드
    console.log('알림삭제');
    $.post({
        url:'/delAlert.do',
        data:alertObj,
        success:function() {
            if(!$('.alertLi'+alertObj.ano).hasClass('read')){//읽은 알림이 아니라면
                downAlertDotCount();
            }
            $('.alertLi'+alertObj.ano).remove();
            initAlertObj();
        }
    });
}
function headerAlertAjax() {
    console.log('alert초기화 진입');
    alertObj.datediff=7;//7일 내로 온 알림만 추출
    $.post({
        url:'/getAlertList.do',
        data:alertObj,
        success:function(data) {
            var list = JSON.parse(data);
            printHeaderList(list);
            initAlertObj();
        }
    });
}
function printHeaderList(list) {//헤더에 알림 리스트 출력
    var read;
    var count=list.length;
    $.each(list, function(key,value) {
        if(value.state==2){
            read=' read';
            count--;
        }else {
            read='';
        }
        $('#noticeBox ul').append('<li class="alertLi'+value.ano+read+'">'+
                                    '<div class="msgTop'+read+'">'+
                                        '<span class="msgHeader">'+value.typename+'</span>⠀<span id="msg'+value.ano+'" class="msgBody">'+value.msg+'</span>'+
                                    '</div>'+
                                    '<div class="msgBottom'+read+'">'+
                                        '<span class="date">'+value.date+'</span>'+
                                        '<span class="byBs">by '+value.senderName+'</span>'+
                                    '</div>'+
                                    '<i id="alertDel'+value.ano+'" class="fas fa-times"></i>'+
                                '</li>'
        );
    });
    printAlertDot(count);
}
function initAlertObj() {//객체 초기화 공용 메서드
    delete alertObj.state;
    delete alertObj.typenum;
    delete alertObj.ano;
}
function printAlertDot(count){//알림 출력 메서드
        $('#bellBox .alertDot').text(count);
    if(count!=0){
        $('#bellBox .alertDot').show();
    }
}
function downAlertDotCount(){//알림 카운트 내리기 메서드
    var count=Number($('#bellBox .alertDot')[0].innerHTML)-1;
    if(count==0){
        $('#bellBox .alertDot').hide();
    }
    $('#bellBox .alertDot').text(count);
}
function upAlertDotCount(){//알림 카운트 올리기 메서드
    var count=Number($('#bellBox .alertDot')[0].innerHTML)+1;
    $('#bellBox .alertDot').text(count);
    $('#bellBox .alertDot').show();
}
function alertDotCountZero(){
    $('#bellBox .alertDot').hide();//먼저 숨긴다.
    $('#bellBox .alertDot').text(0);//숫자를 0으로 돌린다.
}