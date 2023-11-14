
 */
import java.util.Scanner;

public class Connect4Game {

	public static void main(String[] args) {
		System.out.println("Welcome to Connect 4: GOOD LUCK");
		Scanner inputScanner = new Scanner(System.in);

		Connect4Grid2DArray board = new Connect4Grid2DArray();

		System.out.print("Player 1 Type (ai, human): ");
		ConnectPlayer player1 = inputScanner.nextLine().equals("ai") ? new C4RandomAIPlayer((int)1) : new C4HumanPlayer((int)1, inputScanner);

		System.out.print("Player 2 Type (ai, human): ");
		ConnectPlayer player2 = inputScanner.nextLine().equals("ai") ? new C4RandomAIPlayer((int)2) : new C4HumanPlayer((int)2, inputScanner);

		boolean quit = false;

		int turn = 0;

		do {
			System.out.print("Would you like to continue playing, quit or clear the board? (play, quit, clear) : ");
			String userInput = inputScanner.nextLine();

			if (userInput.equalsIgnoreCase("quit")) {
				quit = true;
			} else {
				if (userInput.equalsIgnoreCase("clear")) {
					turn = 0;
					board.emptyGrid();
				}

				System.out.println("Turn " + turn);
				System.out.println("Determining moves for players..");

				board.dropPiece(player1, player1.playerMove(board));
				System.out.println(board);

				board.dropPiece(player2, player2.playerMove(board));
				System.out.println(board);

				if (board.didLastPieceConnect4()) {
					System.out.println("Player " + board.getWinner() + " has won!");
					return;
				}

				if (board.isGridFull()) {
					System.out.println("It was a tie. The board is full");
					return;
				}

				turn++;
			}

		} while (!quit);

		inputScanner.close();
	}
}
