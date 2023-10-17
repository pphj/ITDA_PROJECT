package com.itda.ITDA.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class UserCategory {
	private int usercateNum;
	private String userId;
	private int cate_Id;
	private int boardNum;
}
