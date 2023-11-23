package org.studentcrm.crm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.studentcrm.crm.command.ImageAttachFileDTO;
import org.studentcrm.crm.command.TeacherImageAttachFileDTO;

import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
public class TeacherUploadController {
	
	//Ajax 파일 전달
	//연/월/일 폴더 생성을 위한 함수 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	
	//이미지 여부를 판별하는 메서드
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath()); //파일을 읽었을 때 그 타입이 뭔지 출력해 준다
			//log.info("현재 파일의 타입 : "+contentType);
			
			return  contentType.startsWith("image"); //이미지라면 true 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	//처리한 데이터를 json방식으로 전달해준다
	@PostMapping(value="/teacherImgupload",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody //비동기 통신
	public ResponseEntity<TeacherImageAttachFileDTO> teacherImgupload(MultipartFile uploadFile) { 
		//비동기 통신이라 뷰에게 데이터를 전달하는 model은 필요하지 않다.
		//ResponseEntity : 데이터를 전달, 여러개의 객체를 전달해야 하니까 List로 전달
		
		//반환할 DTO 만드는 순서 1. ~ 8.
		//1. List 생성
		TeacherImageAttachFileDTO tImgFileDTO = new TeacherImageAttachFileDTO();
		
		//log.info("update ajax post 동작");
		String uploadFolder = "C:/upload";
		
		//2. 경로 정보를 얻기 위한 메서드 구현
		String uploadFolderPath = getFolder(); //년월일 폴더 생성
		
		//년월일 폴더 생성
//		File uploadPath = new File(uploadFolder, getFolder());
		File uploadPath = new File(uploadFolder, uploadFolderPath);
//		log.info("upload Path : "+uploadPath);
		
		if(uploadPath.exists() == false) { //폴더가 없다면 
			uploadPath.mkdirs();//해당 경로까지의 폴더들을 생성
		}
		
		//for(MultipartFile multipartFile: uploadFile) {
//			log.info("---------------");
//			log.info("Upload Files Name: "+uplosadFile.getOriginalFilename());
//			log.info("Upload Files Size: "+uploadFile.getSize());
			
			//AttachFileDTO가 for 안에서 만들어져야 한다. 파일 하나하나마다 만들어져야 하기 때문에
			//3. AttachFileDTO 객체 생성
			TeacherImageAttachFileDTO attachFileDTO = new TeacherImageAttachFileDTO();
			
			String uploadFileName = uploadFile.getOriginalFilename();
			
			//4. AttachFileDTO에 fileName 추가
			attachFileDTO.setFileName(uploadFileName);
			
			//파일 이름 작업 : UUID 사용
			UUID uuid = UUID.randomUUID();//랜덤 uuid 생성
			uploadFileName = uuid.toString()+"_"+uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				uploadFile.transferTo(saveFile); //파일로 저장하는 부분
				
				//5. AttachFileDTO에 uuid와 uploadPath 추가
				attachFileDTO.setUuid(uuid.toString());
				attachFileDTO.setUploadPath(uploadFolderPath);
				//log.info("---------------"+attachFileDTO.getUploadPath()+"----------------");
				//check imageType file(썸네일 확인 후 처리하기) - 파일을 저장한 후 저장한 파일을 불러와서 타입을 확인해야 한다
				if(checkImageType(saveFile)) {
					//log.info("이미지 파일입니다.");
					//6. AttachFileDTO에 image 여부 추가
					attachFileDTO.setImage(true);
					//log.info("------>>>>uploadPath : "+uploadPath);
					
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_"+uploadFileName));//썸네일이라는걸 표시하기 위해 s_를 붙여준다.
					Thumbnailator.createThumbnail(
							uploadFile.getInputStream(),//inputStream
							thumbnail,//outputStream
							240,//사이즈 가로, 세로
							263);
					thumbnail.close();
				}
				//log.info("------>>>>attachFileDTO : "+attachFileDTO);
				
				//7. add to list
				tImgFileDTO = attachFileDTO;
				
			} catch (Exception e) {
				log.error("error message : "+e.getMessage());
			}
		//}// end for
//		log.info("=================");
//		log.info(imgFileDTO);
//		log.info("=================");
		//8. ResponseEntity 타입 반환
		return new ResponseEntity<>(tImgFileDTO, HttpStatus.OK);
	}
	
	//썸네일 이미지 매핑을 위한 메서드
	@GetMapping("/teacherDisplay")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){ 
		//byte[] : 데이터를 전달한다는 의미. 이미지는 바이너리 데이터 
		//log.info("fileName: " + fileName);
		
		File file = new File("c:/upload/"+fileName);
		//log.info("file: "+file);
		ResponseEntity<byte[]> result = null; //반환 값으로 전달할 값을 담을 빈 객체
		
		try {
			HttpHeaders headers = new HttpHeaders(); //HttpHeaders : Spring
			
			//headers에는 전달하고 싶은 원하는 값이 있다면 여러개를 넣어도 된다.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));//Content-Type에 파일 타입을 넣음. 여기서는 이미지 데이터 타입
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					headers, 
					HttpStatus.OK);
			//FileCopyUtils.copyToByteArray(file) : 전달할 데이터
			//copyToByteArray : 데이터를 바이트 타입으로 그대로 전달
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//deleteFile - 썸네일 옆의 x버튼 눌러서 첨부파일 삭제
	@PostMapping("/deleteTecherFile")
	@ResponseBody
	public ResponseEntity<String> deleteTecherFile(String fileName, String type){
		//log.info("deleteFile: " + fileName);
		
		File file;
		
		try {
			//바이너리 데이터로 인코딩 된 파일을 디코딩 해준다.
			file = new File("c:/upload/"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();//썸네일 삭제
			
			if(type.equals("image")) {//원본 파일 삭제
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				//log.info("largeFileName : "+largeFileName);
				
				file = new File(largeFileName);
				file.delete();//원본 파일 삭제
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
