package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.cache2k.Cache;
import org.cache2k.Cache2kBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class IndexController {
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private BannerService bannerService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public String dashboard(ModelMap model) throws ServiceException {
		List<OrderInfoDto> orderInfoDtos = orderService.findNew();
		if(orderInfoDtos == null){
			orderInfoDtos = new ArrayList<OrderInfoDto>();
		}
		model.addAttribute("orders", orderInfoDtos);
		model.addAttribute("payments", commonService.findByStatusPayment());
		model.addAttribute("shippings", commonService.findByStatusShipping());
		Long orderCancel = orderService.findOrderCancel();
		model.addAttribute("orderCancel", orderCancel != null ? orderCancel : 0);
		Long orderThisDay = orderService.findOrderThisDay();
		model.addAttribute("orderThisDay", orderThisDay != null ? orderThisDay : 0);
		Double total = 0.0;
		List<OrderInfoDto> paymentAll = orderService.findPayment();
		if(paymentAll != null && paymentAll.size() > 0){
			for (OrderInfoDto orderInfoDto:paymentAll) {
				total = total + Double.parseDouble(orderInfoDto.getTotalPrice().replace(".", "").replace(",",""));
			}
		}
		DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
		String sPrice = decimalFormat.format(total != null ? total : 0);
		model.addAttribute("paymentAll", sPrice);
		List<ChartDto> chartDtos = orderService.chart();
		if(chartDtos != null && chartDtos.size() > 0){
			int p = 0;
			List<ChartDto> chartDtos1 = new ArrayList<ChartDto>(chartDtos.size());
			for (ChartDto chartDto: chartDtos) {
				p = p + chartDto.getValue();
			}
			for (ChartDto chartDto: chartDtos) {
				ChartDto chartDto1 = new ChartDto();
				chartDto1.setValue(chartDto.getValue());
				chartDto1.setLabel(chartDto.getLabel());
				chartDto1.setPercent((chartDto.getValue()* 100)/p);
				chartDtos1.add(chartDto1);
			}
			model.addAttribute("chart", chartDtos1);

		}else {
			model.addAttribute("chart", new ArrayList<ChartDto>());
		}
		return "dashboard";
	}
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException, NoSuchFieldException, IllegalAccessException {

		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		//Product Highlight
		List<ProductDto> highs = new ArrayList<ProductDto>();
		if(Memoizer.getInstance().get("high-home") == null){
			highs = productService.findHighlights(9);
			Memoizer.getInstance().put("high-home", highs);
		}else{
			highs = (List<ProductDto>) Memoizer.getInstance().get("high-home");
		}
		model.addAttribute("pHighlights", highs);
		List<ProductDto> sales = new ArrayList<ProductDto>();
		if(Memoizer.getInstance().get("sale-home") == null){
			sales = productService.findSale(6);
			Memoizer.getInstance().put("sale-home", sales);
		}else{
			sales = (List<ProductDto>) Memoizer.getInstance().get("sale-home");
		}
		model.addAttribute("pSales", sales);
		List<BannerDto> banners = new ArrayList<BannerDto>();
		if(Memoizer.getInstance().get("banner") == null){
			banners = bannerService.findByStatus((byte)1);
			Memoizer.getInstance().put("banner", banners);
		}else{
			banners = (List<BannerDto>) Memoizer.getInstance().get("banner");
		}
		model.addAttribute("banners", banners);
		model.addAttribute("active", "_1");
		return "index";
	}

	@RequestMapping(value = "/chart", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ChartDto> chart(HttpServletRequest request) throws ServiceException {
		return orderService.chart();
	}
}
