package com.web.hulklogic.service.Impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.UpdateIssueBo;
import com.web.hulklogic.dao.UpdateIssucesDAO;
import com.web.hulklogic.dto.UpdateIssueDto;
import com.web.hulklogic.service.UpdateStatusService;

@Service
public class UpdateStatusServiceImpl implements  UpdateStatusService{
	@Resource
	private UpdateIssucesDAO  dao;
     public String updateIssuceStatus(UpdateIssueDto dto) {
    	UpdateIssueBo bo=null;
		bo=new UpdateIssueBo();
		bo.setUpdatedemail(dto.getUpdatedEmail());
		bo.setIssuemessage(dto.getIssueMessage());
		bo.setIssueId(dto.getIssueId());
		bo.setIssueStatus(dto.getIssueStatus());
		int count=dao.updateIssuce(bo);
		if(count==0){
			return "fail";}
		
		else{
			return "success";
		}
		
     }
	public boolean isvalidEmail(String email) {
	  if(dao.isvalidEmail(email)>0){
			return true;
		}else
		return false;
	}
	public List<String> getAllEmail() {
		return dao.getAllEmails();
	}
	@Override
	public int enableUser(String email) {
		return dao.enableUser(email);
	}
}
