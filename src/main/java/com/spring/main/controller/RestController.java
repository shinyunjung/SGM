package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.service.MatchService;

@Controller("RestController")
@RequestMapping(value="/rest")
public class RestController {
	
	@Autowired
	MatchService matchService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
}
