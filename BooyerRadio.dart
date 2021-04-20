import 'package:flutter/material.dart';

class BooyerRadio extends StatefulWidget {
  @override
  _BooyerRadioState createState() => _BooyerRadioState();
}

enum BooyerMethods { bad, good }
BooyerMethods _character = BooyerMethods.bad;
BooyerMethods method = _character;

class _BooyerRadioState extends State<BooyerRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 60),
          title: Text(
            "Bad Character",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          leading: Radio(
              activeColor: Colors.yellow,
              value: BooyerMethods.bad,
              groupValue: _character,
              onChanged: (BooyerMethods value) {
                setState(() {
                  _character = value;
                  method = _character;
                });
              }),
        ),
        ListTile(
          // contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 60),
          title: Text(
            "Good Suffix",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          leading: Radio(
              activeColor: Colors.yellow,
              value: BooyerMethods.good,
              groupValue: _character,
              onChanged: (BooyerMethods value) {
                setState(() {
                  _character = value;
                  method = _character;
                });
              }),
        ),
      ],
    );
  }
}
