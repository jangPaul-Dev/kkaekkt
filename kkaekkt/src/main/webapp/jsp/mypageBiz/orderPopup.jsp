<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fmt:parseNumber var="eaPrice" value=${laundryitem.price/laundryitem.count} integerOnly="true" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장관리</title>
<link rel="stylesheet" href="/css/all.css">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<style>
h2 {
    text-align: center;
}
hr{
    width: 90%;
}
#popup{
    width: 500px;
    height: 580px;
    clear: both;
    color: var(--text-gray);
    margin: 0;
}
#laundryList{
    margin-left: 30px;
}
#laundryList td {
    width: 90px;
    text-align: center;
}
#item{
    width: 110px;
    padding-right: 35px;
}
#priceBox{
    width: 500px;
    height: 30px;
    font-size: 22px;
}
#priceBox li{
    list-style: none;
    float: left;
}
#totalprice{
    margin: 0 200px 20px 80px;
}
#textColor{
    color: var(--key-text);
}
#rsvInfo{
    margin-left: 30px;
}
#rsvInfo th{
    width: 120px;
    text-align: left;
}
#btnPrint{
    clear: both;
    border: none;
    outline: none;
    background: none;
    margin-top: 10px;
    margin-left: 10px;
}
.fas{
    font-size: 25px;
}
#closePopup{
    background: var(--key-color);
    border-radius: 23px;
    border: none;
    width: 99px;
    height: 42px;
    color: var(--black-color);
    margin-left: 210px;
    margin-top: 30px;
}
</style>
    <script>

    function printPage() {
        window.print(); 
       
    }
    window.onload = function(){
        let address = document.getElementById("address").innerText.replaceAll(',', " ");
        console.log(address);
        document.getElementById("address").innerText = address;
    }


    
</script>

<body>
    <div id="popup">
    <button id="btnPrint" onClick="printPage()"><i class="fas fa-print"></i></button>
	<h2>주문전표인쇄</h2>
    <hr> 
    
    <table id="laundryList">
        <tr>
            <th id="item">품 목</th>
            <th>단 가</th>
            <th>수 량</th>
            <th>금 액</th>
        </tr>
      <c:set var="price" value="0" />
      <c:forEach var="laundryitem" items="${rsv.laundryList}">
        <tr>
            <td id="item">${laundryitem.laundry}</td>
            <td id="itemPrice">${laundryitem.price}</td>
            <td id="cnt">${laundryitem.count}</td>
            <td id="price">${laundryitem.price*laundryitem.count}</td>
            <c:set var="price" value="${price + (laundryitem.price*laundryitem.count)}" />
        </tr>      
    </c:forEach>
    </table>
    <hr>
    <div id="priceBox">
        <ul>
        <li id="totalprice">총 금액</li>
        
            <li><span id="textColor"><c:out value="${price}"/></span> 원</li>
    
        </ul>
    </div>      
 
    
    <hr>
    <table id="rsvInfo">
        <tr>
            <th>주문일시</th>
            <td>${rsv.rsvDate}</td>
        </tr>
        <tr>
            <th>주문번호</th>
            <td>${rsv.rsvNum}</td>
        </tr>
        <tr>
            <th>주문자명</th>
            <td>${rsv.mname}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${rsv.phone}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td id="address">${rsv.address}</td>
        </tr>
    </table>
            <button id="closePopup" onclick="window.close()">확인</button>
    </div>

</body>
</html>