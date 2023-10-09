package com.itda.ITDA.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateService {
	
	public static String toDayTime() {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = currentDate.format(formatter);
        return formattedDate;
    }

        public static String toDay() {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        return formattedDate;
    }

}
