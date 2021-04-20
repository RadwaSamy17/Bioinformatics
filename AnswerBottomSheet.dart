import 'package:bioinformatics/Algorithms/KMPsearch.dart';
import 'package:bioinformatics/Algorithms/NaiveSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column SmallAnswer(String t1, t2) {
  return Column(
    children: [
      SizedBox(
        height: 13,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t1,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Expanded(
              child: Text(
            t2,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
          ))
        ],
      ),
    ],
  );
}

BottomSheet AnswerBottomSheet(BuildContext context, String txt, pat, title) {
  showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.deepPurple[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      builder: (context) {
        return Container(
          height: 2 * MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              color: Colors.deepPurple[900],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      "Sequencing...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 3 * MediaQuery.of(context).size.width / 5,
                      height: 1.6,
                      color: Colors.white,
                    ),
                    SmallAnswer("Text : ", txt),
                    SmallAnswer("Pattern : ", pat),
                    if (title == "KMP Algorithm")
                      SmallAnswer("LPS : ", LPS.toString()),
                    SmallAnswer("Occarrance : ", occarrance.toString()),
                    SmallAnswer("Alignments : ", alignments.toString()),
                    SmallAnswer("Match : ", match.toString()),
                    SmallAnswer("Mismatch : ", mismatch.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[900],
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              icon: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}
