package com.web.hulklogic.service;

import java.util.List;

import com.web.hulklogic.bo.Images;
import com.web.hulklogic.dto.RegistrationDTO;

public interface GetALLAgentsService {
	public List<RegistrationDTO> retrieveAllAgentsForAdmin();
	public List<RegistrationDTO> retrieveAllOperatorForAdmin();
	public Images getAllImages(int userid);
	}
