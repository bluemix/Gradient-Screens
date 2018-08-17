import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



ThemeData appTheme() {
  return new ThemeData(
      hintColor: Colors.grey,
      fontFamily: 'GE SS Light',
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