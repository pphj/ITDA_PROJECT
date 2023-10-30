package com.itda.ITDA.domain;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NaverDTO {
	    private String name;
	    private String email;
	    private String nickname;
	    private String gender;
	    private String age;
	    private String phone;

@Getter
    private String access_token;
}