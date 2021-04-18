package com.kkaekkt.biz.comm;

public abstract class Criteria {
	private final int PAGES_PER_BLOCK=5;//한 블럭당 들어갈 페이지 개수
	private final int POSTS_PER_PAGE=5;//한 페이지당 보여줄 Post 개수
	protected int totalPostCount; //총 Post 개수
	private int totalLastPageNum; // 마지막 페이지 번호
	protected int currentPageNum=1;//현재 페이지 번호 (Default=1)
	private int blockLastPageNum;//한 블럭에서 마지막 페이지 번호  
	private int blockFirstPageNum;//한 블럭에서 첫번째 페이지 번호
	private int rowStartNum=0; //시작 행 번호 (Default=0) ex) 2페이지 -> 5
	private boolean isPrevExist=false;//이전 페이지가 존재하는가(Default=false)
	private boolean isNextExist;//다음 페이지가 존재하는가
	private boolean isPrevBlockExist=false;//이전 페이지블럭이 존재하는가(Default=false)
	private boolean isNextBlockExist;//다음 페이지블럭이 존재하는가
	
	public void setTotalLastPageNum(int totalLastPageNum) {
		this.totalLastPageNum = totalLastPageNum;
	}
	public int getTotalPostCount() {
		return totalPostCount;
	}
	public void setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
		if(totalPostCount==0) {
			totalLastPageNum=0;
		} else {
			totalLastPageNum=(int) Math.ceil((double) totalPostCount / POSTS_PER_PAGE);
		}
	}
	public int getCurrentPageNum() {
		return currentPageNum;
	}
	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
		rowStartNum=(currentPageNum-1)*POSTS_PER_PAGE;
	}
	public int getRowStartNum() {
		return rowStartNum;
	}
	public void setRowStartNum(int rowStartNum) {
		this.rowStartNum = rowStartNum;
	}
	public int getPOSTS_PER_PAGE() {
		return POSTS_PER_PAGE;
	}
	public void booleanSet() {
		if((totalLastPageNum - totalLastPageNum % PAGES_PER_BLOCK) >= currentPageNum) {
			blockLastPageNum=(int)(Math.ceil((float)currentPageNum / PAGES_PER_BLOCK)*PAGES_PER_BLOCK);
			blockFirstPageNum=blockLastPageNum-(PAGES_PER_BLOCK-1);
		} else {
			blockLastPageNum=totalLastPageNum;
			blockFirstPageNum = (int) (Math.ceil((float)currentPageNum / PAGES_PER_BLOCK) * PAGES_PER_BLOCK)-(PAGES_PER_BLOCK - 1);
		}
		if(currentPageNum==totalLastPageNum) {
			isNextExist=false;
			isNextBlockExist=false;
		} else if(blockLastPageNum<totalLastPageNum) {
			isNextExist=true;
			isNextBlockExist=true;
		} else {
			isNextExist=true;
			isNextBlockExist=false;
		}
		if(currentPageNum!=1) {
			isPrevExist=true;
			if(blockFirstPageNum!=1) {
				isPrevBlockExist=true;
			} else {
				isPrevBlockExist=false;
			}
		}else {
			isPrevExist=false;
			isPrevBlockExist=false;
		}
	}	
}
