package com.itda.ITDA.service;

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
            // 삽입 성공 시 처리할 로직 작성...
            System.out.println("QnA 데이터가 성공적으로 저장되었습니다.");
        } else {
            // 삽입 실패 시 처리할 로직 작성...
            System.out.println("QnA 데이터 저장에 실패하였습니다.");
        }
    }
}
