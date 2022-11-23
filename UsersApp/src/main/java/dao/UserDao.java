package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/userdb";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345678";
	
	private static final String INSERT_USER_DETAILS_SQL = "INSERT INTO users" + "  (name, surname, gender, birthdate) VALUES "
			+ " (?, ?, ?, ?);";
	private static final String INSERT_USER_ADDRESSES_SQL = "INSERT INTO addresses" + "  (workAddress, homeAddress) VALUES "
			+ " (?, ?);";
	private static final String SELECT_ALL_USERS = "SELECT a.*, b.workAddress, b.homeAddress FROM users AS a INNER JOIN addresses AS b ON a.id = b.id";
	private static final String SELECT_USER_BY_ID = "SELECT a.*, b.workAddress, b.homeAddress FROM users AS a INNER JOIN addresses AS b ON a.id = b.id WHERE a.id=?";
	private static final String DELETE_USER_SQL = "delete from users where id = ?;";
	private static final String DELETE_ADDRESSES_SQL = "delete from addresses where id = ?;";
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public void insertUser(User user) throws SQLException {
		System.out.println("PROSPATHEIA GIA INSERT!");
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_DETAILS_SQL);
			 PreparedStatement preparedStatementAddress = connection.prepareStatement(INSERT_USER_ADDRESSES_SQL);
			) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getSurname());
			preparedStatement.setString(3, user.getGender());
			preparedStatement.setString(4, user.getBirthdate());
			preparedStatement.executeUpdate();
			
			preparedStatementAddress.setString(1, user.getWorkAddress());
			preparedStatementAddress.setString(2, user.getHomeAddress());
			preparedStatementAddress.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public List<User> selectAllUsers() {

		List<User> users = new ArrayList<>();
		try (Connection connection = getConnection();
			 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
			) {
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				String gender = rs.getString("gender");
				String birthdate = rs.getString("birthdate");
				String workAddress = rs.getString("workAddress");
				String homeAddress = rs.getString("homeAddress");
				User newUser = new User(id, name, surname, gender, birthdate, workAddress, homeAddress);
				users.add(newUser);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
	
	public User getUser(int id) {
		User user = null;
		
		try( Connection con = getConnection();
				PreparedStatement preparedStatement = con.prepareStatement(SELECT_USER_BY_ID);){
				preparedStatement.setInt(1, id);
				System.out.println(preparedStatement);
				// Step 3: Execute the query or update query
				ResultSet rs = preparedStatement.executeQuery();
				// Step 4: Process the ResultSet object.
				while (rs.next()) {
					String name = rs.getString("name");
					String surname = rs.getString("surname");
					String gender = rs.getString("gender");
					String birthdate = rs.getString("birthdate");
					String workAddress = rs.getString("workAddress");
					String homeAddress = rs.getString("homeAddress");
					user = new User(id, name, surname, gender, birthdate, workAddress, homeAddress);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean[] deleteUser(int id) throws SQLException {
		boolean[] rowDeleted = new boolean[2] ;
		try (Connection connection = getConnection();
			 PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL);
				PreparedStatement statementAddresses = connection.prepareStatement(DELETE_ADDRESSES_SQL);
			) {
			statement.setInt(1, id);
			rowDeleted[0]=statement.executeUpdate() > 0;
			
			statementAddresses.setInt(1, id);
			rowDeleted[1]=statementAddresses.executeUpdate() >0;
		}
		return rowDeleted;
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	
}
