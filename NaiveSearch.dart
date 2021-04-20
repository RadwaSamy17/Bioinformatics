import 'package:flutter/material.dart';

List occarrance = [];
int alignments = 0;
int match = 0;
int mismatch = 0;
void Naive(String txt, String pat) {
  int M = pat.length;
  int N = txt.length;
  match = 0;
  mismatch = 0;
  for (int i = 0; i <= N - M; i++) {
    int j;
    /* For current index i, check for pattern  
            match */
    for (j = 0; j < M; j++)
      if (txt[i + j] != pat[j]) {
        mismatch++;
        break;
      } else
        match++;
    // if pat[0...M-1] = txt[i, i+1, ...i+M-1]

    if (j == M) {
      occarrance.add(i);
    }
  }
  alignments = match + mismatch;
  print(occarrance);
  print(alignments);
  print(match);
  print(mismatch);
}
