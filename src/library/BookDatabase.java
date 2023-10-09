package library;

import java.sql.*;

public class BookDatabase {
	private static Connection con;
	static {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library_Management", "root", "kali");
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void displayBooks() {
		String query = "SELECT * FROM Book ;";

		try {
			Statement s = con.createStatement();

			ResultSet r = s.executeQuery(query);

			while (r.next()) {
				System.out.println("Book Name: " + r.getString(2) + " Author: " + r.getString(3) + " Language: "
						+ r.getString(4) + " Category: " + r.getString(5) + " Quantity: " + r.getString(6));
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void searchBook(String id, String name) {
		String query = "SELECT Search_Book ( ? , ? ) ;";

		try {
			CallableStatement s = con.prepareCall(query);

			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();

			r.next();

			if (r.getBoolean(1))
				System.out.println("Book Exists");
			else
				System.out.println("Book doesn\'t exists");

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void checkAvai(String id, String name) {
		String query = "SELECT Book_Avai ( ? , ? ) AS Output;";

		try {
			CallableStatement s = con.prepareCall(query);
			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();

			r.next();

			if (r.getBoolean("Output"))
				System.out.println("Book is available");
			else
				System.out.println("Book isn\'t available");
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void bookByLang(String lang) {
		String query = "CALL Display_Books_Language ( ? ) ;";

		try {
			CallableStatement s = con.prepareCall(query);

			s.setString(1, lang);

			ResultSet r = s.executeQuery();
			while (r.next()) {
				System.out.println(r.getString(1));
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void bookByCate(String cate) {
		String query = "CALL Display_Books_Category ( ? ) ;";

		try {
			CallableStatement s = con.prepareCall(query);

			s.setString(1, cate);

			ResultSet r = s.executeQuery();
			while (r.next()) {
				System.out.println(r.getString(1));
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}

	}

}
