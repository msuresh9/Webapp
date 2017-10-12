package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.bo.IssucesHistoryMessageBO;
import com.web.hulklogic.bo.ShowHistoryMessageBo;

public interface ShowHistoryMessageService {
public List<ShowHistoryMessageBo> retrieveHistoryMessage(int taskId);
public List<IssucesHistoryMessageBO> getIssueHistoryMessage(int issueid);
}
