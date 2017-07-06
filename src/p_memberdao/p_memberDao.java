package p_memberdao;

import java.io.CharArrayReader;
import java.io.Reader;
import java.io.Writer;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import oracle.jdbc.driver.*;
import oracle.sql.CLOB;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import p_memberdto.p_memberDto;
import util.DbcpBean;

public class p_memberDao {
	private static p_memberDao dao;

	private p_memberDao() {
	}

	public static p_memberDao getInstance() {
		if (dao == null) {
			dao = new p_memberDao();
		}
		return dao;
	}

	
////////////////////////////////////////////////   시훈       ///////////////////////////////////////////////////////////////////////////////	
	// 회원목록을 리턴
		public List<p_memberDto> getList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 회원 목록을 담을 객체 생성
			List<p_memberDto> list = new ArrayList<>();
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT * FROM p_member order by mem_num asc";
				pstmt = conn.prepareStatement(sql);

				// sql문 수행하고 결과셋 받아오기
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int num = rs.getInt("mem_num");
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String addr = rs.getString("addr");
					String regdate = rs.getString("regdate");

					// 회원 한명의 정보를 p_memberDto 객체에 담는다.
					p_memberDto dto = new p_memberDto(num, id, pwd, name, phone, email, addr, regdate);

					// p_memberDto 객체의 참조값을 ArrayList에 저장
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return list;
		} //getList();	
	
	
		// 회원 정보 수정
		public boolean update1(p_memberDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "UPDATE p_member SET id=?, pwd=?, name=?, phone=?, email=?, addr=? WHERE mem_num = ?";

				// ? 에 수정할 회원의 정보 바인딩 하기

				pstmt = conn.prepareStatement(sql);	
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getAddr());
				pstmt.setInt(7, dto.getMem_num());
				
				flag = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0)
				return true;
			else
				return false;

		} // update();	

		
		
		// 인자로 전달된 번호에 해당하는 회원정보를 리턴해주는 메소드
		public p_memberDto getDataS(int num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			p_memberDto dto = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT id, pwd, name, phone, email, addr, regdate from p_member WHERE mem_num =?";
				

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);

				// select 문 수행하고 결과값을 ResultSet 으로 받아오기
				rs = pstmt.executeQuery();

				if (rs.next()) {
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");

					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String addr = rs.getString("addr");
					String regdate = rs.getString("regdate");

					dto = new p_memberDto(num, id, pwd, name, phone, email, addr, regdate);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			// 회원 한명의 정보가 담겨 있는 MemberDto 객체를 리턴해준다.
			return dto;
		}		
		
		
		
		//인자로 전달된 번호에 해당하는 회원정보를 리턴해주는 메소드
		public p_memberDto getData(int num){
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			p_memberDto dto=null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT id, pwd, name, phone, email, addr from p_member WHERE mem_num =?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				// select 문 수행하고 결과값을 ResultSet 으로 받아오기
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");
				
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String addr = rs.getString("addr");
					String regdate = rs.getString("regdate");
					
					dto = new p_memberDto(num, id, pwd, name, phone, email, addr, regdate);
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e){}
			}
			//회원 한명의 정보가 담겨 있는 MemberDto 객체를 리턴해준다.
			return dto;
		}	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	
	
	
	
	
	
