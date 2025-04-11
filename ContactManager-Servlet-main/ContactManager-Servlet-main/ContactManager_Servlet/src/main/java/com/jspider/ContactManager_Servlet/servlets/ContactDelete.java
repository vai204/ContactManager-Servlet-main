package com.jspider.ContactManager_Servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspider.ContactManager_Servlet.JDBC.ContactJDBC;
@WebServlet("/deleteContact")
public class ContactDelete extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int res = ContactJDBC.deleteContact(id);
		resp.setContentType("text/html");
		if (res == 1) {
			 req.setAttribute("mesg",res+ "Contact Deleted Successfully");
		}
		 else {
			 req.setAttribute("mesg","Contact is not Deleted");
		}
		 RequestDispatcher dispatcher = req.getRequestDispatcher("ConDelete.jsp");
         dispatcher.forward(req, resp);
		
	}

}
