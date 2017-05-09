package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@Controller
public class BillingController {
	@Autowired
	private BillingAccountService billingAccountService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private MailTransferService mailTransferService;
	@Autowired
	private ProductService productService;
	@Resource
	private Properties setting;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/admin/payments", method = RequestMethod.GET)
	public String initForm(ModelMap model) throws ServiceException {
		List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		model.addAttribute("payments", billingAccountDtos);
		model.addAttribute("payment", new BillingAccountDto());
		return "payments";
	}
	@RequestMapping(method = RequestMethod.POST, params = "addPayment")
	public void addAbout(@ModelAttribute("payment") BillingAccountDto billingAccountDto, HttpServletResponse response) throws ServiceException, IOException {
		if(billingAccountDto.getId() != null && billingAccountDto.getId() > 0){
			billingAccountService.update(billingAccountDto);
		}else{
			billingAccountService.add(billingAccountDto);
		}
		response.sendRedirect("/admin/payments");
	}
	@RequestMapping(value = "/admin/payment/edit/{id}", method = RequestMethod.GET)
	public String getEdit(@PathVariable int id, Model model, HttpServletRequest request)  throws ServiceException {
		BillingAccountDto billingAccountDto = billingAccountService.findById(id);
		model.addAttribute("payment",billingAccountDto);
		List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		model.addAttribute("payments", billingAccountDtos);
		return "payments";
	}
	@RequestMapping(value = "/admin/payment/edit/{id}", method = RequestMethod.POST)
	public void saveEdit(HttpServletResponse response, @ModelAttribute("payment") BillingAccountDto billingAccountDto, @PathVariable int id) throws ServiceException, IOException {
		billingAccountService.update(billingAccountDto);
		response.sendRedirect("/admin/payments");
	}

	@RequestMapping(value = "/admin/payment/delete/{id}", method = RequestMethod.GET)
	public void delete(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) throws ServiceException, IOException {
		billingAccountService.delete(id);
		response.sendRedirect("/admin/payments");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/admin/order/view/{id}")
	public String orderDetail(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		OrderInfoDto orderInfoDto = orderService.findById(id);
		model.addAttribute("order", orderInfoDto);
		List<OrderItemDto> orderItemDtos = orderItemService.findByOrderCode(orderInfoDto.getOrderCode());

		List<ProductDto> productDtos = new ArrayList<ProductDto>();
		if(orderItemDtos != null) {
			for (OrderItemDto orderItemDto : orderItemDtos) {
				ProductDto productDto = productService.findById(orderItemDto.getProductId());
				productDto.setCount(orderItemDto.getCount());
				productDtos.add(productDto);
			}
		}
		model.addAttribute("products", productDtos);
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		return "order-detail";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/checkoutSuccess")
	public String checkout(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "checkoutSuccess";
	}
	@RequestMapping(method = RequestMethod.POST, value = "/saveOrder")
	public void saveOrder(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("orderInfo") OrderInfoDto orderInfoDto) throws ServiceException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto != null){
			//orderInfoDto.setDescription(cartListDto.getDescription());
			orderInfoDto.setOrderCode(cartListDto.getOrderCode());
			orderInfoDto.setTotalPrice(cartListDto.getTotalPrice());
			//orderService.add(orderInfoDto);
			if(cartListDto.getCartDtoList() != null){
				for (CartDto cartDto: cartListDto.getCartDtoList()) {
					OrderItemDto orderItemDto = new OrderItemDto();
					orderItemDto.setOrderCode(cartListDto.getOrderCode());
					orderItemDto.setProductId(cartDto.getProductId());
					orderItemDto.setCount(cartDto.getCount());
					//orderItemService.add(orderItemDto);
				}
			}
			//send mail
			AboutDto aboutDto = aboutService.find();
			MailSenderDto mailSenderDto = new MailSenderDto();
			mailSenderDto.setEmail(aboutDto.getEmail());
			mailSenderDto.setFullName("Trầm Hương");
			SendMailPersonalDto sendMailPersonalDto = new SendMailPersonalDto();
			sendMailPersonalDto.setFullName(orderInfoDto.getName());
			sendMailPersonalDto.setEmail(orderInfoDto.getEmail());
			sendMailPersonalDto.setTel(orderInfoDto.getTel());
			String sig = "<p>***************************************************</p>"
					+ "<p> Chúng tôi luôn sẵn sàng hỗ trợ bạn qua email chuchuot12a15tnp@mail.com và hotline " + aboutDto.getHotLine() +"</p><br>"
					+ "<p> Địa Chỉ:" + aboutDto.getAddress() + "</p><br>"
					+ "<p> WebSite: " + setting.getProperty("url")  + "</p><br>"
					+ "<img src='" + "http://hstatic.net/526/1000069526/1000151899/logo.png?v=108"/*setting.getProperty("url")resources/img/logo.png*/+ "'/><br>"
					+ "<p>***************************************************</p>";
			sendMailPersonalDto.setSignature(sig);
			SendMailParameter sendMailParameter = new SendMailParameter();
			//sendMailParameter.setAttachementURLList(Arrays.asList("localhost:8080"));
			sendMailParameter.setOrderCode(cartListDto.getOrderCode());
			sendMailParameter.setSubject("Mua Sản Phẩm Trầm Hương");
			sendMailParameter.setToEmail(orderInfoDto.getEmail());
			DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
			List<ProductDto> productDtos = CommonController.getProductFromCart(request, productService);
			String content = "";
			for (ProductDto productDto : productDtos) {
				content = content + "<tr>"
						+ "<td>" + "<img style='width: 50px;height: 50px;' src='" + "http://product.hstatic.net/1000069526/product/lx100_large.jpg"/*productDto.getImg()*/ + "'/></td>"
						+ "<td style='text-align: center;'>" + productDto.getName()+ "</td>"
						+ "<td style='text-align: center;'>" + productDto.getCount()+ "</td>"
						+ "<td style='text-align: center;'>" + productDto.getPriceDisplay()+ "đ</td>"
						+ "</tr>"
				;
			}
			String body = "<p> Cảm ơn bạn đã mua sản phẩm của chúng tối</p><br>"
					+ "<p>Thông tin sản phẩm của bạn như sau:</p>"
					+ "<p style='color:red'> Mã Đơn Hàng: " + cartListDto.getOrderCode() + "</p>"
					+ "<table>"
					+ "<tr>"
					+ "<th>Hình Ảnh</th>"
					+ "<th>Tên Sản Phẩm</th>"
					+ "<th>Số Lượng</th>"
					+ "<th>Giá Tiền</th>"
					+ "</tr>"
					+ content
					+ "</table>"
					+ "<p> Phí Vận Chuyển: " + decimalFormat.format(Double.parseDouble(setting.getProperty("shipping.cost"))) + "đ</p>"
					+ "<p style='color:red'> TỔNG CỘNG: " + cartListDto.getTotalPrice() + "đ</p>";
			sendMailParameter.setBody(body);
			mailTransferService.sendCustomerEmail(mailSenderDto, sendMailPersonalDto, sendMailParameter, "ORDER", true);
			// delete session
			session.removeAttribute("cartList");
		}
		response.sendRedirect("/checkoutSuccess");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/page/payment")
	public String payment(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		model.addAttribute("billings", billingAccountDtos);
		return "payment";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/buy")
	public String buy(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "buy";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/shipping")
	public String shipping(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		return "shipping";
	}

}
