package web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.UserDao;


@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDAO;
    
    public void init() {
    	userDAO = new UserDao();
    }
    
    public UserServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		System.out.println("THE ACTTIOOOON: " + action);
		
		switch(action) {
			case "/displayUsers":
				displayUsers(request, response);
				break;
			case "/register":
				registerUser(request, response);
				break;
			case "/user_details":
				showUserDetails(request, response);
				break;
			case "/":
				response.sendRedirect("homepage.jsp");
				break;
			case "/delete":
			try {
				deleteUser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
		}
	}
	
	private void displayUsers(HttpServletRequest request, HttpServletResponse response) {
		List<User> listUser = userDAO.selectAllUsers();
		System.out.println(listUser);
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-list.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void registerUser(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("Name");
		String surname = request.getParameter("Surname");
		String gender = request.getParameter("gender");
		String birthdate = request.getParameter("selDate");
		String work_address = request.getParameter("work_address");
		String home_address = request.getParameter("home_address");
		User newUser = new User(name, surname, gender, birthdate, work_address, home_address);
		try {
			userDAO.insertUser(newUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			request.setAttribute("action", "UserRegistration");
			RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void showUserDetails(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		User userDetails = userDAO.getUser(id);
		request.setAttribute("userDetails", userDetails);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-details.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
		try {
			request.setAttribute("action", "UserDelete");
			RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
