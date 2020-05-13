package semi.controller.jhsingo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.jh.SingoDao;
import semi.vo.jh.SingoVo;

@WebServlet("/singo.list.jh")
public class SingoListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		SingoDao dao=SingoDao.getSingoDao();
		ArrayList<SingoVo> list=dao.singoAll(startRow,endRow);
		int pageCount=(int)Math.ceil(dao.getCount()/5.0);
		int startPage=(pageNum-1)/3*3+1;
		int endPage=startPage+2;
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		
		req.getRequestDispatcher("admin/adminIndex.jsp?file=allsingo.jsp").forward(req, resp);
	}
}
