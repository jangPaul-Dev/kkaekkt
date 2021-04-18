$(document).ready(function() {
    initSide();
    initEvent();
	initModal();
    initCommObj();
    ajax(); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
});
function initEvent() {
	var rsvNum;
    $('.rsvList').on("click",".detailBtn",function() { // 버블링으로 생성된 주문에 클릭 이벤트 활성화
		rsvNum=$(this).attr('id').substr(9);
        if(!$('#commBox'+rsvNum).hasClass('none')){ //만약, 리뷰 보기가 열려있다면
            $('#commBox'+rsvNum).addClass('none'); // 닫기
        }
        $('#detail'+rsvNum).toggleClass('none');
    });
    $('.rsvList').on("click",".commentBtn",function() {//리뷰쓰기 버튼이 눌렸을 경우
        rsvNum=$(this).attr('id').substr(10);
        commObj.rsvNum=Number(rsvNum);
        commObj.bno=Number($('#rsvBox'+rsvNum+' .like').attr('value'));
        $("#modal_container").show();
    });
    $('.rsvList').on("keyup",".commentBox",function() {//리뷰 텍스트 입력 시 글자 길이 반영
        if($(this).val().length>=300) {
            alert("300자 까지 입력할 수 있습니다.");
            $(this)[0].value=$(this).val().substr(0,300);
        }
        $('.comments_bottom span')[0].innerHTML=$(this).val().length+' / 300';
    });
    $(".rsvList").on("click",".comments_bottom button",function(){ //수정->등록 버튼 누를 경우
        commObj.content=$('.commentBox').eq(0).val();
        commObj.rsvNum=$(this).val();
        edit();
    });
    $('.rsvList').on("click",".reviewBtn",function() {//리뷰보기 버튼 클릭 시
        rsvNum=$(this).attr('id').substr(9);
        if(!$('#detail'+rsvNum).hasClass('none')){//만약 상세보기가 열려있다면
            $('#detail'+rsvNum).addClass('none');//상세보기 닫기
        }
        $('#commBox'+rsvNum).eq(0).toggleClass('none');
    });
    $('.rsvList').on("click",".cancel",function() {//코멘트 작성 중 취소버튼이 눌렸을 경우
        rsvNum=$(this).val();
        $('.comments').remove();
        $('#comments_view'+rsvNum).removeClass('none');
    });
    $('.page_next').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum+=1;
            ajax();
        }
    });
    $('.page_prev').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum-=1;
            ajax();
        }
    });
    $('.page_prevBlock').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum=pageObj.blockFirstPageNum-1;
            ajax();
        }
    });
    $('.page_nextBlock').click(function() {
        if(!$(this).hasClass('no')) {
            pageObj.currentPageNum=pageObj.blockLastPageNum+1;
            ajax();
        }
    });
    $('.page_btn').on("click",".page_list",function() {
        if(pageObj.currentPageNum!=JSON.parse($(this).html())) {
            pageObj.currentPageNum=JSON.parse($(this).html());
            ajax();
        }
    });
    $('.rsvList').on('click','i.fa-heart',function() {//좋아요버튼
        likeObj.bno=Number($(this).attr('value'));
        if($(this).hasClass('unlike')) {
            $(this).removeClass('unlike');
            likeOn(likeObj);
        }else {
            $(this).addClass('unlike');
            likeOff(likeObj);
        }
    });
    $('.rsvList').on("click",".dotBtn",function() {//쓰리닷 버튼
        $(this).siblings().eq(1).toggleClass('none');
    });
    $('.rsvList').on("click",".popMenu button",function() {//쓰리닷 버튼->수정 or 삭제가 눌렸을 경우
        rsvNum=$(this).attr('id').substr(3);
        $('#popMenu'+rsvNum).addClass('none');
            commObj.rsvNum=Number(rsvNum);
        if($(this).index()==0) {//수정버튼이 눌렸을 경우
            commObj.content=$('#comments_content'+rsvNum)[0].innerHTML;
            editBtn(rsvNum);
        }else {//삭제버튼이 눌렸을 경우
            deleteComm(rsvNum);
        }
    });
}
// function msgSet(rsvNum) { //리뷰 작성 시 업체에게 알림을 보낼 경우 사용할 예정
//     alertObj.rsvNum=rsvNum;
//     alertObj.typenum=5;
//     alertObj.msg='주문번호'+rsvNum+' 가 취소되었습니다.'
// }
function likeOff() {
    $.post({
        url:"/likeOff.do",
        data:likeObj,
        success:function() {
        	ajax();
            delete likeObj.bno;//초기화
        }
    });
}
function likeOn() {
    $.post({
        url:"/likeOn.do",
        data:likeObj,
        success:function() {
        	ajax();
            delete likeObj.bno;//초기화
        }
    });
}
function initPageBtn() {
    if(pageObj.isNextExist) {
        $('.page_next').removeClass('no');
    }else {
        $('.page_next').addClass('no');
    }
    if(pageObj.isNextBlockExist) {
        $('.page_nextBlock').removeClass('no');
    }else {
        $('.page_nextBlock').addClass('no');
    }
    if(pageObj.isPrevExist) {
        $('.page_prev').removeClass('no');
    }else {
        $('.page_prev').addClass('no');
    }
    if(pageObj.isPrevBlockExist) {
        $('.page_prevBlock').removeClass('no');
    }else {
        $('.page_prevBlock').addClass('no');
    }
    $('.page_btn .page_list').remove(); //페이지 리스트 초기화
    for(var i=pageObj.blockLastPageNum;i>=pageObj.blockFirstPageNum;i--) {
        if(i==pageObj.currentPageNum) {
            $("<li class='page_list curPage'>"+i+"</li>").insertAfter($('.page_prev')).trigger("create");
        } else {
            $("<li class='page_list'>"+i+"</li>").insertAfter($('.page_prev'));
        }
    }
}
function initPageObj(data) {
    pageObj.blockLastPageNum=data.blockLastPageNum;
    pageObj.blockFirstPageNum=data.blockFirstPageNum;
    pageObj.isNextBlockExist=data.isNextBlockExist;
    pageObj.isNextExist=data.isNextExist;
    pageObj.isPrevBlockExist=data.isPrevBlockExist;
    pageObj.isPrevExist=data.isPrevExist;
    initPageBtn();
}
function ajax() { //ajax로 리스트 받아오기
    console.log('ajax 함수 진입');
    $.post({
        url:"/getRsvListPs.do",
        data:pageObj,
        success: function(data) {
            var rsv=JSON.parse(data);
            var list=rsv.rsvListRno;
            initPageObj(rsv);
            printlist(list);
            console.log('ajax 완료');
        }
    });
}
function initSide() {
    $(".content").css("left", "22vw");
    $('.side_sub').css('display','unset');
    $('.side button').eq(0).addClass("side_select");
    $('.side_sub button').eq(1).addClass("side_sub_select");
    $('.side_sub button').click(function() { // 완료된 주문 출력
        if($(this).index()==0){ //진행중인 주문
            location.href="mypagePs.jsp"
        }
    });
}
function initModal() {
    /* 모달 생성 */
    $('#review_text').keyup(function() {
        $('#review_texter').html($(this).val().length)
    });
    $(".fa-times").click(function(){
        closeModal();
    });
    $("#closeBtn").click(function(event){ //모달 닫기
        event.preventDefault();
        closeModal();
    });
    /* 평점 받기 */
    $(".rating__input").click(function(){ 
        var starVal = $(this).attr('value'); 
        $("#starVal").val(starVal);
    });
    $('#regit').click(function(event) {
        event.preventDefault();
        regit();
    });
}
function initCommObj() {
    commObj.mno=pageObj.mno;
    commObj.depth=0;
    commObj.mname=pageObj.mname;
}
function closeModal() {
    $('#review_text').val('');
    $("#modal_container").hide(); 
}
function regit() {
    commObj.eval=$('#starVal').val();
    commObj.content=$('#review_text').val();
    $.post({
        url:'/regitComm.do',
        data:commObj,
        success:function() {
            alert("리뷰가 정상적으로 등록되었습니다.");
            closeModal();
            viewChange();
        }
    });
}
function viewChange() {//리뷰를 쓴 예약의 버튼을 바꾸고 리뷰박스를 집어넣음
    var reviewBtn=$('#btnDiv'+commObj.rsvNum+' button:nth-child(3)');
    reviewBtn.removeClass('commentBtn');
    reviewBtn.addClass('reviewBtn');
    reviewBtn.attr('id','reviewBtn'+commObj.rsvNum);
    reviewBtn[0].innerHTML='리뷰보기';
    $('#commBox'+commObj.rsvNum)[0].innerHTML=printComment(commObj.mname,commObj.content,today(),commObj.rsvNum);
}

