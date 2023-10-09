package library;

import java.util.*;

public class Main {
	static Scanner scan = new Scanner(System.in);
	static String redColorCode = "\033[31m";
	static String resetColorCode = "\033[0m";
	
	public static void main(String[] args) {

		boolean opt = true;
		char choi;
		System.out.print("\033[H\033[2J");

		while (opt) {
			System.out.println("\n\nWelcome to Library Management System !!!\n");
			System.out.println("Please select an appropriate option");
			System.out.println(" A - To Access Book Manager");
			System.out.println(" B - To Access User Manager");
			System.out.println(" X - Terminate Program");

			choi = scan.nextLine().charAt(0);

			switch (choi) {
			case 'A':
				System.out.print("\033[H\033[2J");
//				System.out.print("\u000C");
				System.out.flush(); {
				BookMain.BookManager();
			}
				break;

			case 'B':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				UserMain.UserManager();
			}
				break;

			case 'X':
				System.out.print("\033[H\033[2J");
				System.out.flush(); {
				System.out.println(redColorCode+"Terminating Program ...");
				opt = false;
			}
				break;
			default:
				System.out.print("\033[H\033[2J");
				System.out.flush();
				System.out.println(redColorCode+"Invalid Choice !"+resetColorCode);
			}
		}
	}
}
