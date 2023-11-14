
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.InputMismatchException;
import java.util.Scanner;

public class WordLinks {

	public static String[] readDictionary()
	{
		ArrayList<String> dictionary = new ArrayList<String>();
		FileReader file = null;
		try {
			file = new FileReader("C:\\Users\\faith\\Downloads\\words.txt");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		BufferedReader reader = new BufferedReader(file);
		String word = null;
		try {
			word = reader.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
		while(word != null)
		{
			dictionary.add(word);
			try {
				word = reader.readLine();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return dictionary.toArray(new String[0]);
	}

	public static String[] readWordList(String words)
	{
		ArrayList<String> seperatedWords = new ArrayList<String>();
		String[] vals = words.split(", ");
		Collections.addAll(seperatedWords, vals);	
		return seperatedWords.toArray(new String[0]);
	}

	public static boolean isUnqiueList(String[] wordChain)
	{
		boolean unique = true;
		for(int i = 0; i < wordChain.length; i++)
		{
			String tmp = wordChain[i];
			for(int j = i + 1; j < wordChain.length; j++)
			{
				if(tmp == wordChain[j])
				{
					unique = false;
					return unique;
				}
			}
		}
		return unique;
	}

	public static boolean isEnglishWord(String word)
	{
		return Arrays.binarySearch(dictionary, word) >= 0;
	}	

	public static boolean isDifferentByOne(String one, String two)
	{
		int diff = 1;
		boolean isDiff = false;
		if(one.length() == two.length())
		{
			for(int i = 0; i< one.length(); i++)
			{
				if(one.charAt(i)!= two.charAt(i))
				{
					diff--;
					if(diff < 0)
					{
						isDiff = false;
					}
					else
					{
						isDiff = true;
					}
				}
			}
		}
		return isDiff;
	}

	public static boolean isWordChain(String[] wordChain)
	{
		if(!isUnqiueList(wordChain))
		{
			return false;
		}

		for(final String word: wordChain)
		{
			if(!isEnglishWord(word))
			{
				return false;
			}
		}

		String tmp = wordChain[0];
		for(int i = 1; i < wordChain.length; i++)
		{
			if(!isDifferentByOne(tmp, wordChain[i]))
			{
				return false;
			}
		}

		return true;
	}

	public static String[] dictionary;

	public static void main(String[] args) {

		System.out.println("WELCOME");

		dictionary = readDictionary();
		boolean quit = false;
		try {
			while(!quit)
			{
				System.out.print("Enter a comma separated list of words (or an empty list to quit): ");
				Scanner inputScanner = new Scanner(System.in);
				String words = inputScanner.nextLine();
				if(words.isEmpty())
				{
					quit = true;
					System.out.println("YOU HAVE QUIT, GOODBYE");
				}
				else if(words != null)
				{
					String[] inputWords = readWordList(words);
					System.out.println(isWordChain(inputWords) ? "Valid chain of words from Lewis Carroll's word-links game" 
							:  "Not a valid chain of words from Lewis Carroll's word-links game" );
				}
			}
		} catch (InputMismatchException exception) {
			System.out.println("ERROR: INVALID INPUT");
		}

	}
}

