
import java.util.Scanner;

public class ChuckaLuckDiceGame {

	public static void resolveBet(String betType, Wallet playerCash)
	{
		int playerBet = 0;
		System.out.println(playerCash.toString());
		System.out.print("How much would you like to bet? ");
		Scanner inputScanner = new Scanner(System.in);

		if(inputScanner.hasNextInt())
		{
			playerBet = inputScanner.nextInt();
		}

		else
		{
			System.out.println("Error enter a valid bet");
		}

		if (playerBet <= playerCash.check()) 
		{

			Dice diceone = new Dice();
			Dice dicetwo = new Dice();
			Dice dicethree = new Dice();

			int rollOne = diceone.roll();
			int rollTwo = dicetwo.roll();
			int rollThree = dicethree.roll();
			int total = rollOne + rollTwo + rollThree;
			boolean triple = false;

			if(rollOne != 1 && rollOne != 6 && rollOne == rollTwo && rollOne == rollThree)
			{
				triple = true;
			}

			playerCash.get(playerBet);

			if(betType.equals("Triple") && triple) 
			{
				System.out.println("Congratulations you won");
				playerCash.put( (playerBet * 31) );
			}

			else if(betType.equals("Field") && total < 8 || total > 12) 
			{
				System.out.println("Congratulations you won");
				playerCash.put( (playerBet * 2) );
			}

			else if
			(betType.equals("High") && total > 10 && !triple) 
			{
				System.out.println("Congratulations you won");				 
				playerCash.put( (playerBet * 2) );	
			}

			else if(betType.equals("Low") && total < 11 && !triple) 
			{
				System.out.println("Congratulations you won");
				playerCash.put( (playerBet * 2) );
			}

			else 
			{
				System.out.println("Commiserations you lost");
				playerCash.put((-playerBet));
			}

		} 
		else 
		{
			System.out.println("Insufficient funds please try again");
		}
	}
	public static void main(String[] args) {
		String betType = null;
		Scanner inputScanner = new Scanner(System.in);
		System.out.print("How much cash do you have? ");
		if(inputScanner.hasNextInt())
		{
			int amountOfCash = inputScanner.nextInt();
			if(amountOfCash<=0)
			{
				System.out.println("Error: enter a valid amount");
			}

			Wallet playerCash = new Wallet();
			playerCash.put(amountOfCash);

			boolean quit = false;
			while(!quit) {

				if (playerCash.check() <= 0)
					quit = true;

				System.out.print("What do you want to bet -'Triple', 'Field', 'High' or 'Low'? (or enter 'quit' to finish) ");	
				if(inputScanner.hasNextInt() || inputScanner.hasNextDouble())
				{
					System.out.println("Error invalid selection please try again");
				}

				betType = inputScanner.next();

				if (betType.equals("quit")) 
				{
					quit = true;
				}
				else
				{
					resolveBet(betType, playerCash); 
				}

			}

			inputScanner.close();
			System.out.println("Game over you started with " + amountOfCash + " now have " +(int) playerCash.check());		

		}
	}

}


