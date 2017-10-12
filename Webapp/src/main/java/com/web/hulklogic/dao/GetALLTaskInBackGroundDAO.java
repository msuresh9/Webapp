package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.GetAllTaskInBackGroundBO;

public interface GetALLTaskInBackGroundDAO {
	public List< GetAllTaskInBackGroundBO> getAllTaskInBackGround(String startDate,String endDate);
	public List< GetAllTaskInBackGroundBO> getAllTaskInBackGroundByEmail(String agentEmail);
}
