package main;

import java.sql.SQLException;
import java.util.ArrayList;

import model.CommentDAO;
import model.domain.CommentDTO;

public class Main {

	public static void main(String[] args) {
			ArrayList<CommentDTO> data = null;
		
		try {
			data = CommentDAO.getCommAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		for(int i=0 ; i<data.size() ;i++) {
			System.out.println(data.get(i));
		}
		
	}

}
