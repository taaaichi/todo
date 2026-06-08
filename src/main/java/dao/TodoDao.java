package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import entity.Todo;
import utils.DbUtil;


public class TodoDao {
	
	public ArrayList<Todo> findAll() throws SQLException {
		String sql = "select * from todos order by todo_id;";

		ArrayList<Todo> result = new ArrayList<Todo>();

		try (Connection conn = DbUtil.open();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				
							    
				Todo t = new Todo(rs.getInt("todo_id"), rs.getString("title"), rs.getString("detail"), rs.getString("status"),
						rs.getObject("due_date",LocalDate.class));
				result.add(t);
			}
		}

		return result;
	}
	
	public int create(Todo todo) throws SQLException {
		String sql1 = "insert into todos(title, detail, status, due_date) values(?, ?, ?, ?);";
		
 
		int id = 0;
 
		try (Connection conn = DbUtil.open();
				PreparedStatement stmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);) {
			stmt.setString(1, todo.getTitle());
			stmt.setString(2, todo.getDetail());
			stmt.setString(3, todo.getStatus());
			stmt.setDate(4, java.sql.Date.valueOf(todo.getDue_date()));
			int affectedRows = stmt.executeUpdate();
 
			if (affectedRows > 0) {
				try (ResultSet rs = stmt.getGeneratedKeys()) {
					if (rs.next()) {
						id = rs.getInt(1); // Retrieves the inserted ID
					}
				}
			}
		}
		return id;
	}
}
