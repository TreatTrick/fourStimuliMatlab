//This function can randomise a string array's elements.

import java.util.ArrayList;  
import java.util.Collections;  
import java.util.List;

void suffleArray(String inArray[]) 
{
  List<String> list=new ArrayList<String>();
  for (int i=1; i<inArray.length; i++)
  {
    list.add(inArray[i]);
  }
  Collections.shuffle(list);
  for (int i=1; i<inArray.length; i++)
  {
    inArray[i] =list.get(i-1);
  }
}