package p_memberdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import p_memberdto.p_memberDto;
import test.util.DbcpBean;

public class p_memberDao {
	private static p_memberDao dao;
	private p_memberDao(){}
	public static p_memberDao getInstance(){
		if(dao==null){
			dao=new p_memberDao();
		}
		return dao;
	}
	
	//아이디 비밀번호가 유효한지 여부를 리턴
	public boolean isValid(p_memberDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		//아이디와 비밀번호가 맞는 정보인지 여부
		boolean isValid = false;
		try{
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM P_MEMBER WHERE id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			//?에 아이디와 비밀번호를 바인딩하고
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 해서
			rs=pstmt.executeQuery();
			while(rs.next()){
				isValid = true;
			}
		}catch(SQLException se){
			se.printStackTrace();
		}finally{
			try{
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}catch (Exception e){}
		}
		return isValid;
	}
	
}
