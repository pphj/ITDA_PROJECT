package com.itda.ITDA.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.mybatis.mapper.adMemberMapper;

@Service
public class InfoServiceImpl implements InfoService {

    private adMemberMapper adMemberMapper;

    @Autowired
    public InfoServiceImpl(adMemberMapper adMemberMapper) {
        this.adMemberMapper = adMemberMapper;
    }

    @Override
    public void insertQna(AdminBoard adminBoard) {
        // QnA 데이터 저장 로직 구현
        
        // 매퍼 인터페이스의 insertQna() 메서드를 호출하여 QnA 데이터를 DB에 삽입합니다.
        int result = adMemberMapper.insertQna(adminBoard);
        
        if (result > 0) {
            System.out.println("QnA 데이터가 성공적으로 저장되었습니다.");
        } else {
            System.out.println("QnA 데이터 저장에 실패하였습니다.");
        }
    }



    @Override
    public List<AdminBoard> getAdminBoardList() {
        // ADMINBOARD 테이블의 데이터를 조회하는 로직을 구현합니다.
        List<AdminBoard> adminBoardList = new ArrayList<>();
        
        // 여기에 실제 데이터베이스에서 ADMINBOARD 테이블의 데이터를 조회하는 로직을 작성합니다.
        adminBoardList = adMemberMapper.getAdminBoardList();  // 실제 데이터베이스 조회 코드
        
        return adminBoardList;
    }

	@Override
	public List<AdminBoard> getQnaAdminBoardList() {
		 // ADMINBOARD 테이블의 데이터를 조회하는 로직을 구현합니다.
        List<AdminBoard> qnaAdminBoardList = new ArrayList<>();
        
        // 여기에 실제 데이터베이스에서 ADMINBOARD 테이블의 데이터를 조회하는 로직을 작성합니다.
        qnaAdminBoardList = adMemberMapper.getQnaAdminBoardList();  
        
        return qnaAdminBoardList;
	}

	@Override
	public AdminBoard getAdminBoardByUserId(int userId) {
	    return adMemberMapper.getAdminBoardByUserId(userId);
	}

	@Override
	public AdminBoard getAdminBoardByAdNum(int adNum) {
		return adMemberMapper.getAdminBoardByAdNum(adNum);
	}
	
	//페이지네이션 처리 메서드
	@Override
	public int getAdminBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AdminBoard> getAdminBoardListByPage(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}


	

}
