package healthbbs;

import java.sql.*;
import java.util.ArrayList;

public class HealthBbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public HealthBbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/yangtihealth?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "yth502100";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			} return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext());
			pstmt.setString(2,  bbsTitle);
			pstmt.setString(3,  userID);
			pstmt.setString(4,  getDate());
			pstmt.setString(5,  bbsContent);
			pstmt.setInt(6,  1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<HealthBbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<HealthBbs> list = new ArrayList<HealthBbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HealthBbs healthbbs = new HealthBbs();
				healthbbs.setBbsID(rs.getInt(1));
				healthbbs.setBbsTitle(rs.getString(2));
				healthbbs.setUserID(rs.getString(3));
				healthbbs.setBbsDate(rs.getString(4));
				healthbbs.setBbsContent(rs.getString(5));
				healthbbs.setBbsAvailable(rs.getInt(6));
				list.add(healthbbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELCET * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
		ArrayList<HealthBbs> list = new ArrayList<HealthBbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber -1) *10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public HealthBbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				HealthBbs healthbbs = new HealthBbs();
				healthbbs.setBbsID(rs.getInt(1));
				healthbbs.setBbsTitle(rs.getString(2));
				healthbbs.setUserID(rs.getString(3));
				healthbbs.setBbsDate(rs.getString(4));
				healthbbs.setBbsContent(rs.getString(5));
				healthbbs.setBbsAvailable(rs.getInt(6));
				return healthbbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
