package library;

import java.util.*;

public class UserMain {
	static Scanner scan = new Scanner(System.in);
	static String redColorCode = "\033[31m";
	static String resetColorCode = "\033[0m";

	static void login(final String id, final String name, final String pass) {
		UserDatabase obj = new UserDatabase();

		boolean opt = true;
		char choi = ' ';

		while (opt) {
			System.out.println("\n\nPlease select an appropriate option");
			System.out.println(" A - To Request Book");
			System.out.println(" B - To Return Book");
			System.out.println(" C - To Get Premium");
			System.out.println(" D - To Cancel Premium");
			System.out.println(" E - To View Books");
			System.out.println(" X - To Quit User Management");

			try {
				String temp = "";
				temp = scan.nextLine();
				if (temp.length() != 1 || temp.charAt(0) == ' ')
					throw new Exception();
				choi = temp.charAt(0);
			} catch (Exception e) {
				System.out.println(redColorCode + "Invalid Choice !" + resetColorCode);
			}
			System.out.println("\033[H\033[2J");

			switch (choi) {
				case 'A': {
					String bid = "", bname = "";
					while (true) {
						try {
							System.out.println("Select A to Request Book through Book Id");
							System.out.println("Select B to Request Book through Book Name");

							bid = scan.nextLine();
							if (bid.length() != 1 || bid.charAt(0) == ' ')
								throw new Exception("Enter Either A or B");
							choi = bid.charAt(0);
							bid = "";

							if (choi == 'A') {
								System.out.println("Enter Book Id:");
								bid = scan.nextLine();

								if (bid.equals(""))
									throw new Exception("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter Book Name:");
								bname = scan.nextLine();
								if (bname.equals(""))
									throw new Exception("Name can\'t be empty");
							} else
								throw new Exception("Enter Either A or B");

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.requestBook(bid, bname, id, name);
				}
					break;

				case 'B': {
					String bid = "", bname = "";
					while (true) {
						try {
							System.out.println("Select A to Return Book through Book Id");
							System.out.println("Select B to Return Book through Book Name");

							bid = scan.nextLine();
							if (bid.length() != 1 || bid.charAt(0) == ' ')
								throw new Exception("Enter Either A or B");
							choi = bid.charAt(0);
							bid = "";

							if (choi == 'A') {
								System.out.println("Enter Book Id:");
								bid = scan.nextLine();

								if (bid.equals(""))
									throw new Exception("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter Book Name:");
								bname = scan.nextLine();
								if (bname.equals(""))
									throw new Exception("Name can\'t be empty");
							} else
								throw new Exception("Only Enter Either A or B");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.returnBook(bid, bname, id, name);
				}
					break;

				case 'C': {
					obj.getPremium(id, name);
				}
					break;

				case 'D': {
					obj.cancelPremium(id, name);
				}
					break;

				case 'E': {
					obj.usersBook(id, name);
				}
					break;

				case 'X': {
					System.out.println(redColorCode + "Logging Out" + resetColorCode);
					opt = false;
				}
					break;

				default:
					System.out.println(redColorCode + "Invalid Choice" + resetColorCode);
			}
		}
	}

	static void UserManager() {
		UserDatabase obj = new UserDatabase();

		boolean opt = true;
		char choi = ' ';
		System.out.println("\033[H\033[2J");

		while (opt) {
			System.out.println("\n\nWelcome to User Management System !!!\n");
			System.out.println("Please select an appropriate option");
			System.out.println(" A - To Register An User");
			System.out.println(" B - To Login An User");
			System.out.println(" C - To Search An User");
			System.out.println(" D - To Delete An User");
			System.out.println(" X - To Quit User Management");

			try {
				String temp = scan.nextLine();
				if (temp.length() != 1)
					throw new Exception();
				choi = temp.charAt(0);
				if (choi == ' ')
					throw new Exception();
			} catch (Exception e) {
				System.out.println(redColorCode + "Invalid Choice !" + resetColorCode);
			}

			System.out.println("\033[H\033[2J");

			switch (choi) {
				case 'A': {
					String name = "", pass = "", confpass, phone = "", city = "";
					boolean premium = false;
					int temp;

					while (true) {
						try {
							System.out.println("Enter your name:");
							name = scan.nextLine();

							if (name.equals(""))
								throw new Exception("Name can\'t be empty");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					while (true) {
						try {
							System.out.println("Enter your pass:");
							pass = scan.nextLine();

							if (pass.equals(""))
								throw new Exception("Pass can\'t be empty");

							System.out.println("Confirm your password:");
							confpass = scan.nextLine();

							if (!pass.equals(confpass))
								throw new Exception("Password doesn\'t matches");

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					while (true) {
						try {
							System.out.println("Enter your contact number:");
							phone = scan.nextLine();
							temp = Integer.parseInt(phone);

							if (temp < 0)
								throw new Exception();

							if (phone.length() < 10 || phone.length() > 10)
								throw new Exception();

							break;
						} catch (Exception e) {
							System.out.println(
									redColorCode + "Phone numbers must consist of ten positive numeric digits."
											+ resetColorCode);
						}
					}

					while (true) {
						try {
							System.out.println("Enter your city:");
							city = scan.nextLine();

							if (city.equals(""))
								throw new Exception("City can be empty");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					while (true) {
						try {
							System.out.println("Do you want premium membership ? (Y/N)");
							confpass = scan.nextLine();

							if (confpass.length() > 1)
								throw new Exception();

							choi = confpass.charAt(0);

							if (choi == 'Y')
								premium = true;
							else if (choi == 'N')
								premium = false;
							else
								throw new Exception();

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + "Enter Either \'Y\' or \'N\' " + resetColorCode);
						}
					}
					obj.createUser(name, pass, phone, city, premium);

				}
					break;

				case 'B': {
					String id = "", name = "", pass = "";

					while (true) {
						try {
							System.out.println("Enter A To login via User Id\nEnter B to login via User Name");

							id = scan.nextLine();
							if (id.length() != 1)
								throw new Exception("Either Select \'A\' or \'B\' ");
							choi = id.charAt(0);
							id = "";

							if (choi == 'A') {
								System.out.println("Enter your User Id:");
								id = scan.nextLine();

								if (id.equals(""))
									throw new Exception("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter your name:");
								name = scan.nextLine();

								if (name.equals(""))
									throw new Exception("Name can\'t be empty");
							} else
								throw new Exception("Either Select \'A\' or \'B\' ");

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					while (true) {
						try {
							System.out.println("Enter your password:");
							pass = scan.nextLine();

							if (pass.equals(""))
								throw new Exception("Password can\'t be empty");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					if (obj.loginUser(id, name, pass))
						login(id, name, pass);
				}
					break;
				case 'C': {
					String id = "", name = "";

					while (true) {
						try {
							System.out.println("Enter A To Search via User Id\nEnter B to Search via User Name");
							id = scan.nextLine();

							if (id.length() != 1)
								throw new Exception("Either Select \'A\' or \'B\' ");

							choi = id.charAt(0);
							id = "";

							if (choi == 'A') {
								System.out.println("Enter your User Id:");
								id = scan.nextLine();

								if (id.equals(""))
									throw new Exception("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter your name:");
								name = scan.nextLine();

								if (name.equals(""))
									throw new Exception("Name can\'t be empty");
							} else
								throw new Exception("Either Select \'A\' or \'B\' ");

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					if (obj.searchUser(id, name))
						System.out.println("User exists");
					else
						System.out.println("User doesn\'t exists");
				}
					break;

				case 'D': {
					String id = "", name = "", pass = "";

					while (true) {
						try {
							System.out.println("Enter A To Delete via User Id\nEnter B to Delete via User Name");
							id = scan.nextLine();

							if (id.length() != 1)
								throw new Exception("Either Select \'A\' or \'B\' ");

							choi = id.charAt(0);
							id = "";

							if (choi == 'A') {
								System.out.println("Enter your User Id:");
								id = scan.nextLine();

								if (id.equals(""))
									throw new Exception("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter your name:");
								name = scan.nextLine();

								if (name.equals(""))
									throw new Exception("Name can\'t be empty");
							} else
								throw new Exception("Either Select \'A\' or \'B\' ");

							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					while (true) {
						try {
							System.out.println("Enter your password:");
							pass = scan.nextLine();

							if (pass.equals(""))
								throw new IllegalAccessException("Password can\'t be empty");
							break;
						} catch (IllegalAccessException e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

					obj.deleteUser(id, name, pass);

				}
					break;

				case 'X': {
					System.out.println(redColorCode + "Terminating User Manager ..." + resetColorCode);
					opt = false;
				}
					break;
				default:
					System.out.println(redColorCode + "Invalid Choice !" + resetColorCode);
			}
		}
	}
}
