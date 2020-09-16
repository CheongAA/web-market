package com.mju.ict.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mju.ict.model.Answer;
import com.mju.ict.model.Brand;
import com.mju.ict.model.Category;
import com.mju.ict.model.Discount;
import com.mju.ict.model.Notice;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderState;
import com.mju.ict.model.Product;
import com.mju.ict.model.Question;
import com.mju.ict.model.QuestionCategory;
import com.mju.ict.model.User;
import com.mju.ict.service.IAnswerService;
import com.mju.ict.service.IBrandService;
import com.mju.ict.service.ICategoryService;
import com.mju.ict.service.IDiscountService;
import com.mju.ict.service.INoticeService;
import com.mju.ict.service.IOrderService;
import com.mju.ict.service.IProductService;
import com.mju.ict.service.IQuestionService;
import com.mju.ict.service.IUserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IAnswerService answerService;
	@Autowired
	IBrandService brandService;
	@Autowired
	ICategoryService categoryService;
	@Autowired
	IDiscountService discountService;
	@Autowired
	INoticeService noticeService;
	@Autowired
	IOrderService orderService;
	@Autowired
	IProductService productService;
	@Autowired
	IQuestionService questionService;
	@Autowired
	IUserService userService;

	// DATE 형 변환
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAdminIndex() {
		return "admin/index";
	}

	/////////////// 상품//////////////////
	// 상품 목록 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getProducts(Model model) {
		List<Product> products = productService.getAllProducts();

		model.addAttribute("products", products);
		return "admin/product/list";
	}

	// 상품 상세 페이지
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable int id, Model model) {
		Product product = productService.getProductById(id);

		model.addAttribute("product", product);
		return "admin/product/detail";
	}

	// 상품 등록 페이지
	@RequestMapping(value = "/product/add", method = RequestMethod.GET)
	public String getProductAdd(Model model) {
		List<Category> categories = categoryService.getAllCategories();
		List<Brand> brands = brandService.getAllBrands();

		model.addAttribute("categories", JSONArray.fromObject(categories));
		model.addAttribute("brands", brands);
		return "admin/product/add";
	}

	// 상품 수정 페이지
	@RequestMapping(value = "/product/update/{id}", method = RequestMethod.GET)
	public String getProductUpdate(@PathVariable int id, Model model) {
		List<Category> categories = categoryService.getAllCategories();
		List<Brand> brands = brandService.getAllBrands();
		Product product = productService.getProductById(id);

		model.addAttribute("categories", JSONArray.fromObject(categories));
		model.addAttribute("brands", brands);
		model.addAttribute("product", product);

		return "admin/product/update";
	}

	// 상품등록
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute @Valid Product product, BindingResult result,
			@RequestParam("product_img") MultipartFile img, @RequestParam("product_descImg") MultipartFile descImg) {
		productService.registerProduct(product, img, descImg);

		return "redirect:/admin/product/";
	}

	// 상품수정
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute @Valid Product product, BindingResult result, Model model,
			@RequestParam("img") MultipartFile img, @RequestParam("descImg") MultipartFile descImg) {
		productService.updateProduct(product, img,descImg);
		return "redirect:/admin/product/" + product.getProduct_id();
	}

	// 상품삭제
	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id, Model model) {
		productService.deleteProductById(id);
		return "redirect:/admin/product/";
	}

	// 상품 on_sale(노출) 변경
	@RequestMapping(value = "/sale/{id}", method = RequestMethod.GET)
	public String changeProductSale(@PathVariable int id, Model model) {
		productService.changeProductSale(id);
		return "redirect:/admin/product/";
	}

	/////////////// 할인//////////////////

	// 할인 목록 페이지
	@RequestMapping(value = "/discount", method = RequestMethod.GET)
	public String getDiscounts(Model model) {
		List<Discount> discounts = discountService.getAllDiscounts();

		model.addAttribute("discounts", discounts);
		return "admin/discount/list";
	}

	// 할인 상세 페이지
	@RequestMapping(value = "/discount/{id}", method = RequestMethod.GET)
	public String getDiscountDetail(@PathVariable int id, Model model) {
		Discount discount = discountService.getDiscountById(id);
		List<Product> products = productService.getProductsByDiscount(id);

		model.addAttribute("discount", discount);
		model.addAttribute("products", products);
		return "admin/discount/detail";
	}

	// 할인 등록 페이지
	@RequestMapping(value = "/discount/add", method = RequestMethod.GET)
	public String getDiscountAdd(Model model) {
		List<Product> products = productService.getAllProducts();

		model.addAttribute("products", products);
		return "admin/discount/add";
	}

	// 할인 수정 페이지
	@RequestMapping(value = "/discount/update/{id}", method = RequestMethod.GET)
	public String getDiscountUpdate(@PathVariable int id, Model model) {
		Discount discount = discountService.getDiscountById(id);

		model.addAttribute("discount", discount);
		return "admin/discount/update";
	}

	// 할인 등록
	@RequestMapping(value = "/discount", method = RequestMethod.POST)
	public String addDiscount(@RequestParam("product[]") int[] productArr, @ModelAttribute @Valid Discount discount,
			BindingResult result, Model model, MultipartFile file) {
		discountService.registerDiscount(discount, productArr, file);

		return "redirect:/admin/discount";
	}

	// 할인 discount_apply(상단노출) 변경
	@RequestMapping(value = "/discountApply/{id}", method = RequestMethod.GET)
	public String changeDiscountApply(@PathVariable int id, Model model) {
		discountService.changeDiscountApply(id);
		return "redirect:/admin/discount/";
	}

	/////////////// 카테고리//////////////////

	// 카테고리 목록,등록 페이지
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String getCategoryAdd(Model model) {
		List<Category> categories = categoryService.getAllCategories();

		model.addAttribute("categories", categories);
		return "admin/category/add";
	}

	// 카테고리 상세 페이지
	@RequestMapping(value = "/category/{category_code}", method = RequestMethod.GET)
	public String getCategoryDetail(@PathVariable int category_code, Model model) {
		Category category = categoryService.getCategoryByCode(category_code);
		List<Product> products = productService.getProductsByCategory(category_code);

		model.addAttribute("category", category);
		model.addAttribute("products", products);
		return "admin/category/detail";
	}

	// 카테고리 수정 페이지
	@RequestMapping(value = "/category/update/{category_code}", method = RequestMethod.GET)
	public String getCategoryUpdate(@PathVariable int category_code, Model model) {
		Category category = categoryService.getCategoryByCode(category_code);
		model.addAttribute("category", category);
		return "admin/category/update";
	}

	// 카테고리 등록
	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute @Valid Category category, BindingResult result, Model model) {
		categoryService.registerCategory(category);

		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);

		return "redirect:/admin/category";
	}

	// 카테고리 수정
	@RequestMapping(value = "/category/update", method = RequestMethod.POST)
	public String updateCategory(@ModelAttribute @Valid Category category, BindingResult result, Model model) {
		categoryService.updateCategory(category);
		return "redirect:/admin/category/" + category.getCategory_code();
	}

	// 카테고리 삭제
	@RequestMapping(value = "/category/delete/{category_code}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable int category_code, Model model) {
		categoryService.deleteCategoryByCode(category_code);
		return "redirect:/admin/category";
	}

	/////////////// 고객//////////////////

	/// 고객 목록 페이지
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getUsers(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "admin/user/list";
	}

	// 고객 상세 페이지
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String getUserDetail(@PathVariable int id, Model model) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user/detail";
	}

	/////////////// 브랜드//////////////////

	/// 브랜드 목록 페이지
	@RequestMapping(value = "/brand", method = RequestMethod.GET)
	public String getBrands(Model model) {
		List<Brand> brands = brandService.getAllBrands();
		model.addAttribute("brands", brands);
		return "admin/brand/list";
	}

	// 브랜드 상세 페이지
	@RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
	public String getBrandDetail(@PathVariable int id, Model model) {
		Brand brand = brandService.getBrandById(id);
		List<Product> products = productService.getProductsByBrand(id);

		model.addAttribute("brand", brand);
		model.addAttribute("products", products);
		return "admin/brand/detail";
	}

	// 브랜드등록 페이지
	@RequestMapping(value = "/brand/add", method = RequestMethod.GET)
	public String getBrandAdd(Model model) {
		return "admin/brand/add";
	}

	// 브랜드 수정 페이지
	@RequestMapping(value = "/brand/update/{id}", method = RequestMethod.GET)
	public String getBrandUpdate(@PathVariable int id, Model model) {
		Brand brand = brandService.getBrandById(id);
		model.addAttribute("brand", brand);
		return "admin/brand/update";
	}

	// 브랜드 등록
	@RequestMapping(value = "/brand/add", method = RequestMethod.POST)
	public String addBrand(@ModelAttribute @Valid Brand brand, BindingResult result, MultipartFile file) {
		brandService.registerBrand(brand, file);
		return "redirect:/admin/brand";
	}

	// 브랜드 수정
	@RequestMapping(value = "/brand/update", method = RequestMethod.POST)
	public String updateBrand(@ModelAttribute @Valid Brand brand, BindingResult result, MultipartFile file,
			Model model) {
		brandService.updateBrand(brand, file);
		return "redirect:/admin/brand/" + brand.getBrand_id();
	}

	// 브랜드 삭제
	@RequestMapping(value = "/brand/delete/{id}", method = RequestMethod.GET)
	public String deleteBrand(@PathVariable int id, Model model) {
		brandService.deleteBrandById(id);
		return "redirect:/admin/brand";
	}

	/////////////// 공지사항//////////////////

	// 공지사항 목록 페이지
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String getNotices(Model model) {
		List<Notice> notices = noticeService.getAllNotices();
		model.addAttribute("notices", notices);
		return "admin/notice/list";
	}

	// 공지사항 상세 페이지
	@RequestMapping(value = "/notice/{id}", method = RequestMethod.GET)
	public String getNoticeDetail(@PathVariable int id, Model model) {
		Notice notice = noticeService.getNoticeById(id);

		model.addAttribute("notice", notice);
		return "admin/notice/detail";
	}

	// 공지사항 등록 페이지
	@RequestMapping(value = "/notice/add", method = RequestMethod.GET)
	public String getNoticeAdd(Model model) {
		return "admin/notice/add";
	}

	// 공지사항 수정 페이지
	@RequestMapping(value = "/notice/update/{id}", method = RequestMethod.GET)
	public String getNoticeUpdate(@PathVariable int id, Model model) {
		Notice notice = noticeService.getNoticeById(id);

		model.addAttribute("notice", notice);
		return "admin/notice/update";
	}

	// 공지사항 등록
	@RequestMapping(value = "/notice/add", method = RequestMethod.POST)
	public String addNotice(@ModelAttribute @Valid Notice notice, BindingResult result) {
		noticeService.registerNotice(notice);
		return "redirect:/admin/notice";
	}

	// 공지사항 수정
	@RequestMapping(value = "/notice/update/{id}", method = RequestMethod.POST)
	public String updateNotice(@ModelAttribute @Valid Notice notice, BindingResult result, Model model) {
		noticeService.updateNotice(notice);
		return "redirect:/admin/notice/" + notice.getNotice_id();
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/delete/{id}", method = RequestMethod.GET)
	public String deleteNotice(@PathVariable int id, Model model) {
		noticeService.deleteNoticeById(id);
		return "redirect:/admin/notice";
	}
	/////////////// 주문//////////////////

	// 주문 조회 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String getOrders(Model model) {
		List<Order> orders = orderService.getAllOrders();
		model.addAttribute("orders", orders);
		return "admin/order/list";
	}

	// 주문 상세 페이지
	@RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
	public String getOrderDetail(@PathVariable int id, Model model) {
		Order order = orderService.getOrderById(id);
		List<OrderState> orderStates = orderService.getAllOrderStates();
		model.addAttribute("order", order);
		model.addAttribute("orderStates", orderStates);
		return "admin/order/detail";
	}

	// 주문 운송장번호 변경
	@ResponseBody
	@RequestMapping(value = "/order/updateTracking", method = RequestMethod.GET)
	public void updateOrderTracking(HttpServletRequest req, Model model) {
		orderService.updateOrderTracking(req.getParameter("orderId"), req.getParameter("orderTrackingNumber"));
	}

	// 주문 상태 변경
	@ResponseBody
	@RequestMapping(value = "/order/updateState", method = RequestMethod.GET)
	public void updateOrderState(HttpServletRequest req, Model model) {
		orderService.updateOrderState(req.getParameter("orderId"), req.getParameter("orderStateId"));
	}

	/////////////// 문의 및 답변//////////////////

	// 문의 목록 페이지
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public String getQuestions(Model model) {
		List<Question> questions = questionService.getAllQuestion();
		model.addAttribute("questions", questions);
		return "admin/question/list";
	}

	// 문의 상세 페이지
	@RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
	public String getQuestionDetail(@PathVariable int id, Model model) {
		Question question = questionService.getQuestionById(id);
		model.addAttribute("question", question);
		return "admin/question/detail";
	}

	// 자주하는 질문 목록 페이지
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String getFaqs(Model model) {
		List<Answer> answers = answerService.getFaqAnswers();
		model.addAttribute("answers", answers);
		return "admin/question/faq-list";
	}

	// 자주하는 질문 상세 페이지
	@RequestMapping(value = "/faq/{id}", method = RequestMethod.GET)
	public String getFaqDetail(@PathVariable int id, Model model) {
		Answer answer = answerService.getAnswerById(id);
		model.addAttribute("answer", answer);
		return "admin/question/faq-detail";
	}

	// 답변, 자주하는 질문 등록 페이지
	@RequestMapping(value = "/answer/add/{id}", method = RequestMethod.GET)
	public String getAnswerAdd(@PathVariable int id, Model model) {
		Question question = questionService.getQuestionById(id);

		if (question == null) {
			List<QuestionCategory> questionCategories = questionService.getAllQuestionCategories();
			model.addAttribute("questionCategories", questionCategories);
		}
		model.addAttribute("question", question);
		return "admin/question/answer-add";
	}

	// 답변 , 자주하는 질문 수정 페이지
	@RequestMapping(value = "/answer/update/{id}", method = RequestMethod.GET)
	public String getAnswerUpdate(@PathVariable int id, Model model) {
		Answer answer = answerService.getAnswerById(id);

		if (answer.getQuestion_category_id() != 0) {
			List<QuestionCategory> questionCategories = questionService.getAllQuestionCategories();
			model.addAttribute("questionCategories", questionCategories);
		}

		model.addAttribute("answer", answer);
		return "admin/question/answer-update";
	}

	// 답변 , 자주하는질문 등록
	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public String addAnswer(@ModelAttribute @Valid Answer answer, @RequestParam int question_id, BindingResult result) {
		answerService.registerAnswer(answer, question_id);
		// 자주하는 질문
		if (question_id == 0) {
			return "redirect:/admin/faq";
		}
		return "redirect:/admin/question/" + question_id;
	}

	// 답변, 자주하는 질문 수정
	@RequestMapping(value = "/answer/update", method = RequestMethod.POST)
	public String updateAnswer(@ModelAttribute @Valid Answer answer, BindingResult result, Model model) {
		answerService.updateAnswer(answer);

		if (answer.getQuestion_category_id() == 0) {
			return "redirect:/admin/question/" + answer.getAnswer_id();
		}

		return "redirect:/admin/faq/" + answer.getAnswer_id();
	}

	// 답변, 자주하는 질문 삭제
	@RequestMapping(value = "/answer/delete/{id}", method = RequestMethod.GET)
	public String deleteAnswer(@PathVariable int id, Model model) {
		answerService.deleteAnswerById(id);
		return "redirect:/admin/faq";
	}
}