////////////////////////////////////////////////  웅환       ///////////////////////////////////////////////////////////////////////////////	
		//회원가입 dao(웅환)
		public boolean insert(p_memberDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "INSERT INTO p_member(mem_num,id,pwd,name,phone,email,addr,regdate) "
						+ "VALUES(p_member_seq.NEXTVAL,?,?,?,?,?,?,SYSDATE)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getAddr());
				flag = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			if (flag > 0) {
				return true;
			} else {
				return false;
			}
		}// inert();	
	
	
		//아이디 찾기 dao(웅환)
		public String findId(String name, String email) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			p_memberDto dto = new p_memberDto();
			String id = "";
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT id FROM p_member " + "WHERE name=? AND email=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					id = rs.getString("id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();

				} catch (Exception e) {
				}
			}
			return id;

		}// findId();

		
		//비밀번호 찾기 dao(웅환)
		public String findPwd(String id, String phone){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String pwd="";
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT pwd FROM p_member " + "WHERE id=? AND phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, phone);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					pwd=rs.getString("pwd");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}return pwd;
		}//findPwd();	
	
	

		
		//아이디 중복값을 DB와 비교하기 위한 dao(웅환)
		public String isOverlab(String inputId){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String id="";
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT id FROM p_member "
						+ "WHERE id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, inputId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					id=rs.getString("id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return id;

		}// overlab();
		
		public boolean delete(String id){
			Connection conn = null;
			PreparedStatement pstmt = null;
			int flag = 0;
			try{
				conn = new DbcpBean().getConn();
				String sql = "delete from p_member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeQuery();
			}catch(SQLException se){
				se.printStackTrace();
			}finally{
				try{
					if(pstmt != null)pstmt.close();
					if(conn != null)conn.close();
				}catch(Exception e){}
			}
			if(flag>0){
				return true;
			}else{
				return false;
				}
		}//delete		
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
////////////////////////////////////////////////  기성      ///////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
////////////////////////////////////////////////  두언       ///////////////////////////////////////////////////////////////////////////////	
	// 아이디 비밀번호가 유효한지 여부를 리턴
		public boolean isValid(p_memberDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 아이디와 비밀번호가 맞는 정보인지 여부
			boolean isValid = false;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT * FROM P_MEMBER WHERE id=? and pwd=?";
				pstmt = conn.prepareStatement(sql);
				// ?에 아이디와 비밀번호를 바인딩하고
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				// select 해서
				rs = pstmt.executeQuery();
				while (rs.next()) {
					isValid = true;
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return isValid;
		} // isValid	
	

		
		// 회원 가입된 정보를 리턴해주는 메소드
		public p_memberDto getData(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			p_memberDto dto = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT pwd,name,phone,email,addr,regdate FROM p_member WHERE id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new p_memberDto();
					dto.setId(id);
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setAddr(rs.getString("addr"));
					dto.setRegdate(rs.getString("regdate"));
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return dto;
		}		
	

		
		
		//회원정보를 수정하는 메소드 
		public boolean update(p_memberDto dto){
			Connection conn=null;
			PreparedStatement pstmt=null;
			int flag=0;
			try{
				conn = new DbcpBean().getConn();
				String sql ="update p_member set pwd=?,name=?,phone=?,email=?,addr=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPwd());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPhone());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getAddr());
				pstmt.executeQuery();
			}catch(SQLException se){
				se.printStackTrace();
			}finally{
				try{
					if(pstmt !=null)pstmt.close();
					if(conn !=null)conn.close();
				}catch(Exception e){}
				if(flag >0){
					return true;
				}else{
					return false;
				}
			}
		}
				
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	

	
	
	
	
	
	
	
	
////////////////////////////////////////////////  재두       ///////////////////////////////////////////////////////////////////////////////	
	
		//고객센터 페이지 문의하러 가기에서 
		//폼에 회원 정보가져오는 service getdata (재두)
		public p_memberDto sergetData(String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			p_memberDto dto = null;
			try {
				conn = new DbcpBean().getConn();
				String sql = "SELECT mem_num,name,email FROM p_member" + " WHERE id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new p_memberDto();
					dto.setMem_num(Integer.parseInt(rs.getString("mem_num")));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return dto;
		}	
	
	
		//고객센터 페이지 문의하러 가기에서 
		//service insert(재두) 
		public boolean serinsert(int mem_num, String s_content) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int flag = 0;
			try {
				conn = new DbcpBean().getConn();
				conn.setAutoCommit(false);
				String strQuery = "INSERT INTO p_service(mem_num,s_content) " + "VALUES(?,EMPTY_CLOB())";
				pstmt = conn.prepareStatement(strQuery);
				pstmt.setInt(1, mem_num);
				flag = pstmt.executeUpdate();
				pstmt.close();

				if(flag == 1) {
					strQuery = "SELECT s_content FROM p_service WHERE mem_num = ? FOR UPDATE";
					pstmt = conn.prepareStatement(strQuery);
					pstmt.setInt(1, mem_num);
					rs = pstmt.executeQuery();
					
					String strCLOB=s_content;
					if(rs.next()) {
						CLOB clob = ((OracleResultSet)rs).getCLOB("s_content");
						Writer writer = clob.getCharacterOutputStream();
						Reader reader = new CharArrayReader(strCLOB.toCharArray());
						char[] buffer = new char[1024];
						int read = 0;
						
						while((read = reader.read(buffer, 0, 1024)) != -1) {
							writer.write(buffer, 0, read);
						}
						reader.close();
						writer.close();
					}
					conn.commit();
					conn.setAutoCommit(true);
					rs.close();
				}
				conn.close();			
			} catch (Exception e) {
				e.printStackTrace();
			} if(flag==1){
				return true;
			} else {
				return false;
			}
		}// serinert();	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
	
	

}	// Class

