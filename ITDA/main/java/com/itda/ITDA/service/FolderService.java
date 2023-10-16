package com.itda.ITDA.service;

import java.io.File;

public class FolderService {
	
	 public static void createFolder(String targetFolder) {
		 File makeChFolder = new File(targetFolder);
		    if (!makeChFolder.exists()) {
		        try {
		            boolean result = makeChFolder.mkdir();
		            if (result) {
		                System.out.println("디렉토리 생성 성공: " + targetFolder);
		            } else {
		                System.out.println("디렉토리 생성 실패: " + targetFolder);
		            }
		        } catch (Exception e) {
		            System.out.println("디렉토리 생성 중 오류 발생: " + e.getMessage());
		            e.printStackTrace();
		        }
		    } else {
		        System.out.println("디렉토리 이미 존재: " + targetFolder);
		    }
	 }
}