
import java.text.DecimalFormat;
import java.util.Scanner;

public class StoppingDistance1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		 Scanner inputScanner = new Scanner (System.in);
		 

         System.out.println("Enter vehicle speed in km/hr>");
  double speed = inputScanner.nextDouble();
 
         System.out.println("Enter reaction time in seconds>");
  double reactionTime = inputScanner.nextDouble();
  
  final double CONVERSION_KMPERHR_TO_MTRSPERSEC = 3.6;
 
  double stoppingDistance = speed / CONVERSION_KMPERHR_TO_MTRSPERSEC * reactionTime + 
		 ((speed / CONVERSION_KMPERHR_TO_MTRSPERSEC) 
		 * (speed / CONVERSION_KMPERHR_TO_MTRSPERSEC)) / 20.0;
 
        
       DecimalFormat df = new DecimalFormat (".#");
       
       
        		 
   System.out.printf (" At a speed of " + df.format(speed) + "km/hr" +
      " and with a reaction time of " +  df.format(reactionTime) +
       "s," + " the stopping distance would be " + df.format(stoppingDistance) +  "m");
         

{
}  
 
 
	
 

 
 

	}

}