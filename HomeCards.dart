import 'package:bioinformatics/algorithm_details.dart';
import 'package:flutter/material.dart';

Widget algorithm_card(String title, String a, p, w, b, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => details(context, title, a, p, w, b)));
    },
    child: Padding(
      padding: EdgeInsets.only(top: 7, bottom: 15),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                color: Colors.deepPurple[900],
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.3)),
          ),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    right: 23,
                    left: 23,
                    bottom: 20,
                    top: MediaQuery.of(context).size.height / 11,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget algorithm_list({BuildContext context}) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        algorithm_card(
            "NAÏVE Algorithm",
            "Walking through the source starting from the beginning and checking at each position if the resulting substring equals the query pattern. While being inefficient, it may be beneficial to use it in cases where the speed advantage of another algorithm is neglegible or does not outhweigh the additional setup needed (for example if your source and query pattern are really short)",
            "None",
            "O(mn)",
            "O(m)",
            context),
        algorithm_card(
            "BOYER-MOORE Algorithm",
            "The Boyer-Moore algorithm is considered as the most efficient string-matching algorithm in usual applications. A simplified version of it or the entire algorithm is often implemented in text editors for the «search» and «substitute» commands.The algorithm scans the characters of the pattern from right to left beginning with the rightmost one. In case of a mismatch (or a complete match of the whole pattern) it uses two precomputed functions to shift the window to the right.These two shift functions are called the good-suffix shift (also called matching shift and the bad-character shift (also called the occurrence shift).",
            "O(|∑|)",
            "O(mn)",
            "O(m/n)",
            context),
        algorithm_card(
            "KMP Algorithm",
            "It makes use of previous match information to determine an amount of skips that can be made until the next position in the source gets examined as a possible match. To achieve that, a prefix table (or failure function) of the pattern needs to be computed, which determines the amount of skippable elements depending on the previous (partial) match.",
            "O(m)",
            "O(m)",
            "O(mn)",
            context),
        algorithm_card(
            "Rabin-Karp Algorithm",
            "It calculates a hash value for the pattern, as well as for each M-character subsequences of text to be compared. If the hash values are unequal, the algorithm will determine the hash value for next M-character sequence. If the hash values are equal, the algorithm will analyze the pattern and the M-character sequence. In this way, there is only one comparison per text subsequence, and character matching is only required when the hash values match.",
            "O(m)",
            "O(mn)",
            "O(m)",
            context)
      ],
    ),
  );
}
