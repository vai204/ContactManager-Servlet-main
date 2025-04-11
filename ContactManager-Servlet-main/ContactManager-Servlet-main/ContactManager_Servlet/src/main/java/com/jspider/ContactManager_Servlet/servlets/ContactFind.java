package com.jspider.ContactManager_Servlet.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspider.ContactManager_Servlet.JDBC.ContactJDBC;
import com.jspider.ContactManager_Servlet.entity.Contact;
@WebServlet("/Find")
public class ContactFind extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	List<Contact> contacts = ContactJDBC.findAllContact();
	if (contacts != null && contacts.size()>0) {
		req.setAttribute("list", contacts);
		RequestDispatcher dispatcher = req.getRequestDispatcher("ConFind.jsp");
		dispatcher.forward(req, resp);
	}else {
		resp.setContentType("text/html");
		PrintWriter writer = resp.getWriter();
		writer.println("<h1>Contact not found</h1>");
	}
  }	
}
