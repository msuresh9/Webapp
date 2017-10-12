package com.web.hulklogic.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.GetAllTaskInBackGroundBO;
import com.web.hulklogic.dao.GetALLTaskInBackGroundDAO;
import com.web.hulklogic.dto.GetAllTaskInBackGroundDTO;
import com.web.hulklogic.service.GetAllTaskInBackGroundService;

@Service
public class GetAllTaskInBackGroundServiceImpl implements GetAllTaskInBackGroundService{
	@Resource
	private GetALLTaskInBackGroundDAO getAllTaskInBackGround;

	public List<GetAllTaskInBackGroundDTO> retrieveTaskInBackGround(String startDate,String endDate) {
		
		
		List<GetAllTaskInBackGroundDTO> listdto=new ArrayList<GetAllTaskInBackGroundDTO>();
		List<GetAllTaskInBackGroundBO>listbo=null;
		GetAllTaskInBackGroundDTO getAllTaskInBackGroundDto=null;
		listbo=getAllTaskInBackGround.getAllTaskInBackGround(startDate,endDate);
		listdto=getTaskInBackGroundDTOList(listbo);
		return listdto;
	}
	
	private List<GetAllTaskInBackGroundDTO> getTaskInBackGroundDTOList(List<GetAllTaskInBackGroundBO> listbo){
		List<GetAllTaskInBackGroundDTO> listdto=new ArrayList<GetAllTaskInBackGroundDTO>();
		for(GetAllTaskInBackGroundBO getAllTaskInBackGroundBO:listbo){
			GetAllTaskInBackGroundDTO getAllTaskInBackGroundDto=new GetAllTaskInBackGroundDTO();
			
			getAllTaskInBackGroundDto.setAgentemailid(getAllTaskInBackGroundBO.getAgentemailid());
			getAllTaskInBackGroundDto.setLatitude(getAllTaskInBackGroundBO.getLatitude());
			getAllTaskInBackGroundDto.setLongitude(getAllTaskInBackGroundBO.getLongitude());
			getAllTaskInBackGroundDto.setSellerdeal(getAllTaskInBackGroundBO.getSellerdeal());
			getAllTaskInBackGroundDto.setSellername(getAllTaskInBackGroundBO.getSellername());
			getAllTaskInBackGroundDto.setSellerstatus(getAllTaskInBackGroundBO.getSellerstatus());
			getAllTaskInBackGroundDto.setSelllermobile(getAllTaskInBackGroundBO.getSelllermobile());
			getAllTaskInBackGroundDto.setShopname(getAllTaskInBackGroundBO.getShopname());
			getAllTaskInBackGroundDto.setTaskid(getAllTaskInBackGroundBO.getTaskid());
			getAllTaskInBackGroundDto.setTaskname(getAllTaskInBackGroundBO.getTaskname());
			getAllTaskInBackGroundDto.setTotaldoc(getAllTaskInBackGroundBO.getTotaldoc());
			getAllTaskInBackGroundDto.setAssignFrom(getAllTaskInBackGroundBO.getAssignFrom());
			getAllTaskInBackGroundDto.setAssignTO(getAllTaskInBackGroundBO.getAssignTO());
			getAllTaskInBackGroundDto.setCreated_at(getAllTaskInBackGroundBO.getCreated_at());
			getAllTaskInBackGroundDto.setTaskmessage(getAllTaskInBackGroundBO.getTaskmessage());
			listdto.add(getAllTaskInBackGroundDto);
			
	}
		return listdto;
	}

	public List<GetAllTaskInBackGroundDTO> retrieveTaskInBackGroundByEmail(String agentEmail) {
		List<GetAllTaskInBackGroundDTO> listdto=new ArrayList<GetAllTaskInBackGroundDTO>();
		List<GetAllTaskInBackGroundBO>listbo=null;
		GetAllTaskInBackGroundDTO getAllTaskInBackGroundDto=null;
		listbo=getAllTaskInBackGround.getAllTaskInBackGroundByEmail(agentEmail);
		listdto=getTaskInBackGroundDTOList(listbo);
		return listdto;
	}

}
