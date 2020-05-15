package semi.dao.yh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import semi.vo.yh.sellerVo;

public class SellerDao {
		private static SellerDao instance = new SellerDao();
		
		private SellerDao() {}
		
		public static SellerDao getInstance() {
			return instance;
		}
		
		public sellerVo SearchSeller(int sel_number) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = JdbcUtil.getConn();
				String sql = "select * from seller where sel_number = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sel_number);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					sellerVo vo = new sellerVo(
					rs.getLong("account"),
					rs.getInt("m_num"),
					rs.getInt("sel_number")
					);
					return vo;
				}
				return null;
			} catch (SQLException se) {
				se.printStackTrace();
				return null;
			} finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		public ArrayList<sellerVo> listAccount(int m_num1){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = JdbcUtil.getConn();
				String sql = "select * from seller where m_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, m_num1);
				rs = pstmt.executeQuery();
				ArrayList<sellerVo> list = new ArrayList<sellerVo>();
				while(rs.next()) {
					Long account = rs.getLong(1);
					int m_num = rs.getInt(2);
					int sel_number = rs.getInt(3);
					sellerVo vo=new sellerVo(account, m_num, sel_number);
					list.add(vo);
				}
				return list;
			} catch (SQLException se) {
				se.printStackTrace();
				return null;
			} finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		//계좌번호가 DB에 존재하는지 확인
		public int checkAccount(long a) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = JdbcUtil.getConn();
				String sql = "select * from seller where sel_number = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, a);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return 1;
				}
				return 0;
			} catch (SQLException se) {
				se.printStackTrace();
				return -1;
			} finally {
				JdbcUtil.close(con, pstmt, rs);
			}
		}
		// seller 테이블 인서트 
		public int InsertSeller(Long account, int sel_number, int m_num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			int n = 0;
			try {
				if(sel_number == 0) {
					con = JdbcUtil.getConn();
					String sql = "insert into seller values(?,?,seq_seller_sel_number.nextval)";
					pstmt = con.prepareStatement(sql);
					pstmt.setLong(1, account);
					pstmt.setInt(2, m_num);
					n = pstmt.executeUpdate();
					return n;
				}
				return 0; // 기존에 있던 값일 경우
			} catch (SQLException se) {
				se.printStackTrace();
				return -1;
			} finally {
				JdbcUtil.close(con, pstmt, null);
			}
		}
}
