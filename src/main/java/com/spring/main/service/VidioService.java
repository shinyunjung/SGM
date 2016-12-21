package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.BoardInterface;
import com.spring.main.dto.vidioDTO;

@Service
public class VidioService {

	@Autowired SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	Map<String, String> fileList = new HashMap<String, String>();
	
	BoardInterface inter = null;

	public static Map<String, Object> listCall(Map<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}

	public static Map<String, Object> search(Map<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}

	public static Map<String, Object> searchCall(Map<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}
}
