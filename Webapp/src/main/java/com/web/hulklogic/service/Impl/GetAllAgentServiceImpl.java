package com.web.hulklogic.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.Images;
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.GetAllAgentsDAO;
import com.web.hulklogic.dto.RegistrationDTO;
import com.web.hulklogic.service.GetALLAgentsService;
@Service
public class GetAllAgentServiceImpl implements GetALLAgentsService {
	@Resource
	private GetAllAgentsDAO getAgentdao;
	public List<RegistrationDTO> retrieveAllAgentsForAdmin() {
		List<RegistrationBO> listbo=getAgentdao.getAllAgents();
		List<RegistrationDTO> listdto=getAllRegistrationInformation(listbo);
		return listdto;
	}
	
	private List<RegistrationDTO> getAllRegistrationInformation(List<RegistrationBO> listbo){
		List<RegistrationDTO> listdto=new ArrayList<RegistrationDTO>();	
		for(RegistrationBO registerbo:listbo){
			RegistrationDTO registerdto=new RegistrationDTO();
			registerdto.setAadharCardNo(registerbo.getAadharCardNo());
			registerdto.setAadharImg(registerbo.getAadharImg());
			registerdto.setAddrLine1(registerbo.getAddrLine1());
			registerdto.setAddrLine2(registerbo.getAddrLine2());
			registerdto.setBankAccNo(registerbo.getBankAccNo());
			registerdto.setBankName(registerbo.getBankName());
			registerdto.setContactNo(registerbo.getContactNo());
			registerdto.setCountry(registerbo.getCountry());
			registerdto.setDegreeCertificateImg(registerbo.getDegreeCertificateImg());
			registerdto.setDistrict(registerbo.getDistrict());
			registerdto.setDOB(registerbo.getDOB());
			registerdto.setEmail(registerbo.getEmail());
			registerdto.setFirstName(registerbo.getFirstName());
			registerdto.setLastName(registerbo.getLastName());
			registerdto.setGender(registerbo.getGender());
			registerdto.setIFSCCODE(registerbo.getIFSCCODE());
			registerdto.setLatitude(registerbo.getLatitude());
			registerdto.setLongitude(registerbo.getLongitude());
			registerdto.setPanimage(registerbo.getPanimage());
			registerdto.setPannumber(registerbo.getPannumber());
			registerdto.setPersonimage(registerbo.getPersonimage());
			registerdto.setPincode(registerbo.getPincode());
			registerdto.setQualification(registerbo.getQualification());
			registerdto.setState(registerbo.getState());
			registerdto.setUserName(registerbo.getUserName());
			registerdto.setVoterIdImg(registerbo.getVoterIdImg());
			registerdto.setVoterIdNo(registerbo.getVoterIdNo());
			registerdto.setAgentEmai(registerbo.getAgentEmail());
			registerdto.setRoleId(registerbo.getRoleid());
			registerdto.setIsEmailCheck(registerbo.getIsEmailCheck());
			registerdto.setIsActive(registerbo.getIsActiveted());
			registerdto.setUserid(registerbo.getUserid());
			listdto.add(registerdto);
			}
		return listdto;
	}

	@Override
	public List<RegistrationDTO>retrieveAllOperatorForAdmin(){
		List<RegistrationBO> listbo=getAgentdao.getAllOperator();
		List<RegistrationDTO> listdto=getAllRegistrationInformation(listbo);
		return listdto;
	}
	@Override
	public Images getAllImages(int userid) {
		return getAgentdao.getAllImages(userid);
	}
}
