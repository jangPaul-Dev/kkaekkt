<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
   <html>
   <head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도생성하기</title>  
    <!-- map 에서 필요한 참조 -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>    
    <script src="/js/map.js"></script>
    <!-- 아임포트 -->
     <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
     <script>
   		//로딩시 주소정보 분기
	    var useraddress = `${user.address}`	
	 </script>	
   	 <link rel="stylesheet" href="/css/map.css">  
   </head>
   <body>
    <c:choose>
         <c:when test="${user.mtype==0}">
            <jsp:include page="/jsp/header.jsp"></jsp:include>
         </c:when>
         <c:otherwise>
            <jsp:include page="/jsp/headerPs.jsp"></jsp:include>
         </c:otherwise>
   </c:choose>
      <div id="mask"></div>
      <div class="choicePay">        
	       <p>결제수단 선택</p>
	        <button id="kakaoPay"  style="background-color: #ffe607;">카카오페이</button>
	        <button id="toss" value="2"  style="background-color: #3182f6;">toss</button>
	        <button id="ectPay" value="3"  style="background-color: #d50101;">일반결제</button>
	        <button class="outPaybtn">나가기</button>
		</div>
           <div class="body_container">           		
               <div class="map_container">               
               <!-- 지도타입 컨트롤 div 입니다 -->
			    <div class="custom_typecontrol radius_border">
			        <span id="btnRoadmap" class="selected_btn_map" onclick="setMapType('roadmap')">지도</span>
			        <span id="btnSkyview" class="btn_sky" onclick="setMapType('skyview')">스카이뷰</span>
			    </div>
			    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
			        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
			    </div>
                   <!-- 예약창 로딩중 -->
                   <div class="res_loading hidden">
                       <div class="dot">
                           <i></i><i></i><i></i>
                           <h3>결제진행을 위해 로딩중입니다.</h3>
                           <button>취 소</button>
                       </div>
                   </div>
                   <div class="slide_container">
                       <div class="slide">
                           <div class="slide_top">
                               <p class="here"><input class="findPoint" type="checkbox">내 주변 찾기</p>
                               <div class="slide_search">
                                   <form onsubmit="searchPlaces(); return false;">
                                       <input    class="input_search"  type="text" id="keyword" placeholder="동네를 입력해주세요.">
                                       <button class="input_searchBtn" type="submit">
                                           <i class="fas fa-search fa-lg "></i>                
                                       </button>
                                   </form>
                               </div>
                               <div class="tag">
                                   <p class="slide_mini"></p>
                                   <div class="weatherBox">
								        <div class="boxLeft">
								            <img id="weatherImg" src=""><br>
								        </div>
								        <div class="boxCenter">
								            <span id="weatherMain"></span>
								        </div>
								        <div class="boxRight">
								            <table>
								                <tr>
								                    <th>온도</th>
								                    <th>습도</th>
								                </tr>
								                <tr>
								                    <td id="temp"></td>
								                    <td id="humidity"></td>
								                </tr>
								            </table>
								        </div>								        
								    </div>    
                               </div>
                           </div>
                           <div class="footer list">
                               <div class="slide_card">
                                   <table id="placesList"></table>
                                   <div id="pagination"></div>
                               </div>
                           </div>
                           <div class="footer single">
                               <div class="card">                        
                                   <img id="single_img" src="/img/kkaekkt.png" style="width: 100%; height: 200px; background-color: aliceblue;"> 
                                   <p id="s_title"></p><button class="likeThis"><i class="fas fa-heart" id="heart" ></i></button>
                                   <div id="s_star">
                                   </div>
                           <div class="btnSet">
                              <button class="resbtn">예약하기</button>
                              <button class="chat">상담하기</button>                             
                           </div>
                               </div>
									<div>
	                                   <button class="infoBtn" id="infoData">업체정보</button>
	                                   <button class="infoBtn" id="infoReview">리&nbsp;뷰</button>                               
		                               <div class="cardinfo"> 
		                                       <table id="single_table">
		                                           <tr>
		                                               <td id="memberlog"></td>
		                                           </tr>
		                                           <tr>
		                                               <td><p id="s_phone" style="color:rgb(90, 90, 90); margin: 0"></p></td>
		                                           </tr>
		                                           <tr>
		                                               <td><p id="s_address" style="color:rgb(90, 90, 90); margin: 0"></p></td>
		                                           </tr>
		                                           <tr>
		                                               <td><p id="s_time" style="color:rgb(90, 90, 90); margin: 0"></p></td>
		                                           </tr>
		                                           <tr>
		                                           </tr>
		                                       </table>   
		                                       <div class="moreinfo">
		                                           <p class="more_title">취급 품목</p>
		                                           <hr>
		                                           <table id="single_option"> </table>
		                                       </div> 
		                               </div>
		                               <div class="cominfo">
		                                   <div class="comhead">
		                                       <label for="latest"><input type="radio" class="latest" name="review"checked="checked">최신순</label>
		                                       <label for="grade"><input type="radio" class="grade" name="review">평점순</label>
		                                       <p class="allCom"></p>
		                                   </div>
		                                   <div class="combody"></div>                                
		                               </div>
	                           </div>
                           </div>
                           
                       </div><!-- slide -->
                       <div class="slide_success">
                       		<h3>예약이 완료되었습니다!</h3>
                       		<p>*예약취소는 1시간 이내까지만 가능합니다</p>
	                       	<div class="res_child">
	                       		<p>3/7일 이내로 세탁이 완료될 예정입니다.</p>
	                       		<p>세탁물은 작업완료 이후 1~3일 이내 배송됩니다.</p> 
	                       		<button id="res_return">돌아가기</button>
	                       		<button id="res_check">예약확인</button>
	                       	</div>                       		
                       </div>
                       <div class="slide_res">     
                           <p id="res_p">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i class="far fa-edit"></i>&nbsp&nbsp예약하기</p>
                           <div class="rescont">
                               <p style="width: 94%; height: 35px; padding-block-start: 20px; border-bottom: 1px solid lightgray;">주문신청</p>
                               <table id="resShortOpt"></table>
                           </div>
                           <div class="userInfo">
                              	<p style="font-weight: bolder;">예약자 &nbsp;<span style="font-weight: 500;">${user.name}</span></p>
                                <p style="font-weight: bolder;">연락처 &nbsp;<span style="font-weight: 500;">${user.phone}</span></p>
                        		<p style="font-weight: bolder;">이메일 &nbsp;<span style="font-weight: 500;">${user.email}</span></p>
                           </div>
                           <div class="sellerInfo">
                              	<p id="selname" style="font-weight: bolder;">판매자정보 &nbsp;</p>   
                             	<p>개인정보 수집, 제공 &nbsp;</p>
                               	<div id="agreement">
                                <div id="agreementTop">
                                    <span>개인정보 수집 동의</span><i value="0" class="fas fa-chevron-down"></i>
                                </div>
                                <div class="termsText">
								        <개인정보 수집 동의><br><br>
									        1. 기본수집항목: [필수] kkaekkt 아이디, 이름, 전화번호, 주소<br>
									        	※ 추가 수집하는 필수항목<br>
									        - 배송, 방문 등이 필요한 상품 구매 시 : 주소<br>
									        - 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 성별, 
									       	생년월일, 이메일주소, 카카오톡ID, 동행 아동정보(여권상 영문명, 생년월일, 신장)<br>
									        - 병원을 이용하는 경우: 생년월일<br>
								        <br>
								        	2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존<br>
								        <br>
								        3. 보관기간<br>
								        	- 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관<br>
								        	- 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 <br>
								          	법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요<br>
								          	한 경우에는 해당 기간 동안 보관함<br>
								          <br>
								        	4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br>
							        <br>
	                                </div>
							        <div id="agreementBottom">
							        <span>개인정보 제공 동의</span><i value="1" class="fas fa-chevron-down"></i>
							        </div>
							        <div class="termsText">
							        <span>1. 개인정보를 제공받는 자 : <span  class="bname"></span>
								        <br>
								        <br>
								        2. 제공하는 기본 개인정보 항목:  [필수] kkaekkt 아이디, 이름, (휴대)전화번호, 주소<br>
								     	   ※ 추가 제공하는 필수항목<br>
								        - 배송, 방문 등이 필요한 상품 구매 시 : 주소<br>
								        - 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 생년월일, 이메일주소, 카카오톡ID, 동행 아동정보(여권상 영문명, 생년월일, 신장)<br>
								        - 병원을 이용하는 경우: 생년월일<br>
								        <br>
								        3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 분석과 통계에 따른 혜택 및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 기록보존<br>
								        <br>
								        4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : kkaekkt 회원탈퇴 시 또는 위 개인정보 이용목적 달성 시 까지 이용합니다.<br>
								        <br>
								        5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br>
								        <br>
							         </div>
							         </div>
							         <ul>
							         	<li>취소/환불 규정 &nbsp;</li>
                               		</ul>
                               <p style="width: 92%;font-size: 14px;color: var(--text-gray);padding-bottom: 45px;background-color: white;">예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에동의합니다.</p>
                           </div>
                           <div class="comBtnDiv">
                            <button class="comBtn">결제하기</button>
                           </div>             			       
                       </div><!-- res_slide -->                        
                       <div class="contBtn">
                           <button class="foldBtn">&lt;</button>
                           <button class="foldBtn expand">&gt;</button>
                       </div>
                   </div>
                   
                   <div id="map"></div>
               </div>
           </div>
       </body>   
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3845f493917a302d1ea69e946c0443ff&libraries=services"></script>
       <script>  
       //위도 경도
       	   let lat;
           let lon;
       /* 지도 api에서 제공하는 이벤트 */
           var markers = [];
           var mapContainer = 
            map = document.getElementById('map'),
               mapOption = {
                   center: new kakao.maps.LatLng(37.566826, 126.9786567),level: 2
               };     
           
           var itemel;
           var bno= "";    
           var dbData = [];
           
           // 회원번호
           var mno = ${user.mno};
           
           // 일반세탁, 코인세탁 'type' 구분
       	   var url = window.location.href;
           	   url = url.split("type=")
           var type = Number(url[1])
           
           /* var contuserarr  = []
	  	       contuserarr  = useraddress.split("구")	
	  	       useraddress = contuserarr[0]+"구" */	  	          
 		   
 		   //Controller에서 받아온 주소로 DB 선조회
           bindinglandry(useraddress)
           
           //map 개체 생성
           var map = new kakao.maps.Map(mapContainer, mapOption);
           mapContainer.style.position = "initial";
           
           //장소 검사
           var ps = new kakao.maps.services.Places();
           var infowindow = new kakao.maps.InfoWindow({zIndex:1});
   			
   
           // 키워드 검색
           function searchPlaces() { 
               var keyword = document.getElementById('keyword').value;
               
               if (!keyword.replace(/^\s+|\s+$/g,'')) { 
                   alert('키워드를 입력해주세요!'); 
               	   return false;
               }    
               
               bindinglandry(keyword)
           }              
           
           //데이터 바인딩
           function bindinglandry(keyaddr) {              
              //0325-주옥 : 검색하려는 키워드 캐치 및 select을 하기위해 controller 접근
              var keyaddr = keyaddr;
           
                  $.ajax({
                      url:'/maplist.do'
                      , method : 'POST'
                      , data: { keyaddr : keyaddr,
                    	        type : type  
                      }
                      , dataType: 'json'
                      , success: function(data){ //성공후 처리는 추후 진행.                         
                                if(data==null){
                                   console.log("data 가 조회되지 않았습니다.");
                                   dbData = null
                                }
                                   dbData = data
                                   
                                   // 장소검색을 요청        
                                   if(type == 1)
                                	   keyaddr = keyaddr+" 크리닝"
                                   else if(type == 2)
                                	   keyaddr = keyaddr+"코인세탁"
                                	   
                                   ps.keywordSearch(keyaddr, placesSearchCB); 
                               } 
                  })
         }
   
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
         function placesSearchCB(data, status, pagination) {
             if (status === kakao.maps.services.Status.OK) {           	   
                 displayPlaces(data);   
                 // 페이지 번호를 표출합니다
                 displayPagination(pagination);
 
             } else if (status === kakao.maps.services.Status.ZERO_RESULT) { alert('검색 결과가 존재하지 않습니다.');
                 return;
             } else if (status === kakao.maps.services.Status.ERROR) { alert('검색 결과 중 오류가 발생했습니다.');
                 return;
             }
         }
   
           // 검색 결과 목록과 마커를 표출
           function displayPlaces(places) {
        	   var listEl = "";
               listEl = document.getElementById('placesList'), 
               menuEl = document.getElementById('menu_wrap'),
               fragment = document.createDocumentFragment(), 
               bounds = new kakao.maps.LatLngBounds(), 
               listStr = '';
   
               // 검색 결과 목록에 추가된 항목들을 제거합니다
               removeAllChildNods(listEl);
   
               // 지도에 표시되고 있는 마커를 제거합니다
               removeMarker();
   
       
               for ( var i=0; i<places.length; i++ ) {
              	 $('#countp').html("장 소"+places.length);
               
                   // 마커를 생성하고 지도에 표시합니다
                   var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                       marker = addMarker(placePosition, i), 
                       itemEl = getListItem(i, places); // 검색 결과 항목 Element를 생성합니다 
                       itemEl = itemel
                       
                       // LatLngBounds 객체에 좌표를 추가합니다
                       bounds.extend(placePosition);

                       // 마커와 검색결과 항목에 mouseover 했을때
                       // 해당 장소에 인포윈도우에 장소명을 표시합니다
                       // mouseout 했을 때는 인포윈도우를 닫습니다
                       (function(marker, title) {
                           kakao.maps.event.addListener(marker, 'mouseover', function() {
                               displayInfowindow(marker, title);
                           });

                           kakao.maps.event.addListener(marker, 'mouseout', function() {
                               infowindow.close();
                           });
                           
                           itemEl.onmouseover =  function () {
                               displayInfowindow(marker, title);
                           };

                           itemEl.onmouseout =  function () {
                               infowindow.close();
                           };
                       })(marker, places[i].place_name);
                       fragment.appendChild(itemEl);
                   
               }
   
               // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
               listEl.appendChild(fragment);
   
               // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
               map.setBounds(bounds);
           }
   
           
   
       
           //지도 위에 마커를 표시
           function addMarker(position, idx, title) {
               var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                   imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                   imgOptions =  {
                       spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                       spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                       offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                   },
                   markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                       marker = new kakao.maps.Marker({
                       position: position, // 마커의 위치
                       image: markerImage 
                   });
   
               marker.setMap(map); // 지도 위에 마커를 표출합니다
               markers.push(marker);  // 배열에 생성된 마커를 추가합니다
   
               return marker;
           }
   
           // 지도 위에 표시되고 있는 마커를 모두 제거합니다
           function removeMarker() {
               for ( var i = 0; i < markers.length; i++ ) {
                   markers[i].setMap(null);
               }   
               markers = [];
           }
   
        	// 리스트 출력
           function getListItem(i,place) {  
        		
				if(dbData[i] == null){
					var contentNum = 0
					var grade = 0
					var bno = 0
	        		wirteHtml(i,place[i],contentNum,grade, bno)  
				}else if(place[i].place_name == dbData[i].bname){	

						place[i].place_name = dbData[i].bname
						place[i].road_address_name = dbData[i].address
						place[i].phone  = dbData[i].phone
						var contentNum = dbData[i].content
						var grade = dbData[i].grade
						var bno = dbData[i].bno
						wirteHtml(i,place[i],contentNum,grade, bno)  
	        	}
				
				
           }
        
           function wirteHtml(i,place ,contentNum, grade, bno) { 
        	   
        	   var el = document.createElement('table'),               
	               itemStr =  '<tbody class="place_body">'
	                     +'<tr>'
                              + '<td class="place_name" value='+bno+'>'+ (i+1)+'&nbsp;&nbsp;' + place.place_name + '</td>'
                         + '</tr>'
                            if(grade != 0){
                                  itemStr += '<tr><td>'+grade+'.0 &nbsp;'
                                             for(var i=0; i<grade; i++) {
                                                 itemStr += '<i class="rating__icon rating__icon--star fa fa-star"></i>'
                                             }
                                             for(var i=0; i<(5-grade); i++) {
                                                 itemStr += '<i class="rating__icon rating__icon--star2 fa fa-star" sytle="color:lightgray"></i>'
                                             }
                                   itemStr +='&nbsp;&nbsp;'+contentNum+'건 | 리뷰</td></tr>'
                             }
                         itemStr += '<tr><td class="place_address">' + place.road_address_name + '</td></tr>'                                
                                  if(place.phone!=""){
                                     itemStr += '<tr><td class="place_phone">' +place.phone + '</td><tr>'
                                  }                      
                         +'</tbody>';
	               el.innerHTML = itemStr;
	               el.className = 'item';

	  	     	   itemel =  el;                  
				}
	
        	
        	
           function displayPagination(pagination) {
               var paginationEl = document.getElementById('pagination'),
                   fragment = document.createDocumentFragment(),
                   i; 
   
               $(paginationEl).show()
               // 기존에 추가된 페이지번호를 삭제합니다
               while (paginationEl.hasChildNodes()) {
                   paginationEl.removeChild (paginationEl.lastChild);
               }
   
               for (i=1; i<=pagination.last; i++) {
                   var el = document.createElement('a');
                   el.href = "#";
                   el.innerHTML = i;
   
                   if (i===pagination.current) {
                       el.className = 'on';
                   } else {
                       el.onclick = (function(i) {
                           return function() {
                               pagination.gotoPage(i);
                           }
                       })(i);
                   }
   
                   fragment.appendChild(el);
               }
               paginationEl.appendChild(fragment);
           }
   
           // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
           // 인포윈도우에 장소명을 표시합니다
           function displayInfowindow(marker, title) {
               var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
   
               infowindow.setContent(content);
               infowindow.open(map, marker);
           }
   
           // 검색결과 목록의 자식 Element를 제거하는 함수입니다
           function removeAllChildNods(el) {   
               while (el.hasChildNodes()) {
                   el.removeChild (el.lastChild);
               }
           }
           
         //스카이뷰 옵션제어
           function setMapType(maptype) { 
        	    var roadmapControl = document.getElementById('btnRoadmap');
        	    var skyviewControl = document.getElementById('btnSkyview'); 
        	    if (maptype === 'roadmap') {
        	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        	        roadmapControl.className = 'selected_btn_map';
        	        skyviewControl.className = 'btn_sky';
        	    } else {
        	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        	        skyviewControl.className = 'selected_btn';
        	        roadmapControl.className = 'btn';
        	    }
        	}
         
        // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
           function zoomIn() {
               map.setLevel(map.getLevel() - 1);
           }

           // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
           function zoomOut() {
               map.setLevel(map.getLevel() + 1);
           }
        
       </script>
   </html>