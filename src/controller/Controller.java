package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommentDAO;
import model.RegiLocationDAO;
import model.RegiPeopleDAO;
import model.domain.CommentDTO;
import model.domain.RegiLocationDTO;
import model.domain.RegiPeopleDTO;

public class Controller extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getParameter("command");
		
		if (command.equals("register_people")) {
			// db�� ��� ����
			System.out.println("�������� ����");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);

			try {
				
				java.sql.Timestamp today= new java.sql.Timestamp(new java.util.Date().getTime());
				
				long sys_time = System.currentTimeMillis();
				java.util.Date sys_time1 =  new Date(sys_time);
				java.util.Date insert_date = fmt.parse(request.getParameter("date")+" "+request.getParameter("time") + ":00");
				
				java.sql.Date sqlDate1 = new Date(insert_date.getTime());
				
				java.sql.Date sqlDate2 = new Date(sys_time1.getTime());
				
				
				RegiPeopleDTO insert_regi = new RegiPeopleDTO( 
																						request.getParameter("title"),
																						request.getParameter("city"), 
																						sqlDate1, 
																						sqlDate2,
																						Integer.parseInt(request.getParameter("number")), 
																						request.getParameter("age"),
																						request.getParameter("gender"), 
																						"����",
																						"�Ϳ��", 
																						(float) 127.1052208, 
																						(float) 37.3595122,
																						request.getParameter("detail"));
				

				try {
					RegiPeopleDAO.insertRegi(insert_regi);
					request.setAttribute("insertData", insert_regi);
					request.getRequestDispatcher("result.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}

		} else if (command.equals("get_location")) {																	//��ҰԽ��� �ҷ�����
			System.out.println("��� ������ȸ ����");
			// db���� ��ȸ
			ArrayList<RegiLocationDTO> regi;
			try {
				regi = RegiLocationDAO.getRegiAll();
				request.setAttribute("msg", "locReq");
				request.setAttribute("regiLocationData", regi);
				// request.getRequestDispatcher("location_list.jsp").forward(request,
				// response);
				request.getRequestDispatcher("main.jsp").forward(request, response);
				System.out.println("��� ������ȸ ����Ϸ�");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if (command.equals("register_location")) {
			// db�� ��� ����
			System.out.println("�������� ����");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			java.sql.Timestamp today= new java.sql.Timestamp(new java.util.Date().getTime());

			try {
				java.util.Date insert_date = fmt.parse("2015-08-20 12:00:00");
				java.sql.Date sqlDate1 = new Date(insert_date.getTime());
				java.sql.Date sqlDate2 = new Date(insert_date.getTime());

				RegiLocationDTO insert_regi = new RegiLocationDTO(request.getParameter("title"),
						request.getParameter("city"), sqlDate1, sqlDate2, "�߱�", "bosomi56",
						request.getParameter("detail"));

				try {
					RegiLocationDAO.insertRegi(insert_regi);
					request.setAttribute("insertData", insert_regi);
					request.getRequestDispatcher("result.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}

			/*private int article_number; //�� �ѹ�
			private String nickname; //�г���
			private int comment_number; //��� �ѹ�
			private Date comm_regi_time; //��� ��� �ð�
			private String comm; //��� ����
*/
		} else if(command.equals("register_comment")) {
			System.out.println("1");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			//�ҷ�����
			ArrayList<CommentDTO> data;
			try {
				java.util.Date insert_date = fmt.parse("2015-08-20 12:00:00");
				java.sql.Date sqlDate1 = new Date(insert_date.getTime());
				java.sql.Timestamp today= new java.sql.Timestamp(new java.util.Date().getTime());
				
				//int article_number = Integer.parseInt(request.getParameter("article_number"));
				//int comment_number = Integer.parseInt(request.getParameter("comment_number"));
				//String comm = ;
				//String nickname = request.getParameter("nickname");
				
				CommentDTO insert_comm = new CommentDTO(1, "����", today, request.getParameter("comm"), "777kaka");
				//request.getParameter("comm");
				
				try {
					System.out.println("2");
					CommentDAO.insertComm(insert_comm);
					request.setAttribute("insertComm",  insert_comm);
					//request.getRequestDispatcher("comment.jsp").forward(request, response);
				
				
					try {
						System.out.println("3");
						data = CommentDAO.getCommAll();
						request.setAttribute("msg", "commReq");
						request.setAttribute("commData", data);
						request.getRequestDispatcher("comment.jsp").forward(request, response);
					
					} catch (SQLException e) {
						System.out.println("4");
						e.printStackTrace();
					}
				}catch (SQLException e) {
					System.out.println("5");
					e.printStackTrace();
				}
			} catch (ParseException e) {
				System.out.println("6");
				e.printStackTrace();
			}
				
			
			
			
		}else if (command.equals("get_people")) {																					//����Խ��� �ҷ�����
			System.out.println("������ȸ ����");
			// db���� ��ȸ
			ArrayList<RegiPeopleDTO> regi;
			try {
				regi = RegiPeopleDAO.getRegiAll();
				request.setAttribute("msg", "peoReq");
				request.setAttribute("regiPeopleData", regi);
				// request.getRequestDispatcher("location_list.jsp").forward(request,
				// response);
				request.getRequestDispatcher("main.jsp").forward(request, response);
				System.out.println("��� ������ȸ ����Ϸ�");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("get_comment")) {
			System.out.println("����� �ҷ��ɴϴ�. ���δ�.");
			ArrayList<CommentDTO> data;
			try {
				data = CommentDAO.getCommAll();
				request.setAttribute("msg", "commReq");
				request.setAttribute("commData", data);
				request.getRequestDispatcher("comment.jsp").forward(request, response);
				//System.out.println("�����ȸ �����Ͽ����ϴ�. ���δ�.");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("register_comment_1")) {
			System.out.println("��� ��� ����");
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			try {
				java.util.Date insert_date = fmt.parse("2015-08-20 12:00:00");
				java.sql.Date sqlDate1 = new Date(insert_date.getTime());
				java.sql.Timestamp today= new java.sql.Timestamp(new java.util.Date().getTime());
				
				//int article_number = Integer.parseInt(request.getParameter("article_number"));
				//int comment_number = Integer.parseInt(request.getParameter("comment_number"));
				//String comm = ;
				//String nickname = request.getParameter("nickname");
				
				CommentDTO insert_comm = new CommentDTO(1, "����", today, request.getParameter("comm"), "777kaka");
				//request.getParameter("comm");
				
				try {
					
					CommentDAO.insertComm(insert_comm);
					request.setAttribute("insertComm",  insert_comm);
					request.getRequestDispatcher("comment.jsp").forward(request, response);
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		}
	}

}
