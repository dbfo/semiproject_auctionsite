package semi.dao.jw;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import semi.db.jw.JDBCUtil;
import semi.vo.jw.BidVo;

public class AuctionDao {
	private static AuctionDao instance = new AuctionDao();
	private AuctionDao() {};
	public static AuctionDao getInstance() {
		return instance;
	}
	public Date enddate(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql="select a_enddate from auction where a_num=?";
		//String sql="select to_char(hiredate,'YYYY-MM-DD HH24:MI:SS') date1 from emp where empno=?";
		try{
			con= JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			Date enddate =null;
			if(rs.next()) {
				enddate=rs.getDate(1);
				System.out.println(enddate);
			}
			return enddate;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
}
