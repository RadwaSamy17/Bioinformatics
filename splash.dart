import 'dart:async';

import 'package:bioinformatics/home.dart';
import 'package:bioinformatics/showUp.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home_screen()));
    });
    super.initState();
  }

  int delayAmount = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ShowUp(
          delay: delayAmount,
          child: Stack(
            children: [
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowUp(
                    child: Container(
                      width: 170,
                      //MediaQuery.of(context).size.width,
                      height: 150,
                      // MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/dna2.png"),
                              fit: BoxFit.fill)),
                    ),
                    delay: delayAmount,
                  ),
                  ShowUp(
                    child: Text(
                      "Bioinformatics",
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 30,
                      ),
                    ),
                    delay: delayAmount + 2000,
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
