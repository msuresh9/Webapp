package com.web.hulklogic.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.hulklogic.bo.IssucesHistoryMessageBO;
import com.web.hulklogic.bo.ShowHistoryMessageBo;
import com.web.hulklogic.dao.ShowHistoryMessageDao;
import com.web.hulklogic.service.ShowHistoryMessageService;
@Service
public class ShowHistoryMessageServiceImpl implements ShowHistoryMessageService {
	@Resource
	private  ShowHistoryMessageDao historyMessage;

	@Override
	public List<ShowHistoryMessageBo> retrieveHistoryMessage(int taskId) {
		return historyMessage.retrieveHistoryMessage(taskId);
	}

	@Override
	public List<IssucesHistoryMessageBO> getIssueHistoryMessage(int issueid) {
		
		return historyMessage.getIssueHistoryMessage(issueid);
	}

}
