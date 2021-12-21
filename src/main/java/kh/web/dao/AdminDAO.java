package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.DashboardDTO;
import kh.web.dto.ExhibitionDTO;
import kh.web.dto.MemberDTO;

public class AdminDAO {
	private static AdminDAO instance = null;

	public static AdminDAO getInstance(){
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private AdminDAO() {}


	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public boolean login(String id, String pw) throws Exception {
		String sql = "select * from admin where admin_id = ? and admin_pw = ?";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
		
			return rs.next();
		}
	}
	
	public int insertEx(ExhibitionDTO dto) throws Exception {
		String sql = "insert into exhibition values(?, ?, ?, ?, ?, ?, ?, ?)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, dto.getEx_id());
			pstmt.setString(2, dto.getEx_title());
			pstmt.setString(3, dto.getEx_desc());
			pstmt.setInt(4, dto.getEx_price());
			pstmt.setString(5, dto.getEx_location());
			pstmt.setInt(6, dto.getEx_score());
			pstmt.setDate(7, dto.getEx_start_date());
			pstmt.setDate(8, dto.getEx_end_date());
			int result = pstmt.executeUpdate();
			conn.commit();
			return result;
		}
	}
	
	public int insertExImg(int exi_seq, String exi_oriName, String exi_sysName, String exi_ex_id) throws Exception {
		String sql = "insert into exhibitionimg values(?, ?, ?, ?)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setInt(1, exi_seq);
			pstmt.setString(2, exi_oriName);
			pstmt.setString(3, exi_sysName);
			pstmt.setString(4, exi_ex_id);
			int result = pstmt.executeUpdate();
			conn.commit();
			return result;
		}
	}
	
	public List<MemberDTO> selectAllMember() throws Exception {
		String sql = "select * from member order by mem_signup_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			MemberDTO mDto = null;
			while(rs.next()) {
				String mem_id = rs.getString("mem_id");
				String mem_pw = rs.getString("mem_pw");
				String mem_name = rs.getString("mem_name");
				String mem_birth = rs.getString("mem_birth");
				String mem_email = rs.getString("mem_email");
				String mem_phone = rs.getString("mem_phone");
				String mem_zipcode = rs.getString("mem_zipcode");
				String mem_addr1 = rs.getString("mem_addr1");
				String mem_addr2 = rs.getString("mem_addr2");
				Date mem_signup_date = rs.getDate("mem_signup_date");
				String mem_grade = rs.getString("mem_grade");
				String mem_account = rs.getString("mem_account");
				
				mDto = new MemberDTO(mem_id, mem_pw, mem_name, mem_birth, mem_email, mem_phone, mem_zipcode, mem_addr1, mem_addr2, mem_signup_date, mem_grade, mem_account);
				list.add(mDto);
			}
			return list;
		}
	}
	
	public List<DashboardDTO> selectMonthlyData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS mem_signup_date, NVL(SUM(a.cnt), 0) cnt FROM ( SELECT TO_CHAR(mem_signup_date, 'YYYY-MM-DD') AS mem_signup_date, COUNT(*) cnt FROM member WHERE mem_signup_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY mem_signup_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.mem_signup_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String mem_signup_date = rs.getString("mem_signup_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(mem_signup_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	public List<DashboardDTO> selectDailyData() throws Exception {
		String sql = "select TO_CHAR(mem_signup_date, 'YYYY-MM-DD') as mem_signup_date, count(*) as cnt from member where mem_signup_date >='20210101' and mem_signup_date <= to_char(sysdate+1,'YYYY-MM-DD') GROUP BY to_char(mem_signup_date, 'YYYY-MM-DD') order by mem_signup_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String mem_signup_date = rs.getString("mem_signup_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(mem_signup_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	public List<DashboardDTO> selectMonthlyVisitData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS bk_ex_visit_date, NVL(SUM(a.cnt), 0) cnt FROM ( SELECT TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') AS bk_ex_visit_date, COUNT(*) cnt FROM book WHERE bk_ex_visit_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY bk_ex_visit_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.bk_ex_visit_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String bk_ex_visit_date = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(bk_ex_visit_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	public List<DashboardDTO> selectDailyVisitData() throws Exception {
		String sql = "select TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') as bk_ex_visit_date, count(*) as cnt from book where bk_ex_visit_date >='20210101' and bk_ex_visit_date <= to_char(sysdate+1,'YYYY-MM-DD') GROUP BY to_char(bk_ex_visit_date, 'YYYY-MM-DD') order by bk_ex_visit_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String bk_ex_visit_date = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(bk_ex_visit_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	public List<DashboardDTO> selectMonthlyRevenueData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS bk_ex_visit_date, NVL(SUM(a.sum), 0) sum FROM ( SELECT TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') AS bk_ex_visit_date, sum(bk_ex_price) as sum FROM book WHERE bk_ex_visit_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY bk_ex_visit_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.bk_ex_visit_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String bk_ex_visit_date = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("sum");
				dDto = new DashboardDTO(bk_ex_visit_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	
	public List<DashboardDTO> selectDailyRevenueData() throws Exception {
		String sql = "select TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') as bk_ex_visit_date, sum(bk_ex_price) as sum from book where bk_ex_visit_date >='20210101' and bk_ex_visit_date <= to_char(sysdate+1,'YYYY-MM-DD') GROUP BY to_char(bk_ex_visit_date, 'YYYY-MM-DD') order by bk_ex_visit_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String bk_ex_visit_date = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("sum");
				dDto = new DashboardDTO(bk_ex_visit_date,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
}
