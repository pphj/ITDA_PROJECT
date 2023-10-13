package com.itda.ITDA.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.itda.ITDA.service.adminService;
import com.itda.ITDA.util.CommonSource;


@Service
public class UserTotalCheck {
	private static final Logger logger = LoggerFactory.getLogger(UserTotalCheck.class);
	
	@Autowired
	private adminService adminService;
	
	@Autowired
	public UserTotalCheck(adminService adminService) {
		this.adminService = adminService;
	}
	
	@Scheduled(cron="0 0 10 * * *")	//매일 오전 10시 1회
	public void getUserTotal() throws Exception {
		logger.info("getUserTotal");
		
		int dailyUserTotal = adminService.getUserTotal();
		
		int result = adminService.userTotalInsert(dailyUserTotal);
		
		if (result == CommonSource.FAIL) {
			logger.info("총 유저수 수집 실패");
		}else {
			logger.info("총 유저수 수집 성공");
		}
	}
	
	
	
}
