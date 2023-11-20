package org.studentcrm.crm.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.CommuteVO;
import org.studentcrm.crm.command.ImageAttachVO;
import org.studentcrm.crm.command.RegisterVO;
import org.studentcrm.crm.command.StudentVO;
import org.studentcrm.crm.service.CommuteService;
import org.studentcrm.crm.service.StudentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/studentRest")
@Log4j2
public class StudentRestController {
	@Setter(onMethod_ = {@Autowired})
	StudentService sService;
	
	@Setter(onMethod_ = {@Autowired})
	CommuteService cService;
	
	//============== 학생 정보 검색 ===============
	
	//학생 학번으로 검색(1개만 출력)
	@GetMapping(value = "/id/{s_id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<StudentVO> getStudent(@PathVariable("s_id") int s_id) {
		StudentVO vo = sService.getStudent(s_id);
		return new ResponseEntity<StudentVO>(vo, HttpStatus.OK);
	}
	
	//학생 이름으로 검색(리스트로 출력)
	@GetMapping(value = "/name/{s_name}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<StudentVO>> getStudent(@PathVariable("s_name") String s_name) {
	    //log.info("s_name---------- : " +s_name);
	    //System.out.print("fffffffffffffffffffffffffffff");
	    return new ResponseEntity<List<StudentVO>>(sService.getStudentName(s_name), HttpStatus.OK);
	}

	
	
	//============== 학생 정보 수정 ===============
	
	//학생 정보 추가
	@PostMapping(value="/insert",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertStudent(@RequestBody StudentVO vo){
		//log.info("학생 정보 추가~~~ "+vo);
		int result = sService.insertStudent(vo);
		
		//자동증가된 s_id 반환(통학 정보에서 사용)
		int s_id = sService.getLastId();
		//log.info("컨트롤러의 s_id : "+s_id);
		
		//log.info("==================================================");
		//등록내용 확인
		//log.info("register : "+vo);
		
		//log.info("이미지 데이터 >>>>>>"+ vo.getAttachImg());
		if(vo.getAttachImg() != null) {
			log.info("첨부한 이미지가 있음!!!!");
			vo.getAttachImg();
		}
		
		//log.info("==================================================");
		//log.info("result : "+result);
		return result == 1 ?
				new ResponseEntity<>(String.valueOf(s_id), HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//학생 정보 삭제
	@DeleteMapping(value="/delete/{s_id}",
			produces={MediaType.TEXT_PLAIN_VALUE}) //숫자를 넘길거라서 plain_value
	public ResponseEntity<String> deleteStudent(@PathVariable("s_id") int s_id){
		
		//1. 게시글 참조 파일 목록
		ImageAttachVO attachImg = sService.getAttachImg(s_id);
		//2. 게시글 삭제 - DB에서 삭제
		int result = sService.deleteStudent(s_id);
		if(result == 1) {//첨부파일 삭제가 되면 게시글 삭제
			//System.out.println("첨부파일이 삭제 됨");
			//3. 파일 삭제 - 실제 파일 삭제
			deleteFiles(attachImg);
		}; 
		
		return result == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//학생 정보 수정
	@PostMapping(value="/update/{s_id}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateStudent(
			@RequestBody StudentVO vo,
			@PathVariable("s_id") int s_id){
		//log.info(vo.getAttachImg());
		
		//log.info("첨부 이미지 정보 : "+vo.getAttachImg());
		
		vo.setS_id(s_id);
		int result = sService.updateStudent(vo);
		//log.info("update : "+vo);
		return result == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//============== 학생 통학 정보 ===============
	
	//통학 정보 출력
	@GetMapping(value = "/commute/{s_id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CommuteVO> getCommute(@PathVariable("s_id") int s_id) {
		CommuteVO vo = cService.getCommute(s_id);
		return new ResponseEntity<CommuteVO>(vo, HttpStatus.OK);
	}
	
	//통학 정보 추가
	@PostMapping(value="/insertC",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertCommute(@RequestBody CommuteVO vo){
		int result = cService.insertCommute(vo);
		return result == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//통학 정보 수정
	@PostMapping(value="/updateC/{s_id}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateCommute(
			@RequestBody CommuteVO vo,
			@PathVariable("s_id") int s_id){
		//vo.setS_id(s_id);
		log.info("통학정보 >>>>>>>>");
		log.info(s_id);
		int result = cService.updateCommute(vo);
		return result == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//통학 정보 삭제
	@DeleteMapping(value="/deleteC/{s_id}",
			produces={MediaType.TEXT_PLAIN_VALUE}) //숫자를 넘길거라서 plain_value
	public ResponseEntity<String> deleteCommute(@PathVariable("s_id") int s_id){
		//log.info("delete : "+s_id);
		return cService.deleteCommute(s_id) == 1
				?new ResponseEntity<String>("success", HttpStatus.OK)
				:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	//============== 학생 사진 업로드 ===============
	//게시글 번호에 맞는 첨부파일 리스트로 가져오기
	@GetMapping(value="/getAttachImg", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageAttachVO> getAttachImg(int s_id){
		//log.info("get Attach s_id : "+s_id);
		//log.info("학생 정보 검색해서 가져온 첨부파일 정보============");
		//log.info("get Attach : "+sService.getAttachImg(s_id));
		return new ResponseEntity<>(sService.getAttachImg(s_id), HttpStatus.OK);
	}
	
	//첨부 파일 삭제
	private void deleteFiles(ImageAttachVO attachImg) {
		//첨부파일이 있는지 확인
		if(attachImg == null) {
			//System.out.println("첨부된 파일 없음");
			return;
		}
		
		//log.info("delete attach files : ");
		//log.info(attachImg);
		
		try {
			Path file = Paths.get("C:/upload/"+attachImg.getUploadPath()+"\\"
					+attachImg.getUuid()+"_"+attachImg.getFileName());
			//해당 파일이 존재하면 삭제
			Files.deleteIfExists(file);//java.nio.Files
			
			if(Files.probeContentType(file).startsWith("image")) {
				Path thumbnail = Paths.get("C:/upload/"+attachImg.getUploadPath()+
						"/s_"+attachImg.getUuid()+"_"+attachImg.getFileName());
				//썸네일 이미지 파일 삭제
				Files.deleteIfExists(thumbnail);
			}
		} catch (Exception e) {
			log.error("delete file error :"+e.getMessage());
		}
		
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//============== 학급 정보 ===============
	
//	//검색한 학생 id에 해당하는 모든 학급 정보 가져오기
//	@GetMapping(value="/getClassInfo/{s_id}",
//			produces={MediaType.APPLICATION_JSON_VALUE})//produces는 받는 값, 보낼 값의 형식을 설정해준다. 리스트를 넘길 때는 JSON이나 xml로 변환해서 넘겨야 한다.
//	public ResponseEntity<List<RegisterVO>> getClassInfoList(@PathVariable("s_id") int s_id){
////		log.info("=======");
////		log.info("studentId : ");
////		log.info(s_id);
////		log.info(sService.getClassInfo(s_id));
////		log.info("=======");
//		//log.info(new ResponseEntity<List<RegisterVO>>(sService.getClassInfo(s_id), HttpStatus.OK));
//		//log.info("=======");
//		return new ResponseEntity<>(sService.getClassInfo(s_id), HttpStatus.OK);
//	}
	
	
	
}
