package com.mju.ict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.OrderState;
import com.mju.ict.model.User;
import com.mju.ict.repository.IOrderDAO;
import com.mju.ict.repository.IOrderDetailDAO;
import com.mju.ict.repository.IOrderStateDAO;
import com.mju.ict.repository.IProductDAO;

@Service
public class OrderService implements IOrderService{

	@Autowired
	IOrderDAO orderDAO;
	
	@Autowired
	IOrderDetailDAO orderDetailDAO;
	
	@Autowired
	IOrderStateDAO orderStateDAO;
	
	@Autowired
	IProductDAO productDAO;
	
	
	
	@Override
	public List<OrderState> getAllOrderStates() {
		return orderStateDAO.selectAllOrderStates();
	}

	
	@Override
	public OrderDetail getOrderDetailById(int id) {
		return orderDAO.selectOrderDetailById(id);
	}
	
	@Override
	public OrderDetail getOrderDetailByReview(int id) {
		return orderDAO.selectOrderDetailByReview(id);
	}
	
	//주문 전체 조회
	@Override
	public List<Order> getAllOrders() {
		return orderDAO.selectAllOrders();
	}
	
	//user_id로 주문 조회
	@Override
	public List<Order> getOrderByUser(int user_id) {
		return orderDAO.selectOrderByUser(user_id);
	}

	//order_id로 주문 조회
	@Override
	public Order getOrderById(int id) {
		return orderDAO.selectOrderById(id);
	}

	//user_id로 취소 주문 조회
	@Override
	public List<Order> getCanceledOrderByUser(int user_id) {
		List<Order> orders = orderDAO.selectOrderByUser(user_id);
		List<Order> canceledOrders = new ArrayList<Order>();
		for(Order order:orders) {
			if(order.getOrder_state_id()>3) {
				canceledOrders.add(order);
			}
		}
		return canceledOrders;
	}

	//주문 등록 
	@Override
	public void addOrder(Map<String, Object> param, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Gson gson = new Gson();
		JsonParser jparser = new JsonParser();
		
		Order order = gson.fromJson(new Gson().toJson(param.get("order")).toString(), Order.class);
		
		JsonElement orderDetail = jparser.parse(param.get("orderDetail").toString());
		List <OrderDetail> orderDetailList = gson.fromJson(orderDetail, (new TypeToken<List<OrderDetail>>() {  }).getType());
		
		//회원
		if (user != null) {
			order.setUser_id(user.getUser_id());
		//비회원 
		}else {
			
		}
		
		orderDAO.insertOrder(order);
		
		//주문 디테일
		for(OrderDetail od:orderDetailList) {
			od.setOrder_id(order.getOrder_id());
			orderDetailDAO.insertOrderDetail(od);
			//상품 재고 수량
			Map<String,Integer> map = new HashMap<String,Integer>();				   
			map.put("product_id", od.getProduct_id());
			map.put("product_count", od.getProduct_count());
			productDAO.addSalesQuantity(map);
		}

	}


	@Override
	public void updateOrderTracking(int order_id, int order_tracking_number) {
		Map<String,Integer> map = new HashMap<String,Integer>();				   
		map.put("order_id", order_id);
		map.put("order_tracking_number", order_tracking_number);
		
		orderDAO.updateOrderTracking(map);
	}


	//배송상태변경 
	@Override
	public void updateOrderState(int order_id, int order_state_id) {
		//배송상태변경
		Map<String,Integer> map = new HashMap<String,Integer>();				   
		map.put("order_id", order_id);
		map.put("order_state_id", order_state_id);
		
		orderDAO.updateOrderState(map);
		
		//취소완료,반품완료,교환완료 재고와 판매량 복구
		if(order_state_id == 5 || order_state_id == 7  || order_state_id == 9 ) {
			List<OrderDetail> orderDetails = orderDetailDAO.selectOrderDetailByOrderId(order_id);
			
			for(OrderDetail od:orderDetails) {
				Map<String,Integer> map2 = new HashMap<String,Integer>();				   
				map2.put("product_id", od.getProduct_id());
				map2.put("product_count", -od.getProduct_count());
				productDAO.addSalesQuantity(map2);
			}
		}
	}



}
