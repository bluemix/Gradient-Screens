import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var lightGrayColor = new Color(0xFFD6D6D6);
var loblollyColor = new Color(0xFFB9B9B9); // <color name="loblolly">#B9B9B9</color>
ThemeData appTheme() {
  return new ThemeData(
      hintColor: Colors.grey[100], //

      fontFamily: 'GE SS Light',
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: loblollyColor),
        // border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow, style: BorderStyle.none)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, style: BorderStyle.none)),
      ),
      accentColor: Colors.lime);
}

Directionality appDirectionality(Widget child) {
  return new Directionality(
    textDirection: TextDirection.ltr,
    child: new Builder(
      builder: (BuildContext context) {
        return new MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child,
        );
      },
    ),
  );
}
