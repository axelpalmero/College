

import java.util.Scanner;
public class Converter {
public static final int OUNCES_IN_A_POUND = 16;
public static final int POUNDS_IN_A_STONE = 14;
public static final double KILOGRAMS_IN_AN_OUNCE = 0.02834952;
public static void main(String[] args) {
boolean quit=false;
Scanner input = new Scanner( System.in ); do
{
System.out.print("Enter the number of Stones, Pounds and Ounces separated by spaces (or enter quit)");		
boolean inputFormatCorrect = false;
if (input.hasNext("quit"))
{
quit = true;
inputFormatCorrect = true;
}else if (input.hasNextInt())
{
int stones = input.nextInt();
if (input.hasNextInt())
{
int pounds = input.nextInt();
if (input.hasNextInt())
{
int ounces = input.nextInt();
double kilograms = convertToKilograms(stones, pounds, ounces);
System.out.println( getFormattedWeightString(stones, pounds, ounces) +
" is equal to " + kilograms + "kg");
inputFormatCorrect = true;
}
}
}
if (!inputFormatCorrect)
{
System.out.println("Input error. Try again.");
if (!inputFormatCorrect)
{
System.out.println("Input error. Try again.");
input.nextLine();
}
} 
}while (!quit);
input.close();
}
// This function converts stones, pounds and ounces into kilograms.
public static double convertToKilograms(int stones, int pounds, int ounces)
{
int total_ounces = ounces + pounds*OUNCES_IN_A_POUND +
stones*POUNDS_IN_A_STONE*OUNCES_IN_A_POUND;
return ((double) total_ounces)*KILOGRAMS_IN_AN_OUNCE;
}
// This function returns a formatted String containing the weight in stones, pounds and ounces.
public static String getFormattedWeightString( int stones, int pounds, int ounces )
{
String weightString = "";
if (stones != 0)
{
weightString += stones + " stone" + ((stones!=1)?"s":"");
if ((pounds != 0) || (ounces != 0))
weightString += ", ";
}
if (pounds != 0)
{
weightString += pounds + " pound" + ((pounds!=1)?"s":"");
if (ounces != 0)
weightString += ", ";
}
if ((ounces != 0) || ((pounds == 0) && (stones == 0)))
weightString += ounces + " ounce" + ((ounces!=1)?"s":"");
return weightString;
}
}
