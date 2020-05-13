package semi.dao.jw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.db.jw.JDBCUtil;
import semi.vo.jw.BidVo;

public class BidDao {
	public BidVo list(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con=JDBCUtil.getConn();
			String sql="select m_num,bid_price, to_char(systimestamp, 'YYYY/MM/DD HH24:MI:SS:ff') realdate from bid where a_num=? order by bid_price asc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			BidVo vo= new BidVo();
			if(rs.next()) {
				vo.setBid_date(rs.getString("realdate"));
				vo.setM_num(rs.getInt("m_num"));
				vo.setBid_price(rs.getInt("bid_price"));
			}
			return vo;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	public ArrayList<BidVo> list(int startrow , int endrow , int field,int a_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {	
			con=JDBCUtil.getConn();
			String sql=null;
			if(field==0) { // 검색어값이 아무것도 없을 때
				 sql = "select * from "
						+ "	("
						+ "	select aa.*, rownum rnum from"
						+ " ( "
						+ "	select m_num,bid_price, to_char(systimestamp, 'YYYY/MM/DD HH24:MI:SS:ff') realdate from bid where a_num=? order by bid_price asc"
						+ " )aa"
						+ " )where rnum>=? and rnum<=?";
				 		pstmt=con.prepareStatement(sql);
			 			pstmt.setInt(1, a_num);
			 			pstmt.setInt(2, startrow);
			 			pstmt.setInt(3, endrow);
			}else { // 검색어값이 있을 때 
				
				 sql="select * from "
						+ "	("
						+ "	select aa.*, rownum rnum from"
						+ " ( "
						+ "	select m_num,bid_price, to_char(systimestamp, 'YYYY/MM/DD HH24:MI:SS:ff') realdate from bid where a_num=? order by bid_price asc"
						+ " )aa"
						+ " )where rnum>=? and rnum<=?";
				 		pstmt=con.prepareStatement(sql);
				 		pstmt.setInt(1, a_num);
				 		pstmt.setInt(2, startrow);
				 		pstmt.setInt(3, endrow+field);
			}
			
			rs= pstmt.executeQuery();
			ArrayList<BidVo> list = new ArrayList<BidVo>();
			while(rs.next()) {
				BidVo vo = new BidVo();
				vo.setBid_date(rs.getString("realdate"));
				vo.setBid_price(rs.getInt("bid_price"));
				vo.setM_num(rs.getInt("m_num"));
				
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
