package com.jspider.ContactManager_Servlet.JDBC;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspider.ContactManager_Servlet.entity.Contact;

public class ContactJDBC {
	    private static Driver driver;
	    private static Connection connection;
	    private static PreparedStatement preparedStatement;
	    private static ResultSet resultSet;
	    private static String query;
	  
	    //Add contact
	    public static int addContacts(int id, String firstName,String lastName,String email,long phoneNumber) {
	    	int res = 0;
			try {
				openConnection();
				query = "INSERT INTO contact_manager VALUES(?,?,?,?,?)";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, id);
				preparedStatement.setString(2, firstName);
				preparedStatement.setString(3, lastName);
				preparedStatement.setString(4, email);
				preparedStatement.setLong(5, phoneNumber);
				res = preparedStatement.executeUpdate();
				
				} catch (Exception e) {
					e.printStackTrace();
			}finally {
				try {
					closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return res;
		}
	   
	    //Find contact
	    public static List<Contact> findAllContact(){
	    	List<Contact> contacts = new ArrayList<>();
	    	try {
				openConnection();
				query = "SELECT * FROM contact_manager";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					Contact contact = new Contact();
					contact.setId(resultSet.getInt(1));
					contact.setFirstName(resultSet.getString(2));
					contact.setLastName(resultSet.getString(3));
					contact.setEmail(resultSet.getString(4));
					contact.setPhoneNumber(resultSet.getLong(5));
					contacts.add(contact);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					closeConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	    	return contacts;
	    }

	    //Update Contact
	public static int updateContact(int id,String newFirstName,String newLastName,String newEmailId,long phoneNumber) {
		int res = 0;
		try {
			openConnection();
			query = "UPDATE contact_manager SET First_Name=?,Last_Name=?,Email=?,Phone_Number=? Where id = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, newFirstName);
			preparedStatement.setString(2, newLastName);
			preparedStatement.setString(3, newEmailId);
			preparedStatement.setLong(4, phoneNumber);
			preparedStatement.setInt(5, id);
			res = preparedStatement.executeUpdate();
		}  catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
		
    }
	
	//Delete contact
	public static int deleteContact(int id) {
		int res = 0;
		try {
			openConnection();
			query = "DELETE FROM contact_manager WHERE id =?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			res = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
	    
	    
		private static void openConnection() throws ClassNotFoundException, SQLException {
			Class.forName("com.mysql.cj.jdbc.Driver");
			driver = new com.mysql.cj.jdbc.Driver();
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weje1","root","sakshi");
		}

		private static void closeConnection() throws SQLException {
			if (resultSet != null) {
				resultSet.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
			if (driver != null) {
				DriverManager.deregisterDriver(driver);
			}
		}
	}

	


