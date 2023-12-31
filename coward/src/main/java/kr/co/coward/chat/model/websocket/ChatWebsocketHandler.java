package kr.co.coward.chat.model.websocket;

import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.co.coward.chat.model.service.ChatService;
import kr.co.coward.chat.model.vo.ChatMessage;

public class ChatWebsocketHandler extends TextWebSocketHandler {

	@Autowired
	private ChatService service;

	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	// 클라이언트와 연결이 완료되고, 통신할 준비가 되면 수행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// WebSocketSession : 웹소켓에 접속/요청한 클라이언트의 세션
		System.out.println(session.getId() + " 연결됨"); // 세션 아이디 확인

		sessions.add(session);
		// WebSocketSession을 Set에 추가
	}

	// 클라이언트로 부터 텍스트 메세지를 전달 받았을 때 수행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// TextMessage : 웹소켓을 이용해 텍스트로 전달된 메세지가 담겨있는 객체

		// payload : 전송되는 데이터

		// message.getPayload() : JSON

		System.out.println("전달된 메세지 : " + message.getPayload());

		// Jackson 라이브러리 : Java에서 JSON을 다루기 위한 라이브러리

		// Jackson-databind 라이브러리 :
		// ObjectMapper 객체를 이용해서
		// JSON 데이터를 특정 VO 필드에 맞게 자동 매핑

		ObjectMapper objectMapper = new ObjectMapper();

		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);

		// 시간 세팅
		chatMessage.setCreateDate(new Date(System.currentTimeMillis()));

		System.out.println(chatMessage);

		// 채팅 메세지 DB 삽입
		int result = service.insertMessage(chatMessage);

		if (result > 0) {

			// 같은 방에 접속 중인 클라이언트에게만 메세지 보내기
			// -> Set<WebSocketSession>에서 같은방 클라이언트만 골라내기

			for (WebSocketSession s : sessions) {

				// WebSocketSession == HttpSession(로그인정보, 채팅방번호)을 가로챈 것
				int chatRoomNo = (Integer) s.getAttributes().get("chatRoomNo");

				// int memberNo = ((Member)s.getAttributes().get("loginMember")).getMemberNo() ;

				// 메세지에 담겨있는 채팅방 번호와
				// WebSocketSession에 담겨있는 채팅방 번호가 같을 경우
				// == 같은방 클라이언트
				if (chatMessage.getChatRoomNo() == chatRoomNo) {

					// 같은방 클라이언트에게 JSON형식 메세지를 보냄
//						s.sendMessage( new TextMessage(message.getPayload()) );

					s.sendMessage(new TextMessage(new Gson().toJson(chatMessage)));
				}
			}
		}

	}

	// 클라이언트와 연결이 종료되면 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		sessions.remove(session);
		// 웹소켓 연결이 종료되는 경우
		// 종료된 WebSocketSession을 Set에서 제거

	}

}
