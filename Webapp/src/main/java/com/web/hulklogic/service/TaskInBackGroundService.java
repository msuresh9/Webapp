package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.dto.TaskInBankGroundAgtDTO;
import com.web.hulklogic.utils.Taskname;


public interface TaskInBackGroundService {
	
	public String storeTaskInBackGround(TaskInBankGroundAgtDTO taskInBackGround);
	public List<Taskname> getAllTaskName(String taskname);
}
