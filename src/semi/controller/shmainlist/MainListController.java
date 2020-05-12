package semi.controller.shmainlist;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.controller.shdao.MainListDao;
import semi.controller.shvo.SHAuctionVo;
@WebServlet("/mainlist.do")
public class MainListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MainListDao dao=new MainListDao();
		ArrayList<SHAuctionVo> list=dao.AllList();
		for(int i=0; i<list.size(); i++) {
			
			list.get(i);
		}
		
		req.getRequestDispatcher("/main_sh/main.jsp").forward(req, resp);
	}
}
