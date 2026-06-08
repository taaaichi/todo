package srevice;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import dao.TodoDao;
import entity.Todo;

public class TodoService {

	public ArrayList<Todo> getTodo() {

		ArrayList<Todo> result = null;

		try {
			result = (new TodoDao()).findAll();
		} catch (SQLException se) {
			se.printStackTrace();
		}

		return result;
	}

	public int addTodo(String title, String detail, String status, LocalDate due_date) {

		Todo t = new Todo(title, detail, status, due_date);
		try {
			(new TodoDao()).create(t);
		} catch (SQLException se) {

		}

		return 0;
	}

}
