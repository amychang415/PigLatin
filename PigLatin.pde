ArrayList <String> words = new ArrayList <String>();

public void setup() 
{
	String[] lines = loadStrings("LowellHymn.txt");
 

	for (int i = 0 ; i < lines.length; i++) 
	{
	  separate( (lines[i]) );
	}

	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < words.size(); i++) 
	{
	  System.out.println(pigLatin ( words.get(i) ) );
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for (int i = 0; i<sWord.length(); i++)
  {
    if (sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u' || sWord.charAt(i) == 'A' || sWord.charAt(i) == 'E' || sWord.charAt(i) == 'I' || sWord.charAt(i) == 'O' || sWord.charAt(i) == 'U')
    {
      return i;
    }
  }
  return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	if(findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}

	if (sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2) + "qu" + "ay";
	}

	if(findFirstVowel(sWord) > 0)
	{
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0,findFirstVowel(sWord)) + "ay";
	}

	else
	{
		return "ERROR!";
	}
}


public void separate(String line)
{
int x = 0;
	for (int i = 0; i < line.length()-1; i++)
	{
		if (line.substring(i,i+1).equals(" ") || line.substring(i,i+1).equals(",") || line.substring(i,i+1).equals("."))
		{
			words.add(line.substring(x,i));
			x = i+1;
		}
	}

}