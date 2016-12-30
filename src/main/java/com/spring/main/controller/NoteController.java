package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.ManagerService;
import com.spring.main.service.NoteService;

@Controller("NoteController")
@RequestMapping(value="/note")
public class NoteController {
	@Autowired
	NoteService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/msgPage")
	public ModelAndView msgPage(@RequestParam("t_idx") String t_idx) {
		
		return service.msgPage(t_idx);
	}
	
}
