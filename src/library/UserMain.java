package library;

import java.util.*;

public class UserMain {
	static Scanner scan = new Scanner(System.in);
	static String redColorCode = "\033[31m";
	static String resetColorCode = "\033[0m";

	static void login(final String id,final String name,final String pass) {
		UserDatabase obj = new UserDatabase();

		boolean opt = true;
		char choi;

		while (opt) {
			System.out.println("Please select an appropriate option");
			System.out.println(" A - To Request Book");
			System.out.println(" B - To Return Book");
			System.out.println(" C - To Get Premium");
			System.out.println(" D - To Cancel Premium");
			System.out.println(" E - To View Books");
			System.out.println(" X - To Quit User Management");
			choi = scan.nextLine().charAt(0);

			switch (choi) {
			case 'A':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				String bid = "", bname = "";
				boolean flag = true;
				while (flag) {
					try {
						System.out.println("Select A to Request Book through Book Id");
						System.out.println("Select B to Request Book through Book Name");
						choi = scan.nextLine().charAt(0);
						if (choi == 'A') {
							System.out.println("Enter Book Id:");
							bid = scan.nextLine();

							if (bid.equals(""))
								throw new IllegalAccessException("Id can\'t be empty");
						} else if (choi == 'B') {
							System.out.println("Enter Book Name:");
							bname = scan.nextLine();
							if (bname.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
						} else
							throw new IllegalAccessException("Only Enter Either A or B");

						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}
				obj.requestBook(bid, bname, id, name, pass);
			}
				break;

			case 'B':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				System.out.print("\033[H\033[2J");
				System.out.flush();
				{
					String bid = "", bname = "";
					boolean flag = true;
					while (flag) {
						try {
							System.out.println("Select A to Return Book through Book Id");
							System.out.println("Select B to Return Book through Book Name");
							choi = scan.nextLine().charAt(0);
							if (choi == 'A') {
								System.out.println("Enter Book Id:");
								bid = scan.nextLine();

								if (bid.equals(""))
									throw new IllegalAccessException("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter Book Name:");
								bname = scan.nextLine();
								if (bname.equals(""))
									throw new IllegalAccessException("Name can\'t be empty");
							} else
								throw new IllegalAccessException("Only Enter Either A or B");

							flag = false;
						} catch (IllegalAccessException e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.returnBook(bid, bname, id, name, pass);
				}
			}
				break;

			case 'C':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
					obj.getPremium(id, name);
			}
				break;

			case 'D':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
					obj.cancelPremium(id, name);
			}
				break;

			case 'E':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
					obj.usersBook(id, name);
			}
				break;

			case 'X':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				System.out.println(redColorCode + "Logging Out" + resetColorCode);
				opt = false;
			}
				break;

			default:
				System.out.print("\033[H\033[2J");
				System.out.flush();
				System.out.println(redColorCode + "Invalid Choice" + resetColorCode);
			}
		}
	}

	static void UserManager() {
		UserDatabase obj = new UserDatabase();

		boolean opt = true;
		char choi;
		System.out.print("\033[H\033[2J");

		while (opt) {
			System.out.println("\n\nWelcome to User Management System !!!\n");
			System.out.println("Please select an appropriate option");
			System.out.println(" A - To Register An User");
			System.out.println(" B - To Login An User");
			System.out.println(" C - To Search An User");
			System.out.println(" D - To Delete An User");
			System.out.println(" X - To Quit User Management");

			choi = scan.nextLine().charAt(0);

			switch (choi) {
			case 'A':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				String name = "", pass = "", confpass, phone = "", city = "";
				boolean premium = false, flag = true;
				int temp;

				while (flag) {
					try {
						System.out.println("Enter your name:");
						name = scan.nextLine();

						if (name.equals(""))
							throw new IllegalAccessException("Name can\'t be empty");
						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}
				flag = true;

				while (flag) {
					try {
						System.out.println("Enter your pass:");
						pass = scan.nextLine();
						System.out.println("Confirm your password:");
						confpass = scan.nextLine();

						if (pass.equals(""))
							throw new IllegalAccessException("Pass can\'t be empty");

						if (!pass.equals(confpass))
							throw new IllegalAccessException("Password doesn\'t matches");

						flag = false;

					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}
				flag = true;

				while (flag) {
					try {
						System.out.println("Enter your contact number:");
						temp = Integer.parseInt(scan.nextLine());
						phone = Integer.toString(temp);

						if (temp < 0)
							throw new IllegalAccessException("Phone number can\'t be negative");
						if (phone.length() < 10 || phone.length() > 10)
							throw new IllegalAccessException("Phone number should be of 10 digits");
						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (NumberFormatException e) {
						System.out.println(redColorCode + "Phone number should be only in digits" + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}
				flag = true;

				while (flag) {
					try {
						System.out.println("Enter your city:");
						city = scan.nextLine();

						if (city.equals(""))
							throw new IllegalAccessException("City can be empty");
						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}
				flag = true;
				while (flag) {
					try {
						System.out.println("Do you want premium membership ? (Y/N)");
						choi = scan.nextLine().charAt(0);

						if (choi == 'Y')
							premium = true;
						else if (choi == 'N')
							premium = false;
						else
							throw new IllegalAccessException("");

						flag = false;
					} catch (Exception e) {
						System.out.println(redColorCode + "Enter Either \'Y\' or \'N\' " + resetColorCode);
					}
				}

				obj.createUser(name, pass, phone, city, premium);

			}
				break;

			case 'B':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				String id = "", name = "", pass = "";
				boolean flag = true;

				while (flag) {
					try {
						System.out.println("Enter A To login via User Id\nEnter B to login via User Name");
						choi = scan.nextLine().charAt(0);

						if (choi == 'A') {
							System.out.println("Enter your User Id:");
							id = scan.nextLine();

							if (id.equals(""))
								throw new IllegalAccessException("Id can\'t be empty");
						} else if (choi == 'B') {
							System.out.println("Enter your name:");
							name = scan.nextLine();

							if (name.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
						} else
							throw new IllegalAccessException("Either Select \'A\' or \'B\' ");

						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (IndexOutOfBoundsException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}

				try {
					System.out.println("Enter your password:");
					pass = scan.nextLine();

					if (pass.equals(""))
						throw new IllegalAccessException("Password can\'t be empty");
				} catch (IllegalAccessException e) {
					System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
				} catch (Exception e) {
					System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
				}

				if (obj.loginUser(id, name, pass)) {
					System.out.println("Authentication Successful!");
					login(id, name, pass);
				} else
					System.out.println("Authentication Failed!");

			}
				break;
			case 'C':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				String id = "", name = "";
				boolean flag = true;

				while (flag) {
					try {
						System.out.println("Enter A To Search via User Id\nEnter B to Search via User Name");
						choi = scan.nextLine().charAt(0);

						if (choi == 'A') {
							System.out.println("Enter your User Id:");
							id = scan.nextLine();

							if (id.equals(""))
								throw new IllegalAccessException("Id can\'t be empty");
						} else if (choi == 'B') {
							System.out.println("Enter your name:");
							name = scan.nextLine();

							if (name.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
						} else
							throw new IllegalAccessException("Either Select \'A\' or \'B\' ");

						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (IndexOutOfBoundsException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
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

			case 'D':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				String id = "", name = "", pass = "";
				boolean flag = true;

				while (flag) {
					try {
						System.out.println("Enter A To Delete via User Id\nEnter B to Delete via User Name");
						choi = scan.nextLine().charAt(0);

						if (choi == 'A') {
							System.out.println("Enter your User Id:");
							id = scan.nextLine();

							if (id.equals(""))
								throw new IllegalAccessException("Id can\'t be empty");
						} else if (choi == 'B') {
							System.out.println("Enter your name:");
							name = scan.nextLine();

							if (name.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
						} else
							throw new IllegalAccessException("Either Select \'A\' or \'B\' ");

						flag = false;
					} catch (IllegalAccessException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (IndexOutOfBoundsException e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					} catch (Exception e) {
						System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
					}
				}

				try {
					System.out.println("Enter your password:");
					pass = scan.nextLine();

					if (pass.equals(""))
						throw new IllegalAccessException("Password can\'t be empty");
				} catch (IllegalAccessException e) {
					System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
				} catch (Exception e) {
					System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
				}

				obj.deleteUser(id, name, pass);

			}
				break;

			case 'X':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				System.out.println(redColorCode + "Terminating User Manager ..." + resetColorCode);
				opt = false;
			}
				break;
			default:
				System.out.print("\033[H\033[2J");
				System.out.flush();
				System.out.println(redColorCode + "Invalid Choice !" + resetColorCode);
			}
		}
	}
}
