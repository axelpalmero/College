
import java.util.Scanner;

public class SieveOfEratosthenes {
	public static int[] createSequence(int N) 
	{
		int sequenceIndex = 0;
		int[] sequenceOfNumbers = new int[N -1];
		for (int index = 2; index <= N; index++) 
		{
			sequenceOfNumbers[sequenceIndex] = index;
			sequenceIndex++;
		}
		return sequenceOfNumbers;

	}

	public static int[] crossOutHigherMultiples(int[] sequenceOfNumbers, int n) 
	{
		if(sequenceOfNumbers == null)
		{
			System.out.print("Error array can not be null");
			return null;
		}
		else
		{
			int[] noMultiplesSequence = sequenceOfNumbers.clone();
			for (int j = (n*2 - 2); j < (sequenceOfNumbers.length); j = (j + n)) 
			{
				noMultiplesSequence[j] = 0;
			}
			return noMultiplesSequence;
		}
	}

	public static int[] sieve(int N) 
	{
		int[] sequenceOfNumbers = createSequence(N);

		int[] sieve = sequenceOfNumbers.clone();
		for (int index = 2; index <= N - 2; index++) 
		{
			if(sieve[index - 2]!= 0)
			{
				sieve = crossOutHigherMultiples(sieve, index);
				if (index < Math.round(Math.sqrt(N)))
				{
					System.out.println(sequenceToString(sieve));
				}
			}
		}
		return sieve;


	}

	public static String sequenceToString(int[] sieveSequence) {
		if(sieveSequence == null)
		{
			System.out.print("Error array can not be null");
			return null;
		}
		else
		{
			StringBuilder sequenceOfNumbersArray = new StringBuilder();
			sequenceOfNumbersArray.append(2);
			for (int index = 1; index< sieveSequence.length; index++) 
			{
				if(sieveSequence[index] == 0) 
				{
					sequenceOfNumbersArray.append(", [");
					sequenceOfNumbersArray.append(index + 2);
					sequenceOfNumbersArray.append("]");

				} 
				else 
				{
					sequenceOfNumbersArray.append(", ");
					sequenceOfNumbersArray.append(sieveSequence[index]);
				}
			}
			return sequenceOfNumbersArray.toString();
		}
	}

	public static String nonCrossedOutSubseqToString(int[] sieveSequence) {
		if(sieveSequence == null)
		{
			System.out.print("Error array can not be null");
			return null;
		}
		else
		{
			StringBuilder sequenceOfNumbersArray = new StringBuilder();
			sequenceOfNumbersArray.append(2);
			for (int index = 1; index < sieveSequence.length; index++) 
			{
				if (sieveSequence[index] != 0)
				{
					sequenceOfNumbersArray.append(", ").append(sieveSequence[index]);
				}

			}
			return sequenceOfNumbersArray.toString();
		}
	}



	public static void main(String[] args) 
	{
		Scanner inputScanner = new Scanner(System.in);
		System.out.print("Enter int >= 2 :");
		int N = inputScanner.nextInt();
		if (N < 2) 
		{
			System.out.println("Error: Enter a number >= 2");
		} 
		else 
		{
			System.out.println(sequenceToString(createSequence(N)));
			System.out.println(sequenceToString(sieve(N)));
			System.out.println(nonCrossedOutSubseqToString(sieve(N)));
		}

	}


}


