package com.web.hulklogic.service.Impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.web.hulklogic.bo.RegistrationBO;
import com.web.hulklogic.dao.EditUserDetailsDAO;
import com.web.hulklogic.service.EditUserDetailsService;

@Service
public class EditUserDetailsServiceImpl implements EditUserDetailsService {
	 @Resource
	private EditUserDetailsDAO editUserDetailsDao;
	@Override
	public int updateUser(RegistrationBO registrationBo) {
		return editUserDetailsDao.updateUser(registrationBo);
		}
	}
