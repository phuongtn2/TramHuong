

package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.BannerDto;
import com.tramhuong.services.BannerService;
import com.tramhuong.services.error.ServiceException;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BannerController {
	@Autowired
	private BannerService bannerService;
	@Autowired
	private ServletContext servletContext;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/banners", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<BannerDto> bannerDtos = bannerService.findAll();
		if(bannerDtos != null){
			model.addAttribute("banners", bannerDtos);
		}else{
			model.addAttribute("banners", new ArrayList<BannerDto>());
		}
		return "banners";
	}
	@RequestMapping(value = "/admin/banner", method = RequestMethod.GET)
	public String redirectAdd(ModelMap model) throws ServiceException {
		model.addAttribute("banner", new BannerDto());
		return "banner-add";
	}
	@RequestMapping(value = "/admin/banner/edit/{id}", method = RequestMethod.GET)
	public String redirectEdit(ModelMap model, @PathVariable int id) throws ServiceException {
		BannerDto bannerDto = bannerService.findById(id);
		model.addAttribute("banner", bannerDto);
		return "banner-add";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addBanner")
	public void addAbout(@ModelAttribute("banner") BannerDto bannerDto, HttpServletResponse response) throws ServiceException, IOException {
		String path = servletContext.getRealPath("/");
		if(bannerDto.getFile() != null && !bannerDto.getFile().isEmpty()){
			String fileName = "/resources/img/banner/" + RandomStringUtils.randomAlphanumeric(10)+ "_" + bannerDto.getFile().getOriginalFilename();
			bannerDto.setImg(fileName);
			OutputStream outputStream = new FileOutputStream(path + fileName);
			int bufferSize = 256;
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, bufferSize);
			bufferedOutputStream.write(bannerDto.getFile().getBytes());
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			outputStream.close();
		}else{
			bannerDto.setImg(null);
		}
		if(bannerDto.getId() != null && bannerDto.getId() > 0){
			bannerService.update(bannerDto);
		}else{
			bannerService.add(bannerDto);
		}
		Memoizer.getInstance().remove("banner");
		response.sendRedirect("/admin/banners");
	}
}

