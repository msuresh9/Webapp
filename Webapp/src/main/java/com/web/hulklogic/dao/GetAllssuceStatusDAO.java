package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.GetAllssuceStausBO;

public interface GetAllssuceStatusDAO {

	public List<GetAllssuceStausBO> getAllssuceStatus(String startDate,String endDate);
	public List<GetAllssuceStausBO> getAllIsuesStatusByEmail(String email);

	
}
