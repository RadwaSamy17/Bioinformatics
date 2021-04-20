import 'package:bioinformatics/Algorithms/BoyerMoore.dart';
import 'package:bioinformatics/Algorithms/KMPsearch.dart';
import 'package:bioinformatics/Algorithms/NaiveSearch.dart';
import 'package:bioinformatics/Algorithms/RabinKarp.dart';
import 'package:bioinformatics/AnswerBottomSheet.dart';
import 'package:bioinformatics/BooyerRadio.dart';
import 'package:flutter/material.dart';

Widget detailsSmall(String title, t) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(
            child: Text(
          t,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        )),
      ]);
}

final textController = TextEditingController();
final patternController = TextEditingController();

Widget Formfeild(String title, hint, final controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: Container(
        height: 48,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: TextField(
            controller: controller,
            style: TextStyle(
                color: Colors.deepPurple[900],
                fontSize: 17,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none),
            expands: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
                contentPadding: EdgeInsets.only(left: 15, top: 15))),
      ))
    ],
  );
}

Widget details(BuildContext context, String title, a, p, w, b) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.deepPurple[900]),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepPurple[900],
          ),
          onPressed: () {
            Navigator.pop(context);
            textController.clear();
            patternController.clear();
          }),
    ),
    body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.deepPurple[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              detailsSmall("Approach : ", a),
              SizedBox(
                height: 10,
              ),
              detailsSmall("Preprocessing : ", p),
              SizedBox(
                height: 10,
              ),
              detailsSmall("Worst Case : ", w),
              SizedBox(
                height: 10,
              ),
              detailsSmall("Best Case : ", b),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.deepPurple[900],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Formfeild("Text  ", "DNA sequance", textController),
                SizedBox(
                  height: 20,
                ),
                Formfeild("Pattern  ", "Query", patternController),
                SizedBox(
                  height: 20,
                ),
                if (title == "BOYER-MOORE Algorithm") BooyerRadio(),
                InkWell(
                  onTap: () {
                    occarrance.clear();
                    alignments = 0;
                    switch (title) {
                      case "NAÏVE Algorithm":
                        Naive(textController.text, patternController.text);
                        break;
                      case "BOYER-MOORE Algorithm":
                        if (method == BooyerMethods.bad)
                          BadCharSearch(
                              textController.text, patternController.text);
                        else
                          GoodSuffixSearch(
                              textController.text, patternController.text);

                        break;
                      case "KMP Algorithm":
                        KMPsearch(textController.text, patternController.text);
                        break;
                      case "Rabin-Karp Algorithm":
                        RabinKarpSearch(
                            textController.text, patternController.text);
                        break;
                    }
                    /* AnswerCard(context, textController.text,
                        patternController.text, title);*/
                    AnswerBottomSheet(context, textController.text,
                        patternController.text, title);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "FIND",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.deepPurple[900],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5),
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    ),
  );
}
