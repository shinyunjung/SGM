package com.spring.main.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.main.dto.BannerDto;
import com.spring.main.dto.FileDto;
import com.spring.main.dto.TdDto;

public class UploadFile {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	//파일 업로드
	public Map<String, ArrayList<String>> fileUp(MultipartHttpServletRequest multi){
		ArrayList<String> oldName = new ArrayList<String>();
		ArrayList<String> newName = new ArrayList<String>();
		Map<String, ArrayList<String>> name = new HashMap<String, ArrayList<String>>();
		String newFileName = "";//반환될 파일명
		
		//1.저장경로 찾기
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println(root);
		String path = root+"resources/upload/";
		logger.info(path);
		
		//2.폴더생성
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더없음 생성 시작");
			dir.mkdir();//.mkdirs차이
		}
		
		//3.파일 이름 가져오기
		Iterator<String> fileNames = multi.getFileNames();
		
		while(fileNames.hasNext()){
			//파일 이름 뽑기
			String uploadFileName = fileNames.next();
			logger.info(uploadFileName);
			//파일추출(메모리 저장)
			MultipartFile mFile = multi.getFile(uploadFileName);
			
			//4.파일 만들기
			File file = new File(path);
			String originFileName = mFile.getOriginalFilename();
			
			if(originFileName != null && originFileName!=""){
				if(file.exists()){
					newFileName = System.currentTimeMillis()+"."
							+originFileName.substring(originFileName.lastIndexOf(".")+1);
					logger.info("저장 파일명:{}",newFileName);
					oldName.add(originFileName);
					newName.add(newFileName);
				}
				
				//메모리 -> 실제파일
				try {
					mFile.transferTo(new File(path+newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				oldName.add("");
				newName.add("");
			}
		}
		name.put("oldName", oldName);
		name.put("newName", newName);
		
		return name;
	}
	
	//파일 수정
	public Map<String, ArrayList<String>> fileModify(MultipartHttpServletRequest multi, String[] delName){
		ArrayList<String> oldName = new ArrayList<String>();
		ArrayList<String> newName = new ArrayList<String>();
		Map<String, ArrayList<String>> name = new HashMap<String, ArrayList<String>>();
		String newFileName = "";//반환될 파일명
		int i = 0;
		//1.저장경로 찾기
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println(root);
		String path = root+"resources/upload/";
		logger.info(path);
		
		
		//3.파일 이름 가져오기
		Iterator<String> fileNames = multi.getFileNames();
		
		while(fileNames.hasNext()){
			//파일 이름 뽑기
			String uploadFileName = fileNames.next();
			//파일추출(메모리 저장)
			MultipartFile mFile = multi.getFile(uploadFileName);
			
			//4.파일 만들기
			File file = new File(path);
			String originFileName = mFile.getOriginalFilename();
			
			if(originFileName != null && originFileName!=""){
				path +=delName[i];
				logger.info("삭제"+path);
				if(file.exists()){
					file.delete();
				}else{
					logger.info("이미 삭제된 파일");
				}
				
				if(file.exists()){
					newFileName = System.currentTimeMillis()+"."
							+originFileName.substring(originFileName.lastIndexOf(".")+1);
					logger.info("저장 파일명:{}",newFileName);
					oldName.add(originFileName);
					newName.add(newFileName);
				}
				
				//메모리 -> 실제파일
				try {
					mFile.transferTo(new File(path+newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			name.put("oldName", oldName);
			name.put("newName", newName);
			i++;
			}
		
		return name;
	}
	
	//파일 삭제
	public void delete(String delName) {
		String fullPath = "D:/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SGM/resources/upload/";
		fullPath +=delName;
		logger.info(fullPath);
		File file = new File(fullPath);
		if(file.exists()){
			file.delete();
		}else{
			logger.info("이미 삭제된 파일");
		}
		
	}


}
