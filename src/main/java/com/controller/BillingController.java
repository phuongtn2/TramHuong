package com.controller;

import com.controller.memoizer.Memoizer;
import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	private StaticService staticService;
	@Autowired
	private ProductService productService;
	@Resource
	private Properties setting;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private MailTemplateService mailTemplateService;
	@Autowired
	private CommonService commonService;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
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
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		return "checkoutSuccess";
	}

	public JavaMailSenderImpl getMailSender(String username, String password) {
		final JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		mailSender.setDefaultEncoding("UTF-8");
		mailSender.setHost(setting.getProperty("mailTransfer.smtp.server"));
		mailSender.setPort(Integer.parseInt(setting.getProperty("mailTransfer.smtp.port")));
		mailSender.setProtocol("smtps");
		mailSender.setUsername(username);
		mailSender.setPassword(password);

		mailSender.setJavaMailProperties(getOutgoingJavaMailProperties());

		return mailSender;
	}

	public Properties getOutgoingJavaMailProperties() {
		final Properties properties = new Properties();
		properties.put("mail.smtp.auth", setting.getProperty("mailTransfer.smtp.auth"));
		properties.put("mail.smtp.starttls.enable", setting.getProperty("mailTransfer.smtp.starttls.enable"));
		return properties;
	}
	@RequestMapping(method = RequestMethod.POST, value = "/saveOrder")
	public String saveOrder(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("orderInfo") OrderInfoDto orderInfoDto, Model model) throws ServiceException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CartListDto cartListDto = (CartListDto) session.getAttribute("cartList");
		if(cartListDto != null){
			//orderInfoDto.setDescription(cartListDto.getDescription());
			orderInfoDto.setOrderCode(cartListDto.getOrderCode());
			ShippingDto shippingDto = commonService.findByIdShipping(orderInfoDto.getShippingType());
			DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
			String sPrice = decimalFormat.format(cartListDto.getTotalProductPrice() + shippingDto.getShippingCost());
			orderInfoDto.setTotalPrice(sPrice);
			orderService.add(orderInfoDto);
			if(cartListDto.getCartDtoList() != null){
				for (CartDto cartDto: cartListDto.getCartDtoList()) {
					OrderItemDto orderItemDto = new OrderItemDto();
					orderItemDto.setOrderCode(cartListDto.getOrderCode());
					orderItemDto.setProductId(cartDto.getProductId());
					orderItemDto.setCount(cartDto.getCount());
					orderItemService.add(orderItemDto);
				}
			}
			//send mail
			AboutDto aboutDto = aboutService.find(1);
			MailTemplateDto mailTemplateDto = mailTemplateService.findByCode("ORDER");
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
			String body = mailTemplateDto.getHeader()
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
					+ "<p> Phí Vận Chuyển: " + shippingDto.getCostDisplay() + "đ</p>"
					+ "<p style='color:red'> TỔNG CỘNG: " + cartListDto.getTotalPrice() + "đ</p>"
					+ mailTemplateDto.getFooter();
			//sendMailParameter.setBody(body);
			//mailTransferService.sendCustomerEmail(mailSenderDto, sendMailPersonalDto, sendMailParameter, "ORDER", true);
			final JavaMailSenderImpl mailSender = getMailSender(setting.getProperty("mailTransfer.smtp.server.user"),
					setting.getProperty("mailTransfer.smtp.server.passwd"));
			MimeMessage message = mailSender.createMimeMessage();
			try {
				final String headerCharset = setting.getProperty("mailTransfer.headerCharset");
				MimeMessageHelper helper = new MimeMessageHelper(message, true);

				helper.setFrom(new InternetAddress(setting.getProperty("mailTransfer.smtp.server.user"), setting.getProperty("mailTransfer.infoMailFullName"), headerCharset));
				helper.setTo(orderInfoDto.getEmail());
				helper.setCc(setting.getProperty("mailTransfer.smtp.server.user"));
				helper.setSubject(setting.getProperty("mailTransfer.subject"));
				helper.setText(body, true);
			} catch (MessagingException e) {
				e.printStackTrace();
				// delete order
				orderService.delete(orderInfoDto.getOrderCode());
				orderItemService.delete(orderInfoDto.getOrderCode());
			}

			//mailSender.send(message);
			orderInfoDto.setOrderDate(new Date());
			model.addAttribute("orderInfo", orderInfoDto);
			PaymentDto paymentDto = commonService.findByIdPayment(orderInfoDto.getPaymentType());
			model.addAttribute("payment", paymentDto);
			model.addAttribute("shipping", shippingDto);
			model.addAttribute("cartDto", cartListDto);
			List<ProductDto> productSessions = (List<ProductDto>) session.getAttribute("productSessions");
			model.addAttribute("productSessions", productSessions);
			// delete session
			session.removeAttribute("cartList");
			session.removeAttribute("productSessions");
		}
		return "checkoutSuccess";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/page/payment")
	public String payment(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		//List<BillingAccountDto> billingAccountDtos = billingAccountService.findAll();
		//model.addAttribute("billings", billingAccountDtos);
		StaticDto staticDto = (StaticDto) Memoizer.getInstance().get("paymentHome");
		if(staticDto == null){
			staticDto = staticService.find(2);
			Memoizer.getInstance().put("paymentHome", staticDto);
		}
		model.addAttribute("payment", staticDto);
		return "payment";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/buy")
	public String buy(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		StaticDto staticDto = (StaticDto) Memoizer.getInstance().get("buyHome");
		if(staticDto == null){
			staticDto = staticService.find(1);
			Memoizer.getInstance().put("buyHome", staticDto);
		}
		model.addAttribute("buyHome", staticDto);
		return "buy";
	}
	@RequestMapping(method = RequestMethod.GET, value = "/page/shipping")
	public String shipping(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService, Memoizer.getInstance());
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(Memoizer.getInstance(), request, model, aboutService, blogService);
		StaticDto staticDto = (StaticDto) Memoizer.getInstance().get("shippingHome");
		if(staticDto == null){
			staticDto = staticService.find(3);
			Memoizer.getInstance().put("shippingHome", staticDto);
		}
		model.addAttribute("shippingHome", staticDto);
		return "shipping";
	}

}
