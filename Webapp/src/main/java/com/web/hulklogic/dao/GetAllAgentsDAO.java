package com.web.hulklogic.dao;

import java.util.List;

import com.web.hulklogic.bo.Images;
import com.web.hulklogic.bo.RegistrationBO;

public interface GetAllAgentsDAO {
public List<RegistrationBO> getAllAgents();
public List<RegistrationBO> getAllOperator();
public Images getAllImages(int userid);
}
