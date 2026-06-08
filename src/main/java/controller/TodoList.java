package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import srevice.TodoService;

/**
 * Servlet implementation class Athletes
 */
@WebServlet("/TodoList")
public class TodoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private AthletesService as = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoList() {
        super();
//        as = new AthletesService();
    }

	/**-
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TodoService ts = new TodoService();
		request.setAttribute("todos", ts.getTodo());
		request.getRequestDispatcher("/todo_list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
