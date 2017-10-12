package com.web.hulklogic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.hulklogic.bo.Images;
import com.web.hulklogic.service.GetALLAgentsService;

@Controller
public class ShowImagesController {
	
	private static Logger logger = Logger.getLogger(ShowImagesController.class);
	
	@Resource
	private GetALLAgentsService getALLAgentService;
	@Autowired
    private ServletContext context;

	@RequestMapping(value="/showImages",method=RequestMethod.POST)
	public @ResponseBody Images sendImage(@RequestParam(value="userid", required=false) int userid){
		
		logger.info("userid:"+userid);
		
		Images allImages=new Images();
		
	try{
		    allImages=getALLAgentService.getAllImages(userid);
			File destinationFile = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + allImages.getRecentphotoimg());
            FileInputStream fileInputStreamReader = null;
            try{
            	fileInputStreamReader = new FileInputStream(destinationFile);
                byte[] bytes = new byte[(int)destinationFile.length()];
                fileInputStreamReader.read(bytes);
              String  encodedrecentPhoto = new String(Base64.encodeBase64(bytes), "UTF-8");
                allImages.setRecentphotoimg(encodedrecentPhoto);
            }
            catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(fileInputStreamReader!=null)
					fileInputStreamReader.close();
			} catch (Exception e) {
				e.printStackTrace();
            } 
	       
	       File destinationFile1 = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + allImages.getAadharimg());
	       FileInputStream fileInputStreamReader1= null;
	       try{
	    	   fileInputStreamReader1 = new FileInputStream(destinationFile1);
               byte[] bytes = new byte[(int)destinationFile1.length()];
               fileInputStreamReader1.read(bytes);
             String  encodedAadharphoto = new String(Base64.encodeBase64(bytes), "UTF-8");
               allImages.setAadharimg(encodedAadharphoto );
	       }catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(fileInputStreamReader1!=null)
				fileInputStreamReader1.close();
			} catch (Exception e) {
				e.printStackTrace();
				}
			
			 File destinationFile2 = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + allImages.getPancardimg());
			 FileInputStream fileInputStreamReader2= null;
	            try{
		    	   fileInputStreamReader2 = new FileInputStream(destinationFile2);
	               byte[] bytes = new byte[(int)destinationFile2.length()];
	               fileInputStreamReader2.read(bytes);
	              String encodedpancard = new String(Base64.encodeBase64(bytes), "UTF-8");
	               allImages.setPancardimg(encodedpancard);
			 }catch (Exception e) {
					e.printStackTrace();
				}
				try {
					if(fileInputStreamReader2!=null)
					fileInputStreamReader2.close();
				} catch (Exception e) {
					e.printStackTrace();
					}
				 File destinationFile3 = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + allImages.getVotercardimg());
				 FileInputStream fileInputStreamReader3= null;
				 try{
			    	   fileInputStreamReader3 = new FileInputStream(destinationFile3);
		               byte[] bytes = new byte[(int)destinationFile3.length()];
		               fileInputStreamReader3.read(bytes);
		              String encodedVotercard = new String(Base64.encodeBase64(bytes), "UTF-8");
		               allImages.setVotercardimg(encodedVotercard );
				 }catch (Exception e) {
						e.printStackTrace();
					}
					try {
						if(fileInputStreamReader3!=null)
						fileInputStreamReader3.close();
					} catch (Exception e) {
						e.printStackTrace();
						}
					File destinationFile4 = new File(context.getRealPath("/WEB-INF/uploaded")+ File.separator + allImages.getQualificationimg());
					 FileInputStream fileInputStreamReader4= null;
					 try{
				    	   fileInputStreamReader4 = new FileInputStream(destinationFile4);
			               byte[] bytes = new byte[(int)destinationFile4.length()];
			               fileInputStreamReader4.read(bytes);
			              String encodedQulification = new String(Base64.encodeBase64(bytes), "UTF-8");
			               allImages.setQualificationimg(encodedQulification);
					 }catch (Exception e) {
							e.printStackTrace();
						}
						try {
							if(fileInputStreamReader4!=null)
							fileInputStreamReader4.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
						}
         catch(Exception e){
		e.printStackTrace();
	}
	
	return allImages;
	
}
}

