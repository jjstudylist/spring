package com.erp.app.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.erp.app.dto.NoticeDTO;
import com.erp.app.dto.TourDTO;

@Repository
public class TourDao  {

	@Autowired
	private SqlSessionTemplate session;

	//공지사항 전체 글 select 
	public List<TourDTO> selectTourList(TourDTO tour) {
		//System.out.println("cnt_dao"+notice.getCurPage());
		return session.selectList("tour.selectTourList",tour);
		
	}	
	//투어 가능 날짜
	public List<TourDTO> selectEnableDate(TourDTO tour) {
		//System.out.println("cnt_dao"+notice.getCurPage());
		return session.selectList("tour.selectEnableDate",tour);		
	}	
	
	//해당 날짜에 대한 가능 좌석
	public List<TourDTO> selectViewSeats(TourDTO tour) {
		return session.selectList("tour.selectViewSeats",tour);
	}
	
	//선택좌석 이용가능한지 확인 
	public TourDTO selectSeatCheck(TourDTO tour) {
		return session.selectOne("tour.selectSeatCheck",tour);
	}
	//해당좌석 order_type 업데이트
	public void updateOrederType(TourDTO tour) {
		session.update("tour.updateOrederType",tour);
	}
	//결제
	public void insertOrder(TourDTO tour) {
		session.insert("tour.insertOrder",tour);
	}
}