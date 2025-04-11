package com.jspider.ContactManager_Servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspider.ContactManager_Servlet.JDBC.ContactJDBC;
@WebServlet("/updateContact")
public class ContactUpdate extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		int id = Integer.parseInt(req.getParameter("id"));
		String firstName = req.getParameter("FirstName");
		String lastName = req.getParameter("LastName");
		String email = req.getParameter("Email");
		long phoneNumber = Long.parseLong(req.getParameter("PhoneNumber"));
				
		
		int res = ContactJDBC.updateContact(id, firstName, lastName, email, phoneNumber);
		if (res >= 1) {
			 req.setAttribute("mesg",res+ "Contact is Updated");
           
		}
		 else {
			 req.setAttribute("mesg","Contact not Updated");


		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("ConUpdate.jsp");
        dispatcher.forward(req, resp);

	}

}
