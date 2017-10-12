package com.web.hulklogic.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.TaskInBankGroundAgtBO;
import com.web.hulklogic.dao.TaskInBackGroundDAO;
import com.web.hulklogic.dto.TaskInBankGroundAgtDTO;
import com.web.hulklogic.service.TaskInBackGroundService;
import com.web.hulklogic.utils.Taskname;

@Service
public class TaskInBackGroundServiceImpl implements TaskInBackGroundService  {

	@Resource
	private TaskInBackGroundDAO taskinbankgrounddao;
	public String storeTaskInBackGround(TaskInBankGroundAgtDTO taskInBackGround) {
	    TaskInBankGroundAgtBO bo=new TaskInBankGroundAgtBO(); 
		bo.setShopname(taskInBackGround.getShopname());
		bo.setSellername(taskInBackGround.getSellername());
		bo.setAgentemail(taskInBackGround.getAgentemail());
		bo.setSellermobile(taskInBackGround.getSellermobile());
		bo.setSellerStatus(taskInBackGround.getSellerStatus());
	    bo.setTaskname(taskInBackGround.getTaskname());
		bo.setSellerdeal(taskInBackGround.getSellerdeal());
        bo.setLatitude(taskInBackGround.getLatitude());
        bo.setLongitude(taskInBackGround.getLongitude());
        bo.setTotaldoc(taskInBackGround.getTotaldoc());
        bo.setAssignFrom(taskInBackGround.getAssignFrom());
        bo.setAssignTO(taskInBackGround.getAssignTO());
        bo.setTaskmessage(taskInBackGround.getTaskmessage());
        System.out.println("service"+taskInBackGround.getTaskname());
		int count= taskinbankgrounddao.insertTaskInBackGround(bo);
		
		if(count==1) {
			return "success";
			
		}else {
			
			return "fail";
}
		
	}
	@Override
	public List<Taskname> getAllTaskName(String taskname) {
		return taskinbankgrounddao.getAllTaskName(taskname);
	}
}
