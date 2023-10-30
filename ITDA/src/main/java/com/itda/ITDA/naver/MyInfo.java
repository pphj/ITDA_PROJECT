package com.itda.ITDA.naver;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class MyInfo {
	public static String clientId = "rcyeX4m7t_YVfke5Wd6Y";
	public static String clientSecret = "q9GUDfMVhT";
	public static String callbackUrl = "http://localhost:9400/itda/member/callback";
}
