
package com.controller;

import com.tramhuong.dto.*;
import com.tramhuong.services.*;
import com.tramhuong.services.error.ServiceException;
import com.tramhuong.util.str.StringUtil;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import java.io.*;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ProductController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private TagService tagService;
	@Autowired
	private ServletContext servletContext;
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@RequestMapping(value = "/admin/products", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model) throws ServiceException {
		HttpSession session = request.getSession();
		List<ProductDto> productDtos = (List<ProductDto>) session.getAttribute("products");
		if(productDtos != null){
			model.addAttribute("products", productDtos);
			SearchProductDto searchProductDto = (SearchProductDto) session.getAttribute("searchProduct");
			model.addAttribute("searchProduct", searchProductDto);
		}else{
			model.addAttribute("products", productService.findAll());
			SearchProductDto searchProductDto = new SearchProductDto();
			searchProductDto.setStatus((byte)-1);
			model.addAttribute("searchProduct", searchProductDto);
		}

		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		session.removeAttribute("products");
		session.removeAttribute("searchProduct");
		return "products";
	}

	@RequestMapping(value = "/admin/products", method = RequestMethod.POST)
	public void searchProduct(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("searchProduct") SearchProductDto searchProductDto) throws ServiceException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (searchProductDto.getCreated() != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(searchProductDto.getCreated());
			int date = (cal.get(Calendar.MONTH ) + 1);
			String dateTime = "";
			if(date <10){
				dateTime = "0" + date;
			}else{
				dateTime = dateTime + date;
			}
			String onlyDate = cal.get(Calendar.YEAR) + "-"
					+ dateTime + "-"
					+ cal.get(Calendar.DATE);
			searchProductDto.setDateSearch(onlyDate);
		}
		List<ProductDto> productDtos = productService.findByCondition(searchProductDto);
		session.setAttribute("products", productDtos);
		session.setAttribute("searchProduct", searchProductDto);
		response.sendRedirect("/admin/products");
	}

	@RequestMapping(value = "/admin/product", method = RequestMethod.GET)
	public String addProduct(HttpServletRequest request,ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		ProductDto productDto = new ProductDto();
		String detail = "<div class='container-fluid product-description-wrapper'>"
				+ "<p style='font-family: verdana; font-size: medium;' data-mce-style='font-family: verdana; font-size: medium;'>"
				+ "<strong>Trầm Hương Kỳ Anh - Trầm hương tự nhiên cam kết đúng chất lượng.</strong></p>"
				+ "<div style='font-family: verdana; font-size: medium;' data-mce-style='font-family: verdana; font-size: medium;'><p>"
				+ "<strong>Kích thước:</strong>&nbsp;20cm.</p>"
				+ "<p><strong>Đường kính:</strong>&nbsp;1mm.</p>"
				+ "<p><strong>Số lượng:</strong>&nbsp;100 cây - giá 410,000đ</p>"
				+ "<p><strong>Thời gian cháy:</strong>&nbsp;20-25 phút.</p>"
				+ "<p><strong>Tác dụng:</strong>&nbsp;giảm stress, thư giãn thần kinh dịu nhẹ.&nbsp;</p>"
				+ "<p style='text-align: justify;' data-mce-style='text-align: justify;'>"
				+ "<strong>Lưu ý: không dùng cho phụ nữ cóthai.</strong>"
				+ "</p>"
				+ "</div>"
				+ "</div>";
		productDto.setDescription(detail);
		model.addAttribute("product", productDto);
		model.addAttribute("tags", tagService.findByStatus((byte)1));
		return "product-add-edit";
	}

	@RequestMapping(value = "/admin/product/edit/{id}", method = RequestMethod.GET)
	public String editProduct(HttpServletResponse response,ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		ProductDto productDto = productService.findById(id);
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		List<CategoryDto> sub = categoriesService.findByParent(productDto.getCategoryId());
		model.addAttribute("sub", sub);
		model.addAttribute("product", productDto);
		model.addAttribute("tags", tagService.findByStatus((byte)1));
		if(!StringUtil.isEmpty(productDto.getTag())) {
			String[] tagsP = productDto.getTag().split(",");
			List<String> strings = new ArrayList<String>();
			for (String s : tagsP) {
				strings.add(s);
			}
			model.addAttribute("tagsP", strings);
		}
		return "product-add-edit";
	}
	@RequestMapping(value = "/admin/product/save", method = RequestMethod.POST/*,produces = MediaType.ALL_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, headers = "Content-Type= multipart/related"*/)
	public void addEditProduct(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("product") ProductAddDto productDto) throws ServiceException, IOException, ParseException {

		request.setCharacterEncoding("UTF-8");
		productDto.setStatus((byte) 1);
		if(!StringUtil.isEmpty(productDto.getsNew())){
			productDto.setIsNew((byte)1);
		}else{
			productDto.setIsNew((byte)0);
		}
		if(!StringUtil.isEmpty(productDto.getsEffete())){
			productDto.setIsEffete((byte)1);
		}else{
			productDto.setIsEffete((byte)0);
		}
		if(!StringUtil.isEmpty(productDto.getsSale())){
			productDto.setIsSale((byte)1);
		}else{
			productDto.setIsSale((byte)0);
		}
		String path = servletContext.getRealPath("/");
		if(productDto.getFile() != null && !productDto.getFile().isEmpty()){

			String fileName = "/resources/img/products/" + RandomStringUtils.randomAlphanumeric(10)+ "_" + productDto.getFile().getOriginalFilename();
			productDto.setImg(fileName);
			OutputStream outputStream = new FileOutputStream(path + fileName);
			int bufferSize = 256;
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, bufferSize);
			bufferedOutputStream.write(productDto.getFile().getBytes());
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			outputStream.close();
		}else{
			productDto.setImg(null);
		}
		if(productDto.getFile1() != null && !productDto.getFile1().isEmpty()){
			String fileName = "/resources/img/products/" + RandomStringUtils.randomAlphanumeric(10)+ "_" + productDto.getFile1().getOriginalFilename();
			productDto.setImg1(fileName);
			OutputStream outputStream = new FileOutputStream(path + fileName);
			int bufferSize = 256;
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, bufferSize);
			bufferedOutputStream.write(productDto.getFile1().getBytes());
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			outputStream.close();
		}else{
			productDto.setImg1(null);
		}
		if(productDto.getFile2() != null && !productDto.getFile2().isEmpty()){
			String fileName = "/resources/img/products/" + RandomStringUtils.randomAlphanumeric(10)+ "_" + productDto.getFile2().getOriginalFilename();
			productDto.setImg2(fileName);
			OutputStream outputStream = new FileOutputStream(path + fileName);
			int bufferSize = 256;
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, bufferSize);
			bufferedOutputStream.write(productDto.getFile2().getBytes());
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			outputStream.close();
		}else{
			productDto.setImg2(null);
		}
		if(productDto.getId() != null){
			productService.update(productDto);
			response.sendRedirect("/admin/product/view/" + productDto.getId());
		}else{
			productService.add(productDto);
			response.sendRedirect("/admin/product/view/" + productDto.getId());
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/admin/product/view/{id}")
	public String orderDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		ProductDto productDto = productService.findById(id);
		model.addAttribute("product", productDto);
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		String imgCookie = productDto.getImg();
		if(!StringUtil.isEmpty(productDto.getImg1()))
			imgCookie = imgCookie  + "99" + productDto.getImg1();
		if(!StringUtil.isEmpty(productDto.getImg2()))
			imgCookie = imgCookie + "99" + productDto.getImg2();
		response.addCookie(new Cookie("listImg", URLEncoder.encode(imgCookie, "UTF-8") ));
		return "product-detail-admin";
	}

	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String initForm(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		ProductDto productDto = productService.findById(id);
		model.addAttribute("product", productDto);
		//Get product relation
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		if(productDto.getSubCategoryId() != null){
			productDtoList = productService.findBySubCategory(productDto.getSubCategoryId(), 6);
		}else {
			productDtoList = productService.findByCategory(productDto.getCategoryId(), 6);
		}
		model.addAttribute("relations", productDtoList);
		model.addAttribute("active", "_4");
		if(!StringUtil.isEmpty(productDto.getTag())) {
			String[] tagsP = productDto.getTag().split(",");
			List<String> strings = new ArrayList<String>();
			for (String s : tagsP) {
				strings.add(s);
			}
			model.addAttribute("tagsOf", strings);
		}
		return "product-detail";
	}

	@RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
	public String loadByCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		if(mappingCategoryDtos != null){
			for (MappingCategoryDto mappingCategoryDto: mappingCategoryDtos) {
				if(mappingCategoryDto != null){
					if(mappingCategoryDto.getCategoryDto().getId() == id){
						model.addAttribute("bre", mappingCategoryDto.getCategoryDto().getName());
					}
				}
			}
		}
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByCategory(id, 0);
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("sort", "category");
		model.addAttribute("sortValue", id + "");
		return "product-list";
	}
	@RequestMapping(value = "/sub-category/{id}", method = RequestMethod.GET)
	public String loadBySubCategory(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findBySubCategory(id, 0);
		if(mappingCategoryDtos != null){
			for (MappingCategoryDto mappingCategoryDto: mappingCategoryDtos) {
				if(mappingCategoryDto != null){
					for (CategoryDto categoryDto: mappingCategoryDto.getSuCategories()){
						if(categoryDto.getId() == id){
							model.addAttribute("bre", categoryDto.getName());
						}
					}
				}
			}
		}
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("sort", "subCategory");
		model.addAttribute("sortValue", id + "");
		return "product-list";
	}

	@RequestMapping(value = "/product/highs", method = RequestMethod.GET)
	public String loadAllProduct(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findHighlights(0);
		model.addAttribute("bre", "Sản Phẩm Nổi Bật");
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("sort", "highs");
		model.addAttribute("sortValue", "NO");
		return "product-list";
	}
	@RequestMapping(value = "/product/sales", method = RequestMethod.GET)
	public String loadAllSales(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findSale(0);
		model.addAttribute("bre", "Sản Phẩm Giảm Giá");
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_5");
		model.addAttribute("sort", "sales");
		model.addAttribute("sortValue", "NO");
		return "product-list";
	}

	@RequestMapping(value = "/searchByTag/{tag}", method = RequestMethod.GET)
	public String loadSearchByTag(HttpServletRequest request, ModelMap model, @PathVariable String tag) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("bre", tag);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByTag(tag);
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("sort", "tag");
		model.addAttribute("sortValue", tag);
		return "product-list";
	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String loadSearchByName(HttpServletRequest request, ModelMap model, @ModelAttribute("productName") String name) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("bre", name != null ? name: "tram huong");
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByName(name != null ? name: "tram huong");
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("sort", "name");
		model.addAttribute("sortValue", name);
		return "product-list";
	}
	@RequestMapping(value = "/sort", method = RequestMethod.POST)
	public String loadSort(HttpServletRequest request, ModelMap model, @ModelAttribute("sortDto") SortDto sortDto) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		model.addAttribute("bre", "Sắp xếp");
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.sort(sortDto);
		model.addAttribute("productList", productDtoList);
		model.addAttribute("active", "_4");
		model.addAttribute("selectedSort", sortDto.getSortType());
		return "product-list";
	}
	@RequestMapping(value = "/product_quitView/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductDto getQuitViewProduct(HttpServletRequest request, @PathVariable long id) throws ServiceException {
		ProductDto productDto = productService.findById(id);
		return productDto;
	}
}

