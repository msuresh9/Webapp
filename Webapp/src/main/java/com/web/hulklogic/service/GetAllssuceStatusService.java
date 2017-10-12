package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.dto.GetAllssuceStatusDTO;

public interface GetAllssuceStatusService {

	public List<GetAllssuceStatusDTO> retriveALLIssuceStatus(String startDate,String endDate);
	public List<GetAllssuceStatusDTO> retriveALLIssuceStatusByEmail(String agentEmail);
}
