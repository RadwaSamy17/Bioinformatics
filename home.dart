import 'package:bioinformatics/HomeCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "String Search Algorithm",
          style: TextStyle(color: Colors.deepPurple[900]),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [algorithm_list(context: context)],
      ),
    );
  }
}
