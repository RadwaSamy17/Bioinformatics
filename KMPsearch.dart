import 'NaiveSearch.dart';

List LPS = [];

void KMPsearch(String txt, String pat) {
  int M = pat.length;
  int N = txt.length;
  match = 0;
  mismatch = 0;
  alignments = 0;
  // create lps[] that will hold the longest prefix suffix values for pattern
  List lps = new List(M);
  int j = 0;
  ComputeLPSArray(
      pat, M, lps); // Preprocess the pattern (calculate lps[] array)
  int i = 0; // index for txt[]
  while (i < N) {
    if (pat[j] == txt[i]) {
      j++;
      i++;
      match++;
    }
    if (j == M) {
      occarrance.add(i - j);
      j = lps[j - 1];
    } // mismatch after j matches
    else if (i < N && pat[j] != txt[i]) {
      // Do not match lps[0..lps[j-1]] characters,
      // they will match anyway
      mismatch++;
      if (j != 0)
        j = lps[j - 1];
      else
        i = i + 1;
    }
  }
  alignments = match + mismatch;
  print(occarrance);
  print(match);
  print(mismatch);
}

void ComputeLPSArray(String pat, int M, List lps) {
  int len = 0; // length of the previous longest prefix suffix
  int i = 1;
  lps[0] = 0; // lps[0] is always 0
  // the loop calculates lps[i] for i = 1 to M-1
  while (i < M) {
    if (pat[i] == pat[len]) {
      len++;
      lps[i] = len;
      i++;
    } else {
      if (len != 0) {
        len = lps[len - 1];
      } else {
        lps[i] = len;
        i++;
      }
    }
  }
  print(lps);
  LPS = lps;
}
