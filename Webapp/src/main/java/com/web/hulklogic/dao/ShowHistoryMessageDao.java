package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.IssucesHistoryMessageBO;
import com.web.hulklogic.bo.ShowHistoryMessageBo;

public interface ShowHistoryMessageDao {

	public List<ShowHistoryMessageBo> retrieveHistoryMessage(int taskid);
	public List<IssucesHistoryMessageBO> getIssueHistoryMessage(int issueid);
}
