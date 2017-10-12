package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.utils.Taskname;

public interface TaskInBackGroundDAO {
	public int insertTaskInBackGround(TaskInBankGroundAgtBO abo);
	public List<Taskname> getAllTaskName(String taskname);
	}
