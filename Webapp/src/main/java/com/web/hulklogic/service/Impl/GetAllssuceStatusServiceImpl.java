package com.web.hulklogic.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.GetAllssuceStausBO;
import com.web.hulklogic.dao.GetAllssuceStatusDAO;
import com.web.hulklogic.dto.GetAllssuceStatusDTO;
import com.web.hulklogic.service.GetAllssuceStatusService;

@Service
public class GetAllssuceStatusServiceImpl implements GetAllssuceStatusService {
	@Resource
	private GetAllssuceStatusDAO getAllssuceStatusDAO;

	public List<GetAllssuceStatusDTO> retriveALLIssuceStatus(String startDate, String endDate) {
		List<GetAllssuceStausBO> listbo=null;
		List<GetAllssuceStatusDTO>listdto=null;
		listdto=new ArrayList<GetAllssuceStatusDTO>();
		GetAllssuceStatusDTO dto=null;
		listbo=getAllssuceStatusDAO.getAllssuceStatus(startDate,endDate);
		for(GetAllssuceStausBO bo:listbo){
			dto=new GetAllssuceStatusDTO();
			dto.setLatitude(bo.getLatitude());
			dto.setLongitude(bo.getLongitude());
			dto.setIssueId(bo.getIssueId());
			dto.setIssueName(bo.getIssueName());
			dto.setIssueStatus(bo.getIssueStatus());
			dto.setAgentEmail(bo.getAgentemail());
			dto.setAssignFrom(bo.getAssignFrom());
			dto.setAssignTO(bo.getAssignTO());
			dto.setIssueMessage(bo.getIssueMessage());
			dto.setCreated_at(bo.getCreated_at());
			listdto.add(dto);
		}
		return listdto;
	}

	@Override
	public List<GetAllssuceStatusDTO> retriveALLIssuceStatusByEmail(String agentEmail) {
		List<GetAllssuceStausBO> listbo=null;
		List<GetAllssuceStatusDTO>listdto=null;
		listdto=new ArrayList<GetAllssuceStatusDTO>();
		GetAllssuceStatusDTO dto=null;
		listbo=getAllssuceStatusDAO.getAllIsuesStatusByEmail(agentEmail);
		for(GetAllssuceStausBO bo:listbo){
			dto=new GetAllssuceStatusDTO();
			dto.setLatitude(bo.getLatitude());
			dto.setLongitude(bo.getLongitude());
			dto.setIssueId(bo.getIssueId());
			dto.setIssueName(bo.getIssueName());
			dto.setIssueStatus(bo.getIssueStatus());
			dto.setAgentEmail(bo.getAgentemail());
			dto.setAssignFrom(bo.getAssignFrom());
			dto.setAssignTO(bo.getAssignTO());
			dto.setIssueMessage(bo.getIssueMessage());
			dto.setCreated_at(bo.getCreated_at());
			listdto.add(dto);
		}
		return listdto;
	}
}
