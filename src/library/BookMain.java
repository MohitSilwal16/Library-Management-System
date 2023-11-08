package library;

import java.util.Scanner;

public class BookMain {
	static Scanner scan = new Scanner(System.in);
	static String redColorCode = "\033[31m";
	static String resetColorCode = "\033[0m";

	static void BookManager() {
		boolean opt = true;
		char choi = ' ';
		BookDatabase obj = new BookDatabase();

		while (opt) {
			System.out.println("\n\n\nWelcome to Book Manager");
			System.out.println(" A - To Display All Books");
			System.out.println(" B - To Search Book");
			System.out.println(" C - To Check Availability of Book");
			System.out.println(" D - To View Books By Languages");
			System.out.println(" E - To View Books By Categories");
			System.out.println(" X - To Quit Book Manager");

			String temp = "";
			try {
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
					obj.displayBooks();
				}
					break;

				case 'B': {
					String id = "", name = "";

					while (true) {
						try {
							System.out.println("Enter A to Search Book by Id\nEnter B to Search Book by Name");

							id = scan.nextLine();
							if (id.length() != 1 || id.charAt(0) == ' ')
								throw new Exception("Either Select A or B");
							choi = id.charAt(0);
							id = "";

							if (choi == 'A') {
								System.out.println("Enter Book Id:");
								id = scan.nextLine();
								if (id.equals(""))
									throw new IllegalAccessException("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter Book Name:");
								name = scan.nextLine();
								if (name.equals(""))
									throw new IllegalAccessException("Name can\'t be empty");
							} else
								throw new IllegalAccessException("Either Select A or B");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.searchBook(id, name);

				}
					break;

				case 'C': {
					String id = "", name = "";

					while (true) {
						try {
							System.out.println("Enter A to Search Book by Id\nEnter B to Search Book by Name");

							id = scan.nextLine();
							if (id.length() != 1 || id.charAt(0) == ' ')
								throw new Exception("Either Select A or B");
							choi = id.charAt(0);
							id = "";

							if (choi == 'A') {
								System.out.println("Enter Book Id:");
								id = scan.nextLine();
								if (id.equals(""))
									throw new IllegalAccessException("Id can\'t be empty");
							} else if (choi == 'B') {
								System.out.println("Enter Book Name:");
								name = scan.nextLine();
								if (name.equals(""))
									throw new IllegalAccessException("Name can\'t be empty");
							} else
								throw new IllegalAccessException("Either Select A or B");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.checkAvai(id, name);
				}
					break;

				case 'D': {
					obj.showLanguages();

					String name = "";

					while (true) {
						try {
							System.out.println("Enter the language:");
							name = scan.nextLine();
							if (name.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.bookByLang(name);
				}
					break;

				case 'E': {
					obj.showCategories();

					String name = "";

					while (true) {
						try {
							System.out.println("Enter Category:");
							name = scan.nextLine();
							if (name.equals(""))
								throw new IllegalAccessException("Name can\'t be empty");
							break;
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}
					obj.bookByCate(name);
				}
					break;

				case 'X': {
					System.out.println(redColorCode + "Terminating Book Manager ..." + resetColorCode);

					opt = false;
				}
					break;
				default:
					System.out.println(redColorCode + "Invalid Choice" + resetColorCode);
			}
		}
	}
}
