package com.erp.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.erp.app.dto.NoticeDTO;

@Repository
public class NoticeDao  {

	@Autowired
	private SqlSessionTemplate session;

	//공지사항 전체 글 select
	public List<NoticeDTO> selectNotice(NoticeDTO notice) {
		//System.out.println("cnt_dao"+notice.getCurPage());
		return session.selectList("notice.selectNotice",notice);
		
	}	
	
	//공지사항 전체 글 수 
	public int selectNoticeCnt(NoticeDTO notice) {
		
		int cnt = session.selectOne("notice.selectNoticeCnt",notice);
		return cnt;
		
	}	
	
	//상세 조회 페이지 
	public NoticeDTO selectNoticeView(int no) {		
		return session.selectOne("notice.selectNoticeView",no);		
	}
	
	//조회수 업데이트
	public int updateCountView(NoticeDTO noticeView) {		
		return session.update("notice.updateCountView",noticeView);		
	}
	

	//상세 조회 페이지 댓글 목록
	public List<NoticeDTO> selectnoticeReqView(int no) {		
		return session.selectList("notice.selectnoticeReqView",no);		
	}
	
	//상세 페이지 댓글 추가
	public int insertNoticeReq(NoticeDTO notice) {
		return session.insert("notice.insertNoticeReq",notice);		
	}
	
	//상세 페이지 댓글 삭제
	public int deleteNoticeReq(NoticeDTO notice) {
		return session.delete("notice.deleteNoticeReq",notice);		
	}
	
	//공지사항 글 저장
	public int updateNoticeSave(NoticeDTO notice) {
		return session.update("notice.updateNoticeSave",notice);		
	}
	
}