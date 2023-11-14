
import java.util.Scanner;

public class PercentageToGradeConverter {

	public static void main(String[] args) {


		final double MINIMUM_PERCENTAGE_FOR_FIRST_CLASS_HONOURS = 70.0;
		final double MINIMUM_PERCENTAGE_TO_PASS = 40.0;
		final double MAXIMUM_PERCENTAGE = 100.0;
		final double MINIMUM_PERCENTAGE = 0.0;
		final double MINIMUM_PERCENTAGE_FOR_F1 = 35.0;
		final double MAXIMUM_PERCENTAGE_FOR_F1 = 39.0;
		final double VALUE_FOR_DIVISON = 10.0;


		boolean finish = false;
		double percentageObtainedByStudent = 0.0;
		Scanner inputScanner = new Scanner( System.in );

		do 
		{
			System.out.print ("Enter a percentage (or 'quit' to finish)> ");
			if (inputScanner.hasNextDouble()) 
			{
				percentageObtainedByStudent = inputScanner.nextDouble();

				if ((percentageObtainedByStudent >= MINIMUM_PERCENTAGE) &&
						(percentageObtainedByStudent <= MAXIMUM_PERCENTAGE))
				{
					double percentageObtainedByStudentRounded = Math.round(percentageObtainedByStudent);

					if (percentageObtainedByStudentRounded >=MINIMUM_PERCENTAGE_FOR_F1  && percentageObtainedByStudentRounded <=
							MAXIMUM_PERCENTAGE_FOR_F1)
					{
						System.out.println("The grade for " + percentageObtainedByStudent + "% is an F1");
					}
					else
					{

						switch ((int)percentageObtainedByStudentRounded /(int) VALUE_FOR_DIVISON) 
						{
						case 10:
						case 9:
						case 8:
						case 7:
							System.out.println("The grade for " + percentageObtainedByStudent + "% is a I");
							break;
						case 6: 
							System.out.println("The grade for " + percentageObtainedByStudent + "% is a II.1");
							break;
						case 5:
							System.out.println("The grade for " + percentageObtainedByStudent + "% is a II.2");
							break;
						case 4:
							System.out.println("The grade for " + percentageObtainedByStudent + "% is a III");
							break;
						case 3: 
							System.out.println("The grade for " + percentageObtainedByStudent + "% is an F2");
							break;
						case 2:
							System.out.println("The grade for " + percentageObtainedByStudent + "% is an F2");
							break;
						case 1: 
							System.out.println("The grade for " + percentageObtainedByStudent + "% is an F2");
							break;
						case 0:
							System.out.println("The grade for " + percentageObtainedByStudent + "% is an F2");
							break;
						default:

						}
					}

				}
				else 
				{
					System.out.println ("Error: Percentages must be between " + MINIMUM_PERCENTAGE + 
							"%" + " and "+ MAXIMUM_PERCENTAGE + "%");
				}
			}
			else if (inputScanner.hasNext("quit"))
				finish = true;
			else 
			{
				System.out.println("Error: Enter a number between " + MINIMUM_PERCENTAGE + " and "
						+ MAXIMUM_PERCENTAGE +  ", or the word quit to exit the program.");
				inputScanner.next();
			}


  
		} while (!finish);
		inputScanner.close();

	} 	

}

