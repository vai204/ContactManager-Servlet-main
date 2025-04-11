package com.jspider.ContactManager_Servlet.entity;

public class Contact {

			private int id;
			private String FirstName;
			private String LastName;

			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public String getFirstName() {
				return FirstName;
			}

			public void setFirstName(String firstName) {
				FirstName = firstName;
			}

			public String getLastName() {
				return LastName;
			}

			public void setLastName(String lastName) {
				LastName = lastName;
			}

			public String getEmail() {
				return Email;
			}

			public void setEmail(String email) {
				Email = email;
			}

			public long getPhoneNumber() {
				return PhoneNumber;
			}

			public void setPhoneNumber(long phoneNumber) {
				PhoneNumber = phoneNumber;
			}

			private String Email;
			private long PhoneNumber;

		}




