package com.kkaekkt.view.map;


import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kkaekkt.biz.map.MapListVO;
import com.kkaekkt.biz.map.MapService;
import com.kkaekkt.biz.map.ResPayVO;
import com.kkaekkt.biz.map.SingleListVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;


@Controller
public class MapListController {
	@Autowired
	MapService mapserv;
	@Autowired
	UserService userService;
	
	    @RequestMapping(value="/showMap.do", method = {RequestMethod.GET, RequestMethod.POST})
	    public String loginView( HttpSession session ,Model model ,int type) throws UnknownHostException {
	    	AccountVO vo = new AccountVO();
	    	
	       if(session.getAttribute("user")==null) {//비 로그인 상태
	          vo.setMtype(0);
	          vo.setMno(0);
	          if(type==1) {
	             vo.setAddress("강동구 천호동");
	          }else {
	             vo.setAddress("강동구 천호동");
	          }
	          
	          model.addAttribute("user", vo);
	       }else { //로그인 상태
	          vo=(AccountVO)session.getAttribute("user");
	          vo=userService.getPerson(vo.getMno());
	          
	          if(type==1) {//일반 세탁소
	        	  
	        	 String address = vo.getAddress(); 

	        	 String[] arrayDong = address.split(",");
	        	 String[] loadaddr = arrayDong[1].split("로");
	        	 String addr = loadaddr[0];
	        	 addr = addr.substring(3,addr.length());
	        	 
	        	 String dong = arrayDong[3].trim();
	        	 dong = dong.substring(1,dong.length()-1);       	 
	        	 addr = addr+","+dong;
	        	 
	        	 System.out.println(addr); 
	        	 vo.setAddress(addr);	        	 
	        	 
	          }else {//코인 세탁소
	        	  
	        	 String address = vo.getAddress(); 

	        	 String[] arrayDong = address.split(",");
	        	 String[] loadaddr = arrayDong[1].split("로");
	        	 String addr = loadaddr[0].trim();
	        	 addr = addr.substring(3,addr.length());
	        	 
	        	 String dong = arrayDong[3].trim();
	        	 dong = dong.substring(1,dong.length()-1);       	 
	        	 addr = addr+","+dong;
	        	 
	        	 System.out.println(addr); 
	        	 vo.setAddress(addr);	

	          }
	          session.setAttribute("user",vo);
	       }
	       return "jsp/searchMap/map.jsp";
	    }
	    
	
		@RequestMapping(value="/maplist.do", method=RequestMethod.POST,produces="application/text;charset=utf-8")   
		public @ResponseBody String maplist(String keyaddr, int type) {
		      String keyword = keyaddr;
		      int mtype = type;
		      System.out.println("ajax 요청 도착!"+keyword+mtype);    
		      AccountVO vo = new AccountVO();
		      vo.setAddress(keyword);
		      vo.setMtype(mtype);
		      
		      List<MapListVO> modelList = mapserv.selectlandry(vo);
		      Gson gson=new Gson();
		      String keylist=gson.toJson(modelList);
		      System.out.println("select 데이터 확인 :" + keylist);
		      return keylist;
		}
	   
		//like Y/N 조회
		@RequestMapping(value="/likeYn.do", method=RequestMethod.POST)
		public @ResponseBody int likeYn(SingleListVO vo) {
			
			System.out.println("like 정보조회   : "+vo); 
			System.out.println("like Y/N  : "+ mapserv.likeYn(vo)); 
			int likeYn = mapserv.likeYn(vo);
			
			return likeYn;
		}
				
		//업체 시간조회
		@RequestMapping(value="/singleTime.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String singleList(int bno) {
			System.out.println("단일 페이지 시간조회  : "+bno); 
			List<SingleListVO>single = mapserv.selectSingle(bno); 
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			
			return singleList; 
		}
	  
		//일반세탁 사양/가격조회
		@RequestMapping(value="/singleOption.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String singleOption(int bno) {
			
			System.out.println("일반세탁 사양조회  : "+bno); 
			List<SingleListVO>single = mapserv.singleOption(bno); 
			
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			
			return singleList; 
		}
		
		
		//회원업체 리뷰 조회
		@RequestMapping(value="/reviewList.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String reviewList(int bno) {
			
			System.out.println("리뷰조회 : "+bno); 
			List<SingleListVO>single = mapserv.reviewList(bno); 
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			
			return singleList; 
		}	
		
		//회원업체 별점별 리뷰조회
		@RequestMapping(value="/reviewListGrade.do",method=RequestMethod.POST,produces="application/text;charset=utf-8")
		public @ResponseBody String reviewListGrade(int bno) {
			System.out.println("리뷰조회 : "+bno); 
			List<SingleListVO>single = mapserv.reviewListGrade(bno); 
			
			Gson gson=new Gson(); 
			String singleList = gson.toJson(single); 
			System.out.println("select 데이터 확인  : "+singleList); 
			
			return singleList; 
		}		
				
		
		//예약 목록 추가 
		@RequestMapping(value="/respay.do",method=RequestMethod.POST)
		@ResponseBody
	  	public int respay(MapListVO mapvo) {
			return mapserv.respay(mapvo);
		}
		
		
}

