

import java.util.Scanner;

public class RangeOfHeights {

	public static void main(String[] args) {
		
		   Scanner inputScanner = new Scanner( System.in );
		
		final double VALUE_TO_TERMINATE = 0.0;
		double minimumHeight = Double.MAX_VALUE;
		double maximumHeight = Double.MIN_VALUE;
		boolean finish = false;
		
		while (!finish)
		{
			double userHeight;
				
			System.out.print("Enter a height in metres (0.0 to finish)> " );
			userHeight = inputScanner.nextDouble();
			
			if (userHeight == VALUE_TO_TERMINATE)
			{
				finish = true;
			}
			else if (userHeight < VALUE_TO_TERMINATE)
			{
				System.out.println("Negative heights are invalid.");	
			}
			else 
			{
				
				if (userHeight < minimumHeight)
					minimumHeight = userHeight;
				if (userHeight > maximumHeight)
					maximumHeight = userHeight;
				
				System.out.println("Heights entered so far are in the range " + minimumHeight 
						+ " to " + maximumHeight);
				
			}
		
	
		}	
		
		inputScanner.close();
		
		}

	}



