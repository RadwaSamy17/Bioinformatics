import 'package:bioinformatics/Algorithms/NaiveSearch.dart';

int NO_OF_CHARS = 256;

//A utility function to get maximum of two integers
int max(int a, int b) {
  return (a > b) ? a : b;
}

List badchar = new List(NO_OF_CHARS);
//The preprocessing function for Boyer Moore's
//bad character heuristic
void badCharHeuristic(
  String str,
  int size,
) {
  int i;

  // Initialize all occurrences as -1
  for (i = 0; i < NO_OF_CHARS; i++) badchar[i] = -1;

  // Fill the actual value of last occurrence
  // of a character
  for (i = 0; i < size; i++) badchar[str.codeUnitAt(i)] = i;
}

/* A pattern searching function that uses Bad  
    Character Heuristic of Boyer Moore Algorithm */
void BadCharSearch(String txt, String pat) {
  int m = pat.length;
  int n = txt.length;
  match = 0;
  mismatch = 0;
  alignments = 0;
  /* Fill the bad character array by calling  
        the preprocessing function badCharHeuristic()  
        for given pattern */
  badCharHeuristic(
    pat,
    m,
  );

  int s = 0; // s is shift of the pattern with
  // respect to text
  while (s <= (n - m)) {
    int j = m - 1;
    /* Keep reducing index j of pattern while  
            characters of pattern and text are  
            matching at this shift s */

    for (j = m - 1; j >= 0; j--) {
      if (pat[j] == txt[s + j]) {
        match++;
      } else {
        mismatch++;
        break;
      }
    }
    /* while (j >= 0 && pat[j] == txt[s + j]) {
      j--;
      match++;
    }
  */
    /*If the pattern is present at current  
            shift, then index j will become -1 after  
            the above loop */
    if (j < 0) {
      occarrance.add(s);
      /* Shift the pattern so that the next  
                character in text aligns with the last  
                occurrence of it in pattern.  
                The condition s+m < n is necessary for  
                the case when pattern occurs at the end  
                of text */

      s += (s + m < n) ? m - badchar[txt.codeUnitAt(s + m)] : 1;
    } else {
      /* Shift the pattern so that the bad character  
                in text aligns with the last occurrence of  
                it in pattern. The max function is used to  
                make sure that we get a positive shift.  
                We may get a negative shift if the last  
                occurrence of bad character in pattern  
                is on the right side of the current  
                character. */
      s += max(1, j - badchar[txt.codeUnitAt(s + j)]);
    }
  }
  alignments = match + mismatch;
  print(occarrance);
  print("bad");
  print(mismatch);
  print(match);
}

// preprocessing for strong good suffix rule
void PreprocessStrongSuffix(List shift, List bpos, String pat, int m) {
  // m is the length of pattern
  int i = m, j = m + 1;
  bpos[i] = j;

  while (i > 0) {
    /*if character at position i-1 is not equivalent to 
          character at j-1, then continue searching to right 
          of the pattern for border */
    while (j <= m && pat[i - 1] != pat[j - 1]) {
      /* the character preceding the occurrence of t in  
               pattern P is different than the mismatching character in P,  
               we stop skipping the occurrences and shift the pattern 
               from i to j */
      if (shift[j] == 0) shift[j] = j - i;

      //Update the position of next border
      j = bpos[j];
    }
    /* p[i-1] matched with p[j-1], border is found. 
           store the  beginning position of border */
    i--;
    j--;
    bpos[i] = j;
  }
}

//Preprocessing for case 2
void PreprocessCase2(shift, List bpos, String pat, int m) {
  int i, j;
  j = bpos[0];
  for (i = 0; i <= m; i++) {
    /* set the border position of the first character  
        of the pattern to all indices in array shift 
        having shift[i] = 0 */
    if (shift[i] == 0) shift[i] = j;

    /* suffix becomes shorter than bpos[0],  
        use the position of next widest border 
        as value of j */
    if (i == j) j = bpos[j];
  }
}

/*Search for a pattern in given text using 
Boyer Moore algorithm with Good suffix rule */
void GoodSuffixSearch(String text, String pat) {
  // s is shift of the pattern
  // with respect to text
  int s = 0, j;
  int m = pat.length;
  int n = text.length;
  match = 0;
  mismatch = 0;
  alignments = 0;
  List bpos = new List(m + 1);
  List shift = new List(m + 1);

  // initialize all occurrence of shift to 0
  for (int i = 0; i < m + 1; i++) shift[i] = 0;

  // do preprocessing
  PreprocessStrongSuffix(shift, bpos, pat, m);
  PreprocessCase2(shift, bpos, pat, m);

  while (s <= n - m) {
    j = m - 1;

    /* Keep reducing index j of pattern while  
        characters of pattern and text are matching  
        at this shift s*/
    //while (j >= 0 && pat[j] == text[s + j]) j--;
    for (j = m - 1; j >= 0; j--) {
      if (pat[j] == text[s + j]) {
        match++;
      } else {
        mismatch++;
        break;
      }
    }
    /* If the pattern is present at the current shift,  
        then index j will become -1 after the above loop */
    if (j < 0) {
      occarrance.add(s);
      s += shift[0];
    } else

      /*pat[i] != pat[s+j] so shift the pattern 
            shift[j+1] times */
      s += shift[j + 1];
  }
  alignments = match + mismatch;
  print(occarrance);
  print("good");
  print(mismatch);
  print(match);
}
