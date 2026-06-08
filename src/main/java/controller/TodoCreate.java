package controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import srevice.TodoService;

/**
 * Servlet implementation class EventCreate
 */
@WebServlet("/TodoCreate")
public class TodoCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TodoCreate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		TodoService ts = new TodoService();
		request.setAttribute("todos", ts.getTodo());
		request.getRequestDispatcher("/todo_create.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TodoService as = new TodoService();
		as.addTodo(request.getParameter("title"), request.getParameter("detail"), request.getParameter("status"), LocalDate.parse(request.getParameter("due_date")));
		
		// 別のservletにリダイレクト
		 response.sendRedirect("TodoList");
		
//		request.setAttribute("events", es.getEvents());	
//		
//		request.getRequestDispatcher("/events.jsp").forward(request, response);
	}

}
