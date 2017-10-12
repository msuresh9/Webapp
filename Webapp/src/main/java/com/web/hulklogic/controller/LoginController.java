package com.web.hulklogic.controller;

import java.util.Collection;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.hulklogic.bo.User;
import com.web.hulklogic.dao.UpdateIssucesDAO;
import com.web.hulklogic.service.UpdateStatusService;
import com.web.hulklogic.service.Impl.EmailOtpImplservice;
import com.web.hulklogic.utils.Invite;

@Controller
public class LoginController {
	
	private static Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	private UpdateIssucesDAO updateIssucesDao;
	@Resource
    private EmailOtpImplservice emailotpservice;
	@Resource
	 private UpdateStatusService updateStatusService;
	
	@RequestMapping(value = "/login/loginPage", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "loginPage";
	}
	
	@RequestMapping(value = "/login/forgetpwd", method = RequestMethod.GET)
	public String forgetPassword(ModelMap model) {
		return "forgetPwdPage";
	}
	
	@RequestMapping(value = "/login/loginFailed", method = RequestMethod.GET)
	public String loginFailed(Model map, HttpSession session) {
		logger.info("********************** loginFailed() ****************************END");
       return "loginPage";
}
  @RequestMapping(value = "/login/logout")
	public String logout(Model map, HttpServletRequest req) {
	  logger.info("*******************************session invalidated");
		 req.getSession().invalidate();
		 SecurityContextHolder.clearContext();
		return "redirect:loginPage";
	}
  
  
	
  @RequestMapping(value = "/login/loginPass", method = RequestMethod.GET)
	public String loginPass(Model map,  HttpServletRequest req) {
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		HttpSession session = req.getSession(true);
		session.setAttribute("userName", userName);
		Collection<? extends GrantedAuthority> roleNames = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		User user=updateIssucesDao.getUserInfo(userName);
		session.setAttribute("userId", user.getUserId());
		String roleName = "";
		for (GrantedAuthority role : roleNames) {
			roleName = role.getAuthority();
			break;
		}
		String retstr = "";
		if("ROLE_ADMIN".equalsIgnoreCase(roleName)){
			map.addAttribute("admin", roleName);
			retstr="redirect:../admin/getDetails";
		}else if("ROLE_CUSTOMER".equalsIgnoreCase(roleName)){
			retstr="redirect:../admin/getDetails";
			}
		else if("ROLE_AGENT".equalsIgnoreCase(roleName)){
			retstr="redirect:../agent/getDetails";
		}
		return retstr;
		}
  
  
  @RequestMapping(value = "/login/activate/{email}/{acvcode}", method = RequestMethod.GET)
	public String activate(ModelMap model,@PathVariable String email,@PathVariable String acvcode ) {
		logger.info("id: "+email);
		logger.info("acvcode: "+acvcode);
		if(email!=null && acvcode!=null){
			Invite invite =emailotpservice.selectReferralCode(email);
			if(null!=invite && acvcode.equals(invite.getReferralcode())){
				try {
				int count=updateStatusService.enableUser(email);
				if(count>0){
					model.addAttribute("activationDone", "Hi "+invite.getFirstname()+", profile has been activated.");
					return "activation";
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "nouser";		
	}
  
  
	}
