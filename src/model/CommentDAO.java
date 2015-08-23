package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.domain.CommentDTO;
import util.DBUtil;

public class CommentDAO {
	
	//INSERT
	public static int insertComm(CommentDTO comm) throws SQLException {
		int result =0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into comment_table values(?,?,comm_num_seq2.nextval,?,?,?)");
			
			pstmt.setInt(1, comm.getArticle_number());
			pstmt.setString(2,  comm.getNickname());
			pstmt.setTimestamp(3, comm.getComm_regi_time());
			pstmt.setString(4, comm.getComm());
			pstmt.setString(5, comm.getKakao_key());
			
			result = pstmt.executeUpdate();
		} finally {
			DBUtil.close(con, pstmt);
		}
		return result;
	}
	
	public static CommentDTO getCommAll(int comment_number) throws SQLException {
		CommentDTO comm = null;
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		try {
			con = DBUtil.getConnection(); //select * from comment_table order by COMMENT_NUM desc;
			pstmt = con.prepareStatement("select * from comment_table where comment_num=?");
			pstmt.setInt(3, comment_number);
			rset = pstmt.executeQuery();
			rset.next();
			comm = new CommentDTO ( rset.getInt(1), rset.getString(2), rset.getInt(3), rset.getTimestamp(4), rset.getString(5), rset.getString(6));
			
		} finally {
			DBUtil.close(con, pstmt);
		}
		return comm;
	}
	
	public static ArrayList<CommentDTO> getCommAll() throws SQLException {
		ArrayList<CommentDTO> data = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from comment_table order by COMMENT_NUM desc");
			rset = pstmt.executeQuery();
			data = new ArrayList<CommentDTO>();
			while(rset.next()) {
				data.add(new CommentDTO(rset.getInt(1), rset.getString(2), rset.getInt(3), rset.getTimestamp(4), rset.getString(5), rset.getString(6)));
			}
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return data;
	}
	
	/*private int article_number; //글 넘버
	private String nickname; //닉네임
	private int comment_number; //댓글 넘버
	private Date comm_regi_time; //댓글 등록 시간
	private String comm; //댓글 내용
	*/
}
