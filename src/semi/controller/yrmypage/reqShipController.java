package semi.controller.yrmypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import semi.dao.yr.ReqShipDao;
import semi.dao.yr.ShipDao;
import semi.vo.yr.PaymentVo;

@WebServlet("/popup/reqShipPopup.do")
public class reqShipController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//주문자 정보
		String spaynum = req.getParameter("paynum");
		String sanum = req.getParameter("anum");
//		System.out.println("paynum"+spaynum);
		
		ReqShipDao dao = new ReqShipDao();
		
		int paynum = Integer.parseInt(spaynum);
		PaymentVo buyerInfo = dao.getBuyerInfo(paynum); 
		
		req.setAttribute("anum", sanum);
		req.setAttribute("buyerInfo", buyerInfo);
		req.getRequestDispatcher("/popup/reqShipPopup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String courier = req.getParameter("courier");
		String invoicenum = req.getParameter("invoicenum");
		String anum = req.getParameter("anum");
		
		JSONObject data = new JSONObject();
		PrintWriter out = resp.getWriter();
		
		System.out.println(courier + ", "+invoicenum + ", "+ anum);
		
		ShipDao dao = new ShipDao();
		int n = dao.updateShipInfo(Integer.parseInt(anum), courier, invoicenum);
		
		if(n>0) {
			data.put("message", "success");
		}else {
			data.put("message", "fail");
		}
		
		out.print(data);
		out.close();
	}
}
