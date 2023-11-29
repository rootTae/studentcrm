package org.studentcrm.crm.controller;

import java.time.LocalDate;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.studentcrm.crm.command.P_InformationVO;
import org.studentcrm.crm.service.PaymentService;



import lombok.extern.log4j.Log4j2;

@RequestMapping("/paymentI/*")
@RestController
@Log4j2
public class PaymentRestController {

	
	@Autowired
	private PaymentService pService;
	

	
	//리스트 가져요기
	@PostMapping(value = "/getlist",
			produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<P_InformationVO>> getPaymentList(@RequestBody P_InformationVO vo){		
		return new ResponseEntity<List<P_InformationVO>>(pService.getPaymentList(vo), HttpStatus.OK);
	}

	//추가
	@PostMapping(value = "/newPayment",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertPayment(@RequestBody P_InformationVO vo){	
		int result =pService.pRegister(vo);
		return result == 1 ?
				new ResponseEntity<>("등록 성공" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	//수정
	@RequestMapping(method = {RequestMethod.PUT , RequestMethod.PATCH},
			value ="/{p_id}",
			consumes = "application/json",
	        produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> paymentModify(
			@RequestBody P_InformationVO vo,
			@PathVariable("p_id") int p_id){			
		return pService.pModify(vo)==1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	//삭제
	@DeleteMapping(value ="/{p_id}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> paymentRemove(@PathVariable("p_id") int p_id){
		return pService.pRemove(p_id)==1
		? new ResponseEntity<String>("success",HttpStatus.OK)
		:new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	
	
	
	
	
}
