package library;

import java.util.Scanner;

public class BookMain {
	static Scanner scan = new Scanner(System.in);
	static String redColorCode = "\033[31m";
	static String resetColorCode = "\033[0m";

	static void BookManager() {
		boolean opt = true;
		char choi;
		BookDatabase obj = new BookDatabase();

		while (opt) {
			System.out.println("\n\n\nWelcome to Book Manager");
			System.out.println(" A - To Display All Books");
			System.out.println(" B - To Search Book");
			System.out.println(" C - To Check Availibility of Book");
			System.out.println(" D - To View Books By Language");
			System.out.println(" E - To View Books By Categories");
			System.out.println(" X - To Quit Book Manager");

			choi = scan.nextLine().charAt(0);

			switch (choi) {
				case 'A':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {
					obj.displayBooks();
				}
					break;

				case 'B':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {
					boolean flag = true;
					String id="",name="";

					while(flag){
						try {
							System.out.println("Enter A to Search Book by Id\nEnter B to Search Book by Name");
							choi = scan.nextLine().charAt(0);
						} catch (Exception e) {
							System.out.println(redColorCode + e.getLocalizedMessage() + resetColorCode);
						}
					}

				}
					break;

				case 'C':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {

				}
					break;

				case 'D':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {

				}
					break;

				case 'E':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {

				}
					break;

				case 'X':
					System.out.print("\033[H\033[2J");
					System.out.flush(); {
					System.out.println(redColorCode + "Terminating Book Manager ..." + resetColorCode);

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
}
