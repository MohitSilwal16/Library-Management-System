package library;

import java.sql.*;

public class UserDatabase {
	private static Connection con;

	static {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library_Management", "root", "kali");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	void createUser(String name, String pass, String contact, String city, boolean premium) {

		String query = "SELECT Create_User( ? , ? , ? , ? , ?  ) AS Output;";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, name);
			s.setString(2, pass);
			s.setString(3, contact);
			s.setString(4, city);
			s.setBoolean(5, premium);

			ResultSet r = s.executeQuery();

			r.next();
			System.out.println(r.getString("Output"));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	boolean loginUser(String id, String name, String pass) {

		String query = "SELECT Authenticate ( ? , ? , ?) AS Output;";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, id);
			s.setString(2, name);
			s.setString(3, pass);

			ResultSet r = s.executeQuery();
			r.next();

			String output = r.getString("Output");
			System.out.println(output);
			if (output.equals("Login Successful !"))
				return true;

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return false;
	}

	boolean searchUser(String id, String name) {
		String query = "SELECT Search_User( ? , ?) AS Output";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();
			r.next();

			if (r.getBoolean("Output"))
				return true;
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return false;
	}

	void deleteUser(String id, String name, String pass) {
		String query = "SELECT Delete_User( ? , ? , ?) AS Output";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, id);
			s.setString(2, name);
			s.setString(3, pass);

			ResultSet r = s.executeQuery();

			r.next();

			System.out.println(r.getString("Output"));

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	void usersBook(String id, String name) {
		String query = "CALL Users_Book( ? , ?);";

		try {
			PreparedStatement s = con.prepareStatement(query);
			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();

			System.out.println("Books are as follows:");

			while (r.next()) {
				System.out.println(r.getString("Book_Name"));
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void requestBook(String bid, String bname, String id, String name, String pass) {
		String query = "SELECT Request_Book( ? , ? , ? , ? , ?) AS Output";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, bid);
			s.setString(2, bname);
			s.setString(3, id);
			s.setString(4, name);
			s.setString(5, pass);

			ResultSet r = s.executeQuery();

			r.next();

			System.out.println(r.getString("Output"));
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void returnBook(String bid, String bname, String id, String name, String pass) {
		String query = "SELECT Return_Book( ? , ? , ? , ? , ?) AS Output";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, bid);
			s.setString(2, bname);
			s.setString(3, id);
			s.setString(4, name);
			s.setString(5, pass);

			ResultSet r = s.executeQuery();

			r.next();

			System.out.println(r.getString("Output"));
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void getPremium(String id, String name) {
		String query = "SELECT Get_Premium( ? , ? ) AS Output;";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();
			r.next();
			System.out.println(r.getString("Output"));
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

	void cancelPremium(String id, String name) {
		String query = "SELECT Cancel_Premium( ? , ? ) AS Output;";

		try {
			PreparedStatement s = con.prepareStatement(query);

			s.setString(1, id);
			s.setString(2, name);

			ResultSet r = s.executeQuery();
			r.next();
			System.out.println(r.getString("Output"));
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}
}