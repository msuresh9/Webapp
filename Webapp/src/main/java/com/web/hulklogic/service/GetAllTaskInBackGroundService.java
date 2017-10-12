package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.dto.GetAllTaskInBackGroundDTO;

public interface GetAllTaskInBackGroundService {
	public List<GetAllTaskInBackGroundDTO> retrieveTaskInBackGround(String startDate,String endDate);
	public  List<GetAllTaskInBackGroundDTO>  retrieveTaskInBackGroundByEmail(String agentEmail);
}

