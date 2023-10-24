package com.itda.ITDA.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WCATEGORY {
	private int warnCateId;			//신고 카테번호
	private String warnCateName;	//신고명
}