function printEditBox(rsvNum) {
    return '<div class="comments">'+
                '<div class="comments_header">'+
                    '<button class="cancel" value='+rsvNum+'>취소</button>'+
                '</div>'+
                '<textarea class="commentBox" cols="30" rows="3">'+commObj.content+'</textarea>'+
                '<label class="writer">'+commObj.mname+'</label>  '+
                '<div class="comments_bottom">'+
                    '<span>0 / 300</span>'+
                    '<button value='+rsvNum+'>등록</button>'+
                '</div>'+
            '</div>'
}
function editBtn(rsvNum) {
    $('#comments_view'+rsvNum).addClass('none');
    $('#commBox'+rsvNum).prepend(printEditBox(rsvNum));
}
function edit() {
    $.post({
        url:'/updateComm.do',
        data:commObj,
        success:function() {
            alert('수정이 완료되었습니다.');
            $('.comments').remove();
            $('#comments_content'+commObj.rsvNum)[0].innerHTML=commObj.content;
            $('#comments_view'+commObj.rsvNum).eq(0).removeClass('none');
        }
    });
}
function deleteComm(rsvNum) {
    if($('#commBox'+rsvNum).children()[1]==undefined){//답글이 없을 때
        $.post({
            url:'/deleteCommAb.do',
            data:commObj,
            success:function() {
                commBtn=$('#btnDiv'+rsvNum+' button:nth-child(3)');
                alert('삭제가 완료되었습니다.');
                $('#commBox'+rsvNum).children().remove();
                commBtn.addClass('commentBtn');
                commBtn.removeClass('reviewBtn');
                commBtn.attr('id','commentBtn'+rsvNum);
                commBtn[0].innerHTML='리뷰쓰기';
            }
        });
    }else {//답글이 있을 때
        commObj.content='삭제된 리뷰입니다.';
        $.post({
            url:'/deleteCommCh.do',
            data:commObj,
            success:function() {
                alert('삭제가 완료되었습니다.');
                $('#commBox'+rsvNum).children().remove();
                $('#reviewBtn'+rsvNum).attr("disabled",true);
                initCommObj();
            }
        });
    }
}
function printComment(name,content,date,rsvNum) {
    return '<div id="comments_view'+rsvNum+'" class="comments_view">'+
                    '<div class="comments_writer">'+
                        '<p class="mname">'+name+'</p>'+
                        '<div class="dotBtn"></div>'+
                        '<div id="popMenu'+rsvNum+'"class="popMenu none">'+
                            '<button id="edt'+rsvNum+'">수정</button>'+
                            '<button id="del'+rsvNum+'">삭제</button>'+
                        '</div>'+
                    '</div>'+
                    '<div id="comments_content'+rsvNum+'" class="comments_content">'+content+'</div>'+
                    '<div class="commRdate">'+date+'</div>'+
                '</div>'
}
function printReply(name,content,date) {
    return '<div class="comments_reply">'+
            '<span>┗</span>'+
                '<div class="comments_reply_inner">'+
                    '<div class="comments_reply_writer">'+
                        '<p>'+name+'</p>'+
                    '</div>'+
                    '<div class="comments_reply_content">'+content+'</div>'+
                    '<div class="commRdate">'+date+'</div>'+
                '</div>'+
            '</div>'
}
function printlist(list) {
    var price;
    var totalPrice=0;
    var btnText;
    var btnClass;
    $('.rsvList').children().remove();
    $.each(list, function(key,value) {
        if(value.commList.length>0){
            btnText='리뷰보기';
            btnClass="reviewBtn";
            var comm=value.commList;
        } else {
            btnText='리뷰쓰기';
            btnClass='commentBtn';
        }
        $('.rsvList').append(
            '<div class="rsvBox" id="rsvBox'+value.rsvNum+'">' +
                '<table class="rsvTable">'+
                    '<tr>'+
                    '<th colspan="2" class="mno" id="mno'+value.mno+'">'+value.bname+'</th>'+
                        '<td><i class="fas fa-heart like '+(value.like==0?'unlike':'')+'" value='+value.bno+'></i></td>'+
                    '</tr>'+
                    '<tr>' +
                        '<td class="column">주문일시</td>' +
                        '<td>'+value.rsvDate+'</td>' +
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">예약번호</td>'+
                        '<td id="rsvNum'+value.rsvNum+'">'+value.rsvNum+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">전화번호</td>'+
                        '<td>'+value.phone+'</td>'+
                    '</tr>'+
                    '<tr>'+
                        '<td class="column">주문항목</td>'+
                        '<td><span>'+value.laundryList[0].laundry+'</span>'+
                            (value.laundryList.length-1==0?''://만약 0개라면 공백 아니면 외 ~ 개 추가
                            '</span> 외 <span>'+(value.laundryList.length-1)+'</span>개</td>')+
                    '</tr>'+
                '</table>'+
                '<div id="btnDiv'+value.rsvNum+'" class="btnDiv">'+
                    '<button>채팅상담</button>'+
                    '<button id="detailBtn'+value.rsvNum+'"class="detailBtn">상세보기</button>'+
                    (btnText!='리뷰보기'?(value.timeOut==0?'<button disabled>':'<button id="'+btnClass+value.rsvNum+'" class="'+btnClass+'">')// if 리뷰가 없으면 -> 7일이 지났으면 비활성화 아니면 활성화
                    :(comm[0].content=='삭제된 리뷰입니다.'?'<button disabled>':'<button id="'+btnClass+value.rsvNum+'" class="'+btnClass+'">')// else 삭제된 ~ 이면 비활성화 아니면 활성화
                    )+btnText+'</button>'+
                '</div>'+
                '<div class="detail none" id="detail'+value.rsvNum+'">'+
                    '<hr>'+
                    '<div1-1>'+
                        '<table class="receipt">'+
                            '<tr class="column">'+
                                '<th class="laundry">품목</th>'+
                                '<th class="count">개수</th>'+
                                '<th class="price">가격</th>'+
                            '</tr>'+
                        '</table>'+
                        '<hr>'+
                        '<table class="result">'+
                            '<th>결제금액</th>'+
                            '<td>&nbsp;&nbsp;</td>'+
                            '<td><span class="totalPrice"></span> 원</td>'+
                        '</table>'+
                    '</div1-1>'+
                '</div>'+
                '<div id="commBox'+value.rsvNum+'" class="commBox none">'+
                    (value.commList.length==0?''://댓글이 없다면 공백, 아니라면 댓글 추가
                    printComment(comm[0].mname,comm[0].content,comm[0].rdate,value.rsvNum))+
                    (value.commList.length<2?'':
                    printReply(comm[1].bname,comm[1].content,comm[1].rdate))+
                '</div>'+
            '</div>')+
        '</div>'
    });
    for(var i=0;i<list.length;i++) {//각 주문 별 상세 물품 목록 붙이기
        totalPrice=0;//초기화
        $.each(list[i].laundryList,function(idx,value) {
            price=value.count*value.price;
            totalPrice+=price;
            $('.receipt').eq(i).append(
                '<tr>'+
                    '<td class="laundry">'+value.laundry+'</td>'+
                    '<td class="count">'+value.count+'개</td>'+
                    '<td class="price">'+price+'</td>'+
                '</tr>'
            );
        });
        $('.totalPrice')[i].innerHTML=totalPrice;
    }
}