
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import java.io.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

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
	public String searchProduct(HttpServletRequest request, @ModelAttribute("searchProduct") SearchProductDto searchProductDto) throws ServiceException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		List<ProductDto> productDtos = productService.findByCondition(searchProductDto);
		session.setAttribute("products", productDtos);
		session.setAttribute("searchProduct", searchProductDto);
		return "redirect:/admin/products";
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
		return "product-add-edit";
	}

	@RequestMapping(value = "/admin/product/edit/{id}", method = RequestMethod.GET)
	public String editProduct(HttpServletRequest request,ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		ProductDto productDto = productService.findById(id);
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
		model.addAttribute("product", productDto);
		return "product-add-edit";
	}
	@RequestMapping(value = "/admin/product/save", method = RequestMethod.POST/*,produces = MediaType.ALL_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, headers = "Content-Type= multipart/related"*/)
	public String addEditProduct(HttpServletRequest request, @ModelAttribute("product") ProductAddDto productDto) throws ServiceException, IOException {

		request.setCharacterEncoding("UTF-8");
		/*productDto.setPrice(price);
		productDto.setName(name);
		productDto.setCode(code);
		productDto.setDescription(description);
		productDto.setCategoryId(categoryId);
		productDto.setSubCategoryId(subCategoryId);
		productDto.setTag(tag);
		productDto.setSalePrice(salePrice);*/
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
		if(!productDto.getFile().isEmpty()){

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
		if(!productDto.getFile1().isEmpty()){
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
		if(!productDto.getFile2().isEmpty()){
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
			return "redirect:/admin/product/view/" + productDto.getId();
		}else{
			productService.add(productDto);
			return "redirect:/admin/product/view/" + productDto.getId();
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/admin/product/view/{id}")
	public String orderDetail(HttpServletRequest request, ModelMap model, @PathVariable long id) throws ServiceException, UnsupportedEncodingException {
		ProductDto productDto = productService.findById(id);
		model.addAttribute("product", productDto);
		List<CategoryDto> categoryDtos = categoriesService.findAll();
		List<CategoryDto> subCategoryDtos = categoriesService.findAllS();
		model.addAttribute("categories", categoryDtos);
		model.addAttribute("subCategories", subCategoryDtos);
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
		return "product-list";
	}

	@RequestMapping(value = "/product/all", method = RequestMethod.GET)
	public String loadAllProduct(HttpServletRequest request, ModelMap model) throws ServiceException, UnsupportedEncodingException {
		List<MappingCategoryDto> mappingCategoryDtos = CommonController.loadCategory(categoriesService);
		model.addAttribute("mapping_categories", mappingCategoryDtos);
		model.addAttribute("mSize", mappingCategoryDtos.size());
		CommonController.loadCommon(request, model, aboutService, blogService);
		//Get list product by category
		List<ProductDto> productDtoList = new ArrayList<ProductDto>();
		productDtoList = productService.findByStatus((byte)1);
		model.addAttribute("bre", "All");
		model.addAttribute("productList", productDtoList);
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
		model.addAttribute("bre", "Sales");
		model.addAttribute("productList", productDtoList);
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
		return "product-list";
	}
	@RequestMapping(value = "/product_quitView/{id}", method = RequestMethod.GET, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductDto getQuitViewProduct(HttpServletRequest request, @PathVariable long id) throws ServiceException {
		ProductDto productDto = productService.findById(id);
		return productDto;
	}
}

