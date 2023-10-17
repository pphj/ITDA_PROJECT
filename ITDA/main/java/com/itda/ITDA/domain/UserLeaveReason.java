package com.itda.ITDA.domain;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.TIMESTAMP;

@Getter
@Setter
// 유저 탈퇴 관련 도메인
public class UserLeaveReason {
    // 테이블 명 : userleavereason
	private String userId;				// 유저 아이디		
    private String userLeaveReason;		// 탈퇴 사유 : 기타 선택 시 입력 내용
    private TIMESTAMP creDate;			// 생성일
    
    // 테이블 명 : leaveReasoncategory
    private int leaveReason_id;			// 탈퇴 사유 카테고리 번호
    private String leaveReason_name;	// 탈퇴 카테고리 내용

}
