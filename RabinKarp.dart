import 'NaiveSearch.dart';

//d is the number of characters in the input alphabet
const int d = 256;
int q = 101;

void RabinKarpSearch(
  String txt,
  String pat,
) {
  int M = pat.length;
  int N = txt.length;
  int i, j;
  int p = 0; // hash value for pattern
  int t = 0; // hash value for txt
  int h = 1;
  match = 0;
  mismatch = 0;
  alignments = 0;
  // The value of h would be "pow(d, M-1)%q"
  for (i = 0; i < M - 1; i++) {
    h = (h * d) % q;
  }
  // Calculate the hash value of pattern and first
  // window of text
  for (i = 0; i < M; i++) {
    p = (d * p + pat.codeUnitAt(i)) % q;
    t = (d * t + txt.codeUnitAt(i)) % q;
  }
  // Slide the pattern over text one by one
  for (i = 0; i <= N - M; i++) {
    // Check the hash values of current window of text
    // and pattern. If the hash values match then only
    // check for characters on by one
    if (p == t) {
      /* Check for characters one by one */
      for (j = 0; j < M; j++) {
        if (txt[i + j] != pat[j]) {
          mismatch++;
          break;
        } else
          match++;
      }

      // if p == t and pat[0...M-1] = txt[i, i+1, ...i+M-1]
      if (j == M) {
        occarrance.add(i);
      }
    }
    // Calculate hash value for next window of text: Remove
    // leading digit, add trailing digit
    if (i < N - M) {
      t = (d * (t - txt.codeUnitAt(i) * h) + txt.codeUnitAt(i + M)) % q;

      // We might get negative value of t, converting it
      // to positive
      if (t < 0) t = (t + q);
    }
  }
  alignments = match + mismatch;
  print(occarrance);
  print(match);
  print(mismatch);
}
