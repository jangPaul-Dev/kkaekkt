package com.kkaekkt.util.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kkaekkt.biz.user.AccountVO;
import com.mysql.cj.util.StringUtils;

public class EchoHandler extends TextWebSocketHandler {
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("서버에 접속 성공했을 때 접근");
		sessions.add(session);
		String mno = getMno(session);
		userSessionsMap.put(mno, session);
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메시지 수신");
		//protocol : mno , 내용
		String msg = message.getPayload();
		//System.out.println(msg); 메시지 로그
		if(!StringUtils.isNullOrEmpty(msg)) {
				String msgType=msg.substring(0,1);//맨 처음 메시지 타입넘버를 받는다. 0=알림, 1=채팅
				int msgIndex=msg.indexOf("msg:"); // msg: 태그의 인덱스를 추출한다.
				String mno=msg.substring(1,msgIndex);// 메시지 타입넘버와 msg: 태그 사이에 위치한 받는 이의 번호를 추출한다.
				String content=msg.substring(msgIndex+4);//msg: 이후부터 담긴 내용을 전부 입력한다.
				//작성자가 로그인 해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(mno);
				if(boardWriterSession != null) {//작성자가 세션에 있다면, 
					TextMessage sendMsg = new TextMessage(msgType+content);
					boardWriterSession.sendMessage(sendMsg);// 메시지를 보낸다.
			}
		}
	}
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("소켓 닫음");
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getMno(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		AccountVO loginUser = (AccountVO)httpSession.get("user");
		System.out.println(loginUser.getMno()+":회원번호 출력 체크");
		if(loginUser != null) {
			return loginUser.getMno()+"";//mno를 String으로 형변환해서 전달
		}else {//로그인 정보를 찾지 못했으면 sessionId를 반환
			return session.getId();
		}
	}
}