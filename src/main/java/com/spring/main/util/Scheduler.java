package com.spring.main.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	//초 분 시 일 월 요일 년도(생략가능)
	@Scheduled(cron="0 0 0 * * *")//fixedRate="mils", fixedDelay="mils"
	public void loop(){
		System.out.println("10초 마다 찍는다.");
	}
}
